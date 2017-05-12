//
//  LMRecommendCollectionViewCell.m
//  LMLive
//
//  Created by iOSDev on 17/5/12.
//  Copyright © 2017年 linhongmin. All rights reserved.
//

#import "LMRecommendCollectionViewCell.h"
@interface LMRecommendCollectionViewCell ()
@property(nonatomic, strong)UIImageView *bgImageView;

@property(nonatomic, strong)UILabel *titleLabel;

@property(nonatomic, strong)UILabel *nickLabel;

@property(nonatomic, strong)UILabel *viewLabel;

@end
@implementation LMRecommendCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.bgImageView=[[UIImageView alloc]init];
        self.titleLabel=[[UILabel alloc]init];
        self.nickLabel=[[UILabel alloc]init];
        self.viewLabel=[[UILabel alloc]init];
        [self addSubview:self.bgImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.nickLabel];
        [self addSubview:self.viewLabel];
        [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_offset(0);
            make.bottom.mas_offset(-kHeight(20));
            
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_offset(0);
            make.bottom.equalTo(self.bgImageView.mas_bottom).mas_equalTo(0);
            make.height.mas_equalTo(kHeight(20));
            
            
            
        }];
        
        [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.bgImageView.mas_bottom).mas_offset(0);
            make.left.mas_offset(0);
            make.height.mas_equalTo(kHeight(20));
            make.width.mas_equalTo((kScreenWidth-30)*0.25);
            
        }];
        [self.viewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.bgImageView.mas_bottom).mas_offset(0);
            make.right.mas_offset(0);
            make.height.mas_equalTo(kHeight(20));
            make.width.mas_equalTo((kScreenWidth-30)*0.25);
            
        }];
    
    }

    return self;


}

-(void)setModel:(LMHomeModel *)model{
    _model=model;
    self.titleLabel.text=model.title;
    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:[UIImage imageNamed:@""]];
    self.nickLabel.text=model.nick;
    self.viewLabel.text=model.view;

}
@end
