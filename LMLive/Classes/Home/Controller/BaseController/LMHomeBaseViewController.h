//
//  LMHomeBaseViewController.h
//  LMLive
//
//  Created by linhongmin on 2017/5/12.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger ,LMCollectionStyle) {
    LMCollectionStyleBanner ,
    LMCollectionStyleNone

};
@interface LMHomeBaseViewController : UIViewController
@property(nonatomic ,copy)NSString *url;

@property(nonatomic, assign)LMCollectionStyle style;
@end
