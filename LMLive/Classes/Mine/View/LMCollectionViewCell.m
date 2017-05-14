//
//  LMCollectionViewCell.m
//  LMLive
//
//  Created by iOSDev on 17/5/14.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMCollectionViewCell.h"
@interface LMCollectionViewCell ()
/**  图标  */
@property(nonatomic, weak)UIImageView *iconImg;
/**  标题  */
@property(nonatomic, weak)UILabel *titleLabel;


@end
@implementation LMCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
       
        
      
        
    }
    return self;

}

-(void)setModel:(LMMineModel *)model{
    _model=model;
    self.iconImg.image=[UIImage imageNamed:model.icon];
    self.titleLabel.text=model.title;






}
#pragma mark  - 布局

-(void)layoutSubviews{
    [super layoutSubviews];
    //图标
    [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.equalTo(self).insets(UIEdgeInsetsMake(30, 40, 50, 40));
        
    }];
    
    //标题
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImg.mas_bottom).mas_offset(20);
        make.left.mas_offset(0);
        make.width.equalTo(self.mas_width);
        make.height.mas_equalTo(20);
        
    }];
    







}
-(UIImageView *)iconImg{
    if (!_iconImg) {
        UIImageView *iconImg=[[UIImageView alloc]init];
        [self addSubview:iconImg];
        _iconImg=iconImg;
    }
    return _iconImg;
    
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *titleLabel=[[UILabel alloc]init];
        [self addSubview:titleLabel];
        titleLabel.textAlignment=NSTextAlignmentCenter;
        titleLabel.font=[UIFont boldSystemFontOfSize:15];
        _titleLabel=titleLabel;
    }
    return _titleLabel;
}

@end
