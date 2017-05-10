//
//  LMLaunchViewController.m
//  LMLive
//
//  Created by iOSDev on 17/5/10.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMLaunchViewController.h"
#import "LMTabBarController.h"
@interface LMLaunchViewController ()

@end

@implementation LMLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self loadTabBarController];



}
-(void)loadTabBarController{
    LMTabBarController *tabBarController=[[LMTabBarController alloc]init];
    
    [UIApplication sharedApplication].keyWindow.rootViewController=tabBarController;
    [[UIApplication sharedApplication].keyWindow sendSubviewToBack:[UIApplication sharedApplication].keyWindow.rootViewController.view];
    





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
