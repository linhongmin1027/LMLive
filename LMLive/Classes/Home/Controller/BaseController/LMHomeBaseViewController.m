//
//  LMHomeBaseViewController.m
//  LMLive
//
//  Created by linhongmin on 2017/5/12.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMHomeBaseViewController.h"
#import "LMHomeModel.h"
#import "LMRecommendCollectionViewCell.h"
@interface LMHomeBaseViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic, strong)NSMutableArray *dataArray;

@property(nonatomic, strong)UICollectionView *collectionView;
@end
static NSString *LMHomeBaseCollectionCellId=@"LMHomeBaseCollectionCellId";
@implementation LMHomeBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    _dataArray=[NSMutableArray array];
    
    
}
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize=CGSizeMake((kScreenWidth-kWidth(30))*0.5, 0.2*kScreenHeight);
        flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
        UICollectionView *collectionView;
        if (self.style==LMCollectionStyleBanner) {//有banner条
            collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-49-BtnListHeight) collectionViewLayout:flowLayout];
        }else{//没有banner条
         collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-49) collectionViewLayout:flowLayout];
        
        
        }
        
        collectionView.backgroundColor=LMWhiteColor;
        collectionView.delegate=self;
        collectionView.dataSource=self;
        //cell注册
        [collectionView registerClass:[LMRecommendCollectionViewCell class] forCellWithReuseIdentifier:LMHomeBaseCollectionCellId];
        
        _collectionView=collectionView;
    }

    return _collectionView;




}
#pragma mark --  数据Url
-(void)setUrl:(NSString *)url{
    _url=url;
    [self setupNetData];


}
#pragma mark --  设置collection类型
-(void)setStyle:(LMCollectionStyle)style{
    _style=style;
    [self.view addSubview:self.collectionView];


}

#pragma mark --  加载网络数据
-(void)setupNetData{
    [LMNetworkManager GET:self.url params:nil sucessBlock:^(id object) {
        NSArray *array=object[@"data"];
        for (NSDictionary *dict in array) {
            LMHomeModel *model=[LMHomeModel mj_objectWithKeyValues:dict];
            [_dataArray addObject:model];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
            
        });
    } failBlock:^(NSError *error) {
        
    } progress:nil];



}
#pragma mark  - UICollectionViewDataSource

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LMRecommendCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:LMHomeBaseCollectionCellId forIndexPath:indexPath];
    LMHomeModel *model=_dataArray[indexPath.row];
    cell.model=model;
    
    return cell;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //距离边界位置(上,右,下,左)
    return UIEdgeInsetsMake(0, 10, 10,10);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
