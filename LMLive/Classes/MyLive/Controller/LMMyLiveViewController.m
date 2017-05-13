//
//  LMMyLiveViewController.m
//  LMLive
//
//  Created by iOSDev on 17/5/10.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMMyLiveViewController.h"

@interface LMMyLiveViewController ()

@end

@implementation LMMyLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    
}
-(void)setUpUI{
    UIImageView *bgImageView=[[UIImageView alloc]init];
    bgImageView.image=[UIImage imageNamed:@"img_popup_sp_player_xiaowu"];
    UILabel *label=[[UILabel alloc]init];
    
    label.text=@"开启直播，走上人生巅峰";
    label.textColor=LMLightColor;
    label.textAlignment=NSTextAlignmentCenter;
    UIButton *showBtn=[[UIButton alloc]init];
    [showBtn setTitle:@"开启直播" forState:UIControlStateNormal];
    [showBtn addTarget:self action:@selector(openLive) forControlEvents:UIControlEventTouchUpInside];
    [showBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    showBtn.layer.borderWidth=1.0;
    showBtn.layer.borderColor=[UIColor redColor].CGColor;
    showBtn.layer.cornerRadius=15;
    showBtn.layer.masksToBounds=YES;
    [self.view addSubview:bgImageView];
    [self.view addSubview:label];
    [self.view addSubview:showBtn];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_offset(100);
        make.width.mas_equalTo(189);
        make.height.mas_equalTo(201);
    }];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(bgImageView);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(kScreenWidth);
        make.top.mas_offset(315);
        
    }];
    [showBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(bgImageView);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(200);
        make.top.mas_offset(360);
        
    }];
    
    
    
}
#pragma mark  - 开启直播
-(void)openLive{



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
