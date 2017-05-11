//
//  LMSegmentView.h
//  LMLive
//
//  Created by iOSDev on 17/5/11.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMSegmentView : UIView
-(instancetype)initWithFrame:(CGRect)frame controllers:(NSArray *)controllers titiles:(NSArray *)titles parentController:(UIViewController *)parentController;
@end
