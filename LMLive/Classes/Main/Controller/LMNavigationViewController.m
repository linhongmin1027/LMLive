//
//  LMNavigationViewController.m
//  LMLive
//
//  Created by iOSDev on 17/5/10.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMNavigationViewController.h"

@interface LMNavigationViewController ()

@end

@implementation LMNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    
}
+(void)initialize{
    UINavigationBar *navBar=[UINavigationBar appearance];
    
    [navBar setBackgroundImage:[UIImage imageNamed:@"nav_bar"] forBarMetrics:UIBarMetricsDefault];
    NSMutableDictionary *dictAttr=[NSMutableDictionary dictionary];
    dictAttr[NSFontAttributeName]=[UIFont systemFontOfSize:17];
    dictAttr[NSForegroundColorAttributeName]=LMBlackColor;
    [navBar setTitleTextAttributes:dictAttr];



}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed=YES;
        
        //返回按钮
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"back_icon"] forState:UIControlStateHighlighted];
        
        
    }




}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
