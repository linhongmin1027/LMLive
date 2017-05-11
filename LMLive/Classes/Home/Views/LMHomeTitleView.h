//
//  LMHomeTitleView.h
//  LMLive
//
//  Created by iOSDev on 17/5/11.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^titleClickBlck)(NSInteger);
@interface LMHomeTitleView : UIView

@property(nonatomic, copy)titleClickBlck titleClickBlck ;

-(instancetype)initWithTitleName:(NSArray *)title;

-(void)setItemSelected:(NSInteger )page;
@end
