//
//  LMRecommendViewController.m
//  LMLive
//
//  Created by iOSDev on 17/5/12.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMRecommendViewController.h"
#import "LMRecommendCollectionViewCell.h"
#import "LMHomeSectionModel.h"
#import "LMHomeModel.h"

#import "LMLiveViewController.h"
#import "LMShowingViewController.h"
#import "LMWangzeViewController.h"
#import "LMLOLViewController.h"
#import "LMHomeBaseViewController.h"
@interface LMRecommendViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
/**  容器  */
@property(nonatomic, strong)UICollectionView * contrainCollectionView;

@property(nonatomic, strong)NSMutableArray *sectionArray;

@property(nonatomic, strong)NSMutableArray *dataArray;
/**  滚动视图  */
@property(nonatomic, strong)UIView *bannerView;
@end

static NSString * const RecommendCollectionSectionHeaderId=@"RecommendCollectionSectionHeaderId";
static NSString * const RecommendCollectionSectionFirstHeaderId=@"RecommendCollectionSectionFirstHeaderId";

static NSString * const RecommendCollectionCellId=@"RecommendCollectionCellId";

@implementation LMRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupOriginalData];
    [self setupNetData];
    [self.view addSubview:self.contrainCollectionView];
    
}
-(void)setupOriginalData{
    self.sectionArray=[NSMutableArray array];
    self.dataArray=[NSMutableArray array];



}
#pragma mark  - 加载网络数据
-(void)setupNetData{
  [LMNetworkManager GET:LMRecommendUrl params:nil sucessBlock:^(id object) {
      NSArray * allArray=object[@"room"];
      
      for (NSDictionary *dict in allArray) {
          if (self.sectionArray.count<8) {
              NSMutableArray *tempArray=[NSMutableArray array];
              //解析组数据
              LMHomeSectionModel *sectionModel=[LMHomeSectionModel mj_objectWithKeyValues:dict];
              [self.sectionArray addObject:sectionModel];
              
              //解析单个元素
              NSArray *array=dict[@"list"];
              for (NSDictionary *dict1 in array) {
                  LMHomeModel *model=[LMHomeModel mj_objectWithKeyValues:dict1];
                  [tempArray addObject:model];
              }
              [self.dataArray addObject:tempArray];
          }
                }
  
      //回到主线程刷新UI
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.contrainCollectionView reloadData];
        
    });
      
      
      
  } failBlock:^(NSError *error) {
      
      
      
  } progress:nil];





}
-(UICollectionView *)contrainCollectionView{
    if (!_contrainCollectionView) {
        
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize=CGSizeMake((kScreenWidth-kWidth(30))*0.5, 0.2*kScreenHeight);
        flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;
        UICollectionView *contrainCollectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-BtnListHeight-64-49) collectionViewLayout:flowLayout];
        contrainCollectionView.backgroundColor=LMWhiteColor;
        contrainCollectionView.delegate=self;
        contrainCollectionView.dataSource=self;
        
        //组头视图注册
        [contrainCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:RecommendCollectionSectionFirstHeaderId];
        [contrainCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:RecommendCollectionSectionHeaderId];
        
        //cell注册
        [contrainCollectionView registerClass:[LMRecommendCollectionViewCell class] forCellWithReuseIdentifier:RecommendCollectionCellId];
 
        _contrainCollectionView=contrainCollectionView;
        
    }
    return _contrainCollectionView;
}
#pragma mark  - 滚动视图
-(UIView *)bannerView{
    if (!_bannerView) {
        UIView *bannerView=[[UIView alloc]init];
        bannerView.backgroundColor=[UIColor redColor];
        _bannerView=bannerView;
    }
    return _bannerView;




}
#pragma mark  - UICollectionViewDataSource

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LMRecommendCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:RecommendCollectionCellId forIndexPath:indexPath];
    LMHomeModel *model=_dataArray[indexPath.section][indexPath.row];
    cell.model=model;
    
    return cell;

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_dataArray[section] count];


}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataArray.count;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{


}
#pragma mark  - 头视图的复用
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //头部视图
    if (kind ==UICollectionElementKindSectionHeader) {
        if (indexPath.section==0) {//有轮播图
            UICollectionReusableView *headView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:RecommendCollectionSectionFirstHeaderId forIndexPath:indexPath];
            
            [self setupHeadView:headView atIndexPath:indexPath];
            
            return headView;
            
            
        }else{
            UICollectionReusableView *headView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:RecommendCollectionSectionHeaderId forIndexPath:indexPath];
            
            [self setupHeadView:headView atIndexPath:indexPath];
        
        return headView;
        }
        
        
    }
    return nil;
}

//设置头视图的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return CGSizeMake(kScreenWidth, LMHomeSectionHeight+LMHomeBannerHeight);
    }else{
        return CGSizeMake(kScreenWidth, LMHomeSectionHeight);
    }
    
    
}
#pragma mark  - 设置边距
-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //距离边界位置(上,右,下,左)
    return UIEdgeInsetsMake(0, 10, 10,10);
}

