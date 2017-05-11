//
//  LMTabBarController.m
//  LMLive
//
//  Created by iOSDev on 17/5/10.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMTabBarController.h"
#import "LMNavigationViewController.h"
#import "LMHomeViewController.h"
#import "LMLiveViewController.h"
#import "LMMyLiveViewController.h"
#import "LMMineViewController.h"
@interface LMTabBarController ()

@end

@implementation LMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildControllers];
 
}
-(void)setupChildControllers{
    //首页
    LMHomeViewController *homeController=[[LMHomeViewController alloc]init];
    
    [self addOneChildControllerToTabBar:homeController
                                  title:@"首页"
                        normalImageName:@"btn_tabbar_home_normal"
                      selectedImageName:@"btn_tabbar_home_selected"];
    
    //直播
    LMLiveViewController *liveController=[[LMLiveViewController alloc]init];
    [self addOneChildControllerToTabBar:liveController
                                  title:@"直播"
                        normalImageName:@"btn_tabbar_guanzhu_normal"
                      selectedImageName:@"btn_tabbar_guanzhu_selected"];
    //主播
    LMMyLiveViewController *myLiveController=[[LMMyLiveViewController alloc]init];
    [self addOneChildControllerToTabBar:myLiveController
                                  title:@"主播"
                        normalImageName:@"btn_tabbar_zhibo_normal"
                      selectedImageName:@"btn_tabbar_zhibo_selected"];
    //我的
    LMMineViewController *mineController=[[LMMineViewController alloc]init];
    [self addOneChildControllerToTabBar:mineController
                                  title:@"我的"
                        normalImageName:@"btn_tabbar_wode_normal"
                      selectedImageName:@"btn_tabbar_wode_selected"];
    
    







}
-(void)addOneChildControllerToTabBar:(UIViewController *)controller
                               title:(NSString *)title
                     normalImageName:(NSString *)normalName
                   selectedImageName:(NSString *)selectedName{
    //标题
    controller.tabBarItem.title=title;
    controller.navigationItem.title=title;
    
    //默认图片
    controller.tabBarItem.image=[UIImage imageNamed:normalName];
    
    //选择图片 苹果默认渲染 取消渲染
    UIImage *selectedImage=[[UIImage imageNamed:selectedName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    controller.tabBarItem.selectedImage=selectedImage;
    
    //选中文字颜色
    NSMutableDictionary *dict=[NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName]=[UIColor redColor];
    [controller.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    //添加到导航控制器
    LMNavigationViewController *naviController=[[LMNavigationViewController alloc]initWithRootViewController:controller];
    naviController.navigationBar.translucent=NO;
    [self addChildViewController:naviController];
    




}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
