//
//  LMHuWaiViewController.m
//  LMLive
//
//  Created by iOSDev on 17/5/13.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMHuWaiViewController.h"

@interface LMHuWaiViewController ()

@end

@implementation LMHuWaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.url=LMHuWaiUrl;
    self.style=LMCollectionStyleBanner;
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
