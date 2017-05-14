//
//  LMMineViewController.m
//  LMLive
//
//  Created by iOSDev on 17/5/13.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMMineViewController.h"
#import "LMMineModel.h"
#import "LMCollectionViewCell.h"
#import "LHMImagePicker.h"
#import "LMAccount.h"
#define LMMineHeight (250)
@interface LMMineViewController ()<UINavigationControllerDelegate ,UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic, strong)UICollectionView *collectionView;
//按钮数据
@property(nonatomic, copy)NSArray *iconArray;
@property(nonatomic, copy)NSArray *titleArray;
@property(nonatomic, strong)NSMutableArray *dataArray;

//用户头像
@property(nonatomic, strong)UIImageView *userImageView;

//用户信息
@property(nonatomic,strong)LMAccount *account;
@end

static NSString *const LMCollectionCellId=@"LMCollectionCellId";
static NSString *const LMMineSctionHeadViewId=@"LMMineSctionHeadViewId";
@implementation LMMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.account=[LMAccount getAccount];
    if (!self.account) {
        self.account=[[LMAccount alloc]init];
    }
    
    self.navigationController.delegate=self;
    [self setupData];
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.view addSubview:self.collectionView];
}
#pragma mark  - 数据初始化
-(void)setupData{
    _dataArray=[NSMutableArray array];
    _iconArray=@[@"充值",@"分享",@"客服",@"我要直播",@"清除缓存",@"关于我们"];
    _titleArray=@[@"充值",@"分享App",@"客服",@"我的直播",@"清除缓存",@"关于我们"];
    for (int i=0; i<_titleArray.count; i++) {
        LMMineModel *model=[[LMMineModel alloc]init];
        model.icon=_iconArray[i];
        model.title=_titleArray[i];
        [_dataArray addObject:model];
    }


}
#pragma mark  - 懒加载
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize=CGSizeMake((kScreenWidth-30)/3, (kScreenWidth-30)/3);
        flowLayout.minimumLineSpacing=0;
        flowLayout.minimumInteritemSpacing=0;
        flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
        UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-kTabBarHeight) collectionViewLayout:flowLayout];
        collectionView.backgroundColor=LMWhiteColor;
        collectionView.delegate=self;
        collectionView.dataSource=self;
        //注册cell
        [collectionView registerClass:[LMCollectionViewCell class] forCellWithReuseIdentifier:LMCollectionCellId];
        
        //注册头视图
        [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:LMMineSctionHeadViewId];
        
        _collectionView=collectionView;
    }
    return _collectionView;


}

#pragma mark  - UICollectionViewDataSource
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LMCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:LMCollectionCellId forIndexPath:indexPath];
    
    cell.model=_dataArray[indexPath.row];
    return cell;
    

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{


}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind ==UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:LMMineSctionHeadViewId forIndexPath:indexPath];
        [self setupHeadView:headView];
        return headView;
        
    }

    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(kScreenWidth, LMMineHeight);


}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
    



}
#pragma mark  - 设置组的头视图
-(void)setupHeadView:(UIView *)headView{
    [headView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIImageView *bgImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, headView.bounds.size.width, headView.size.height)];
    bgImageView.image=[UIImage imageNamed:@"background"];
    [headView addSubview:bgImageView];
    
    self.userImageView=[[UIImageView alloc]init];
    
    if (self.account.avartImg==nil) {
        self.userImageView.image=[UIImage imageNamed:@"user_logo"];
    }else{
    
        self.userImageView.image=self.account.avartImg;
    
    }
    
    
    
    self.userImageView.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeAvatarImage)];
    
    [self.userImageView addGestureRecognizer:tap];
    
    
    [headView insertSubview:self.userImageView aboveSubview:bgImageView];
    
    
    UILabel *nickLabel=[[UILabel alloc]init];
    nickLabel.text=@"LBJ敏";
    nickLabel.textAlignment=NSTextAlignmentCenter;
    nickLabel.textColor=LMYellowColor;
    [bgImageView addSubview:nickLabel];
    
    UILabel *detailLabel=[[UILabel alloc]init];
    detailLabel.text=@"咪咪直播-用心创造快乐";
    detailLabel.textAlignment=NSTextAlignmentCenter;
    detailLabel.textColor=LMYellowColor;
    [bgImageView addSubview:detailLabel];
    
    
    [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(headView);
        make.width.height.mas_equalTo(80);
        
    }];
    
    [nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userImageView.mas_bottom).mas_offset(10);
        make.width.mas_equalTo(kScreenWidth);
        make.left.mas_offset(0);
        make.height.mas_equalTo(20);
        
        
    }];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nickLabel.mas_bottom).mas_offset(5);
        make.width.mas_equalTo(kScreenWidth);
        make.left.mas_offset(0);
        make.height.mas_equalTo(20);
        
        
    }];
}

#pragma mark  - 更换头像
-(void)changeAvatarImage{
    [[LHMImagePicker sharedInstance] setEditType:LMEditTypeSquare];
    [[LHMImagePicker sharedInstance] getImageFromViewController:self image:nil editedImage:^(UIImage *editedImage) {
        
      UIImage*  clipImage=[UIImage imageWithClipImage:editedImage borderWidth:0.0f borderColor:nil];
        
      self.account.avartImg=clipImage;
        self.userImageView.image=clipImage;
        [self.account saveAccount];
        
    }];
}

#pragma mark  - UINavigationControllerDelegate
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    BOOL isHidden=[viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isHidden];

}
@end
