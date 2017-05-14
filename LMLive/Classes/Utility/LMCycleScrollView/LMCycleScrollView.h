//
//  LMCycleScrollView.h
//  LMLive
//
//  Created by iOSDev on 17/5/14.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMCycleScrollView : UIView

/**  占位图片  */
@property(nonatomic, strong)UIImage *placeholdImage;
/**  链接数组  */
@property(nonatomic, strong)NSArray *urlStringArray;

/**  初始化方法  */
+(instancetype)cycleScrollViewWithFrame:(CGRect)frame imageUrl:(NSArray *)urlArray;
@end