#pragma mark  - 设置组的头视图
-(void)setupHeadView:(UIView *)headView atIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        LMHomeSectionModel *sectionModel=self.sectionArray[indexPath.section];
        headView.backgroundColor=LMWhiteColor;
        //滚动视图
        [headView addSubview:self.bannerView];
        //lineView
        UIView *lineView=[[UIView alloc]init];
        lineView.backgroundColor=LMLightColor;
        [headView addSubview:lineView];
        
        //标题
        UILabel *titleLabel=[[UILabel alloc]init];
        titleLabel.text=[NSString stringWithFormat:@"%@", sectionModel.name];
        titleLabel.font=[UIFont boldSystemFontOfSize:17];
        
        [headView addSubview:titleLabel];
        UIButton *moreBtn=[[UIButton alloc]init];
        //更多按钮
        [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        moreBtn.titleLabel.font=[UIFont systemFontOfSize:15];
        [moreBtn setTitleColor:LMLightGrayColor forState:UIControlStateNormal];
        [moreBtn addTarget:self action:@selector(clickMoreBtn:) forControlEvents:UIControlEventTouchUpInside];
        moreBtn.tag=200+indexPath.section;
        
        [headView addSubview:moreBtn];
        
        //布局
        [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_offset(0);
            make.height.mas_equalTo(LMHomeBannerHeight);
            
        }];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bannerView.mas_bottom).mas_offset(0);
            make.height.mas_equalTo(10);
            make.left.right.mas_offset(0);
            
        }];
        
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(kWidth(10));
            make.top.equalTo(lineView.mas_bottom).mas_offset(0);
            make.bottom.mas_offset(0);
            make.width.mas_equalTo(0.5*kScreenWidth);
            
        }];
        [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(10);
            make.bottom.mas_offset(0);
            make.top.equalTo(lineView.mas_bottom).mas_offset(0);
            make.width.mas_equalTo(kWidth(80));
        }];
        
        
        
        
    }else{
        [headView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        LMHomeSectionModel *sectionModel=self.sectionArray[indexPath.section];
        headView.backgroundColor=LMWhiteColor;
        
        //lineView
        UIView *lineView=[[UIView alloc]init];
        lineView.backgroundColor=LMLightColor;
        [headView addSubview:lineView];
        
        //标题
        UILabel *titleLabel=[[UILabel alloc]init];
        titleLabel.text=[NSString stringWithFormat:@"%@", sectionModel.name];
        titleLabel.font=[UIFont boldSystemFontOfSize:17];

        [headView addSubview:titleLabel];
        UIButton *moreBtn=[[UIButton alloc]init];
        //更多按钮
        [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        moreBtn.titleLabel.font=[UIFont systemFontOfSize:15];
        [moreBtn setTitleColor:LMLightGrayColor forState:UIControlStateNormal];
        [moreBtn addTarget:self action:@selector(clickMoreBtn:) forControlEvents:UIControlEventTouchUpInside];
        moreBtn.tag=200+indexPath.section;
        [headView addSubview:moreBtn];
        
        //布局
        [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_offset(0);
            make.height.mas_equalTo(LMHomeBannerHeight);
            
        }];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(0);
            make.height.mas_equalTo(10);
            make.left.right.mas_offset(0);
            
        }];
        
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(kWidth(10));
            make.top.equalTo(lineView.mas_bottom).mas_offset(0);
            make.bottom.mas_offset(0);
            make.width.mas_equalTo(0.5*kScreenWidth);
            
        }];
        [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(10);
            make.bottom.mas_offset(0);
            make.top.equalTo(lineView.mas_bottom).mas_offset(0);
            make.width.mas_equalTo(kWidth(80));
        }];
        
    
    
    }

}

#pragma mark  - 点击更多按钮
-(void)clickMoreBtn:(UIButton *)btn{
    NSInteger section=btn.tag-200;
    
    
    if (section==0) {//全部
        LMLiveViewController *liveController=[[LMLiveViewController alloc]init];
        [self.navigationController pushViewController:liveController animated:YES];
        
    }else if (section==1){//showing
        LMShowingViewController *showController=[[LMShowingViewController alloc]init];
        [self.navigationController pushViewController:showController animated:YES];
    
    }else if (section==2){//王者荣耀
        LMWangzeViewController *wangzeController=[[LMWangzeViewController alloc]init];
        [self.navigationController pushViewController:wangzeController animated:YES];
        
    }else if (section==3){//全民星秀
        LMHomeBaseViewController *baseController=[[LMHomeBaseViewController alloc]init];
        baseController.style=LMCollectionStyleNone;
        baseController.url=LMBeautyUrl;
        [self.navigationController pushViewController:baseController animated:YES];
    }else if (section==4){//英雄联盟
        LMLOLViewController *lolController=[[LMLOLViewController alloc]init];
        [self.navigationController pushViewController:lolController animated:YES];
        
    }else if (section==5){//全民户外
        LMHomeBaseViewController *baseController=[[LMHomeBaseViewController alloc]init];
        baseController.style=LMCollectionStyleNone;
        baseController.url=LMHuWaiUrl;
        [self.navigationController pushViewController:baseController animated:YES];
        
    }else if (section==6){//守望先锋
        LMHomeBaseViewController *baseController=[[LMHomeBaseViewController alloc]init];
        baseController.style=LMCollectionStyleNone;
        baseController.url=LMOverwatchUrl;
        [self.navigationController pushViewController:baseController animated:YES];
        
    }else if (section==7){//炉石传说
        LMHomeBaseViewController *baseController=[[LMHomeBaseViewController alloc]init];
        baseController.style=LMCollectionStyleNone;
        baseController.url=LMHeartStoneUrl;
        [self.navigationController pushViewController:baseController animated:YES];
        
    }



}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
