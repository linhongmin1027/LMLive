//
//  LMLiveViewController.m
//  LMLive
//
//  Created by iOSDev on 17/5/10.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMLiveViewController.h"

@interface LMLiveViewController ()

@end

@implementation LMLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self LoadLiveView];
   
}
-(void)LoadLiveView{
    
    self.style=LMCollectionStyleNone;
    self.url=LMPlayUrl;
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
