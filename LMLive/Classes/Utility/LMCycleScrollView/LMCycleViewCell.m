//
//  LMCycleViewCell.m
//  LMLive
//
//  Created by iOSDev on 17/5/14.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMCycleViewCell.h"
@interface LMCycleViewCell ()


@end
@implementation LMCycleViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}
-(UIImageView *)imageView{
    if (!_imageView) {
        UIImageView *imageView=[[UIImageView alloc]init];
        [self addSubview:imageView];
        

        _imageView=imageView;
    }
    return _imageView;

}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_offset(0);
        
    }];




}
@end
