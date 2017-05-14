//
//  LMCycleScrollView.m
//  LMLive
//
//  Created by iOSDev on 17/5/14.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMCycleScrollView.h"
#import "LMCycleViewCell.h"


@interface LMCycleScrollView ()<UICollectionViewDelegate,UICollectionViewDataSource>

/**  总cell的个数  */
@property(nonatomic, assign)NSInteger totalUrlCount;

@property(nonatomic, strong)UICollectionView *collectionView;

@end

static NSString *const LMCycleCollectionItemId=@"LMCycleCollectionItemId";
@implementation LMCycleScrollView

+(instancetype)cycleScrollViewWithFrame:(CGRect)frame imageUrl:(NSArray *)urlArray{
    LMCycleScrollView *cycleScrollView=[[LMCycleScrollView alloc]initWithFrame:frame];
    cycleScrollView.urlStringArray=urlArray;
    return cycleScrollView;

}
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self initlization];
        [self setupMainView];
        
    }
    
    return self;

}
#pragma mark  - 配置参数
-(void)initlization{
    
    





}
-(void)setupMainView{
    [self addSubview:self.collectionView];




}
-(void)setUrlStringArray:(NSArray *)urlStringArray{
    _urlStringArray=urlStringArray;
    if (urlStringArray.count==0) return;
    _totalUrlCount=urlStringArray.count *100;
    //[self.collectionView reloadData];





}
#pragma mark  - collectionView
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize=CGSizeMake(kScreenWidth ,self.bounds.size.height);
       
        flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        
        UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
        collectionView.backgroundColor=LMWhiteColor;
        collectionView.delegate=self;
        collectionView.dataSource=self;
        collectionView.pagingEnabled=YES;
        //注册cell
        [collectionView registerClass:[LMCycleViewCell class] forCellWithReuseIdentifier:LMCycleCollectionItemId];
        _collectionView=collectionView;
        
    }
    
    return _collectionView;
}

#pragma mark  - UICollectionViewDataSource
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger currentIndex=indexPath.row % self.urlStringArray.count;
    LMCycleViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:LMCycleCollectionItemId forIndexPath:indexPath];
    NSString *urlString=self.urlStringArray[currentIndex];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:urlString] placeholderImage:self.placeholdImage];
    
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _totalUrlCount;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;

}


@end
