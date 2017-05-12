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
    LMRecommendViewController *c1=[[LMRecommendViewController alloc]init];
     UIViewController *c2=[[UIViewController alloc]init];
     UIViewController *c3=[[UIViewController alloc]init];
     UIViewController *c4=[[UIViewController alloc]init];
     UIViewController *c5=[[UIViewController alloc]init];
  
    c2.view.backgroundColor=LMGreenColor;
    c3.view.backgroundColor=LMBlueColor;
    c4.view.backgroundColor=LMYellowColor;
    c5.view.backgroundColor=LMCyanColor;
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
