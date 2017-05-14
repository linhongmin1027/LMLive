//
//  LMAccountBaseTopic.m
//  LMLive
//
//  Created by iOSDev on 17/5/14.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMAccountBaseTopic.h"
#import <objc/runtime.h>

@implementation LMAccountBaseTopic

- (id)initWithCoder:(NSCoder *)decoder{
    if (self=[super init]) {
        unsigned int count=0;
        //获取类中的所有成员变量
        Ivar *ivar=class_copyIvarList([self class], &count);
        for (int i=0; i<count; i++) {
            Ivar iva=ivar[i];
            const char *name=ivar_getName(iva);
            NSString *strName=[NSString stringWithUTF8String:name];
            //进行解档读值
            id value=[decoder decodeObjectForKey:strName];
            
            //利用KVC进行赋值
            [self setValue:value forKey:strName];
            
        }
        free(ivar);
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    unsigned int count;
    Ivar *ivar = class_copyIvarList([self class], &count);
    for (int i=0; i<count; i++) {
        Ivar iv = ivar[i];
        const char *name = ivar_getName(iv);
        NSString *strName = [NSString stringWithUTF8String:name];
        //利用KVC取值
        id value = [self valueForKey:strName];
        [encoder encodeObject:value forKey:strName];
    }
    free(ivar);
}

/**  存储  */
-(void)saveAccount{
    NSString *filePath=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:@"/LMUser.data"];
    [NSKeyedArchiver archiveRootObject:self toFile:filePath];




}

/**  获取account  */
+(id)getAccount{
      NSString *filePath=[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:@"/LMUser.data"];
    
    id account =[NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    return  account;

}
@end
