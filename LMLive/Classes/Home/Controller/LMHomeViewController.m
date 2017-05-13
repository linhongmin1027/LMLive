//
//  LMHomeViewController.m
//  LMLive
//
//  Created by iOSDev on 17/5/10.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMHomeViewController.h"
#import "LMSegmentView.h"

#import "LMRecommendViewController.h"
#import "LMLOLViewController.h"
#import "LMShowingViewController.h"
#import "LMHuWaiViewController.h"
#import "LMWangzeViewController.h"
@interface LMHomeViewController ()
@property(nonatomic, copy)NSArray *titleArray;
@property(nonatomic, strong)NSArray *controllersArray;

@property(nonatomic, strong)LMSegmentView *segmentView;
@end

@implementation LMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupOriginalData];
    [self setupSubviews];
    
}
-(void)setupOriginalData{
    self.titleArray=@[@"精彩推荐",@"英雄联盟",@"Showing",@"户外直播",@"王者荣耀"];
    
    //精彩推荐
    LMRecommendViewController *c1=[[LMRecommendViewController alloc]init];
    
    //英雄联盟
     LMLOLViewController *c2=[[LMLOLViewController alloc]init];
    
    
    //showing
     LMShowingViewController *c3=[[LMShowingViewController alloc]init];
    
    //户外直播
     LMHuWaiViewController *c4=[[LMHuWaiViewController alloc]init];
    
    
    //王者荣耀
     LMWangzeViewController *c5=[[LMWangzeViewController alloc]init];
    
  
   
    self.controllersArray=@[c1,c2,c3,c4,c5];




}
-(void)setupSubviews{
    
    [self.view addSubview:self.segmentView];



}
-(LMSegmentView *)segmentView{
    if (!_segmentView) {
        LMSegmentView *segmentView=[[LMSegmentView alloc]initWithFrame:self.view.bounds controllers:_controllersArray titiles:_titleArray parentController:self];
        _segmentView=segmentView;
    }
    return _segmentView;






}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
