//
//  UIImage+LMAdd.h
//  LMLive
//
//  Created by iOSDev on 17/5/12.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *压缩图片
 *
 */

@interface UIImage (LMAdd)
+(UIImage *)IMGCompressed:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

/**
 *  获取圆角图片
 *
 *  @param image       <#image description#>
 *  @param borderWidth <#borderWidth description#>
 *  @param color       <#color description#>
 *
 *  @return <#return value description#>
 */

+ (UIImage *)imageWithClipImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)color;
@end
