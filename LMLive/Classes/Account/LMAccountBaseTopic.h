//
//  LMAccountBaseTopic.h
//  LMLive
//
//  Created by iOSDev on 17/5/14.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMAccountBaseTopic : NSObject

/**  存储账号信息  */
-(void)saveAccount;


/**  获取账号信息  */
+(id)getAccount;
@end
