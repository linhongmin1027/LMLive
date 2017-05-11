//
//  LMSegmentView.m
//  LMLive
//
//  Created by iOSDev on 17/5/11.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMSegmentView.h"
#import "LMHomeTitleView.h"
@interface LMSegmentView ()<UIScrollViewDelegate>
/**  头部视图  */
@property(nonatomic, strong)LMHomeTitleView *titleView;
/**  容器ScrollView  */
@property(nonatomic, strong)UIScrollView *contrainScrollView;
@end
@implementation LMSegmentView

-(instancetype)initWithFrame:(CGRect)frame controllers:(NSArray *)controllers titiles:(NSArray *)titles parentController:(UIViewController *)parentController {
    self=[super initWithFrame:frame];
    if (self) {
        self.titleView=[[LMHomeTitleView alloc]initWithTitleName:titles];
        @weakify(self);
        self.titleView.titleClickBlck=^(NSInteger row){
            @strongify(self);
            if (self.contrainScrollView) {
                self.contrainScrollView.contentOffset=CGPointMake(kScreenWidth*row, 0);
            }
        };
        [self addSubview:self.titleView];
        self.contrainScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, BtnListHeight, frame.size.width ,frame.size.height-BtnListHeight)];
        self.contrainScrollView.contentSize=CGSizeMake(frame.size.width*controllers.count, 0);
        self.contrainScrollView.delegate=self;
        self.contrainScrollView.pagingEnabled=YES;
        self.contrainScrollView.showsVerticalScrollIndicator=NO;
        self.contrainScrollView.showsHorizontalScrollIndicator=NO;
        self.contrainScrollView.directionalLockEnabled=YES;
        self.contrainScrollView.bounces=NO;
        //添加子控制器视图
        for (int i=0; i<controllers.count; i++) {
            UIViewController *controller=controllers[i];
            controller.view.frame=CGRectMake(i*frame.size.width, 0, frame.size.width, frame.size.height-BtnListHeight);
            [self.contrainScrollView addSubview:controller.view];
            [parentController addChildViewController:controller];
            [controller didMoveToParentViewController:parentController];
        }
        [self addSubview:self.contrainScrollView];

    }
    return self;





}
#pragma mark  - UIScrollViewDelegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offSetX=scrollView.contentOffset.x;
    //当前页
    NSInteger page=offSetX/kScreenWidth ;
    [self.titleView setItemSelected:page];
    







}
@end
