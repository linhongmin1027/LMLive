//
//  LMHomeTitleView.m
//  LMLive
//
//  Created by iOSDev on 17/5/11.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMHomeTitleView.h"
@interface LMHomeTitleView ()

@property(nonatomic, strong)NSMutableArray *btnArray;
@end
@implementation LMHomeTitleView

-(instancetype)initWithTitleName:(NSArray *)title{
    self=[super initWithFrame:CGRectZero];
    if (self) {
        self.frame=CGRectMake(0, 0, kScreenWidth, BtnListHeight);
        self.btnArray=[NSMutableArray array];
        CGFloat btnWidth=kScreenWidth/title.count ;
        for (int i=0; i<title.count; i++) {
            UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(btnWidth*i, 0, btnWidth, BtnListHeight)];
            [btn setTitle:title[i] forState:UIControlStateNormal];
            if (i==0) {
             [btn setTitleColor:LMRedColor forState:UIControlStateNormal];
            }else{
            [btn setTitleColor:LMBlackColor forState:UIControlStateNormal];
            }
            btn.titleLabel.font=[UIFont systemFontOfSize:14];
            btn.tag=100+i;
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            [self.btnArray addObject:btn];
        }
        
        
    }
    return self;

}
#pragma mark  - 点击button
-(void)clickBtn:(UIButton *)btn{
    NSInteger tag=btn.tag-100;
    [self setItemSelected:tag];
    if (self.titleClickBlck) {
        self.titleClickBlck(tag);
    }



}

-(void)setItemSelected:(NSInteger )page{
    for (NSInteger i=0; i<self.btnArray.count; i++) {
        UIButton *btn=self.btnArray[i];
        if (i==page) {//选中的btn
            [btn setTitleColor:LMRedColor forState:UIControlStateNormal];
            
        }else{
        
        [btn setTitleColor:LMBlackColor forState:UIControlStateNormal];
        
        }
    }
    



}
@end
