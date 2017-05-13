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
        self.titleLabel.font=[UIFont systemFontOfSize:12];
        self.titleLabel.textColor=LMWhiteColor;
        
        
        self.nickLabel=[[UILabel alloc]init];
        self.nickLabel.font=[UIFont systemFontOfSize:13];
        
        
        self.viewLabel=[[UILabel alloc]init];
        self.viewLabel.font=[UIFont systemFontOfSize:11];
        self.viewLabel.textAlignment=NSTextAlignmentRight;
    
        
        UIView *bgView=[[UIView alloc]init];
        
        bgView.backgroundColor=[UIColor colorWithRed:(0)/255.0 green:(0)/255.0 blue:(0)/255.0 alpha:(0.2)];

        
        
        
        [self addSubview:self.bgImageView];
        [self insertSubview:bgView aboveSubview:self.bgImageView];
        [self insertSubview:self.titleLabel aboveSubview:bgView];
        [self addSubview:self.nickLabel];
        [self addSubview:self.viewLabel];
        
        [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_offset(0);
            make.bottom.mas_offset(-kHeight(20));
            
        }];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_offset(0);
           
            make.bottom.equalTo(self.bgImageView.mas_bottom).mas_offset(0);
            make.height.mas_equalTo(kHeight(20));

            
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(5);
            make.right.mas_offset(-5);
            make.bottom.equalTo(self.bgImageView.mas_bottom).mas_offset(0);
            make.height.mas_equalTo(kHeight(20));
            
            
            
        }];
        
        [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.bgImageView.mas_bottom).mas_offset(0);
            make.left.mas_offset(0);
            make.height.mas_equalTo(kHeight(20));
            make.width.mas_equalTo((kScreenWidth-30)*0.3);
            
        }];
        [self.viewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.bgImageView.mas_bottom).mas_offset(0);
            make.right.mas_offset(0);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo((kScreenWidth-30)*0.2);
            
        }];
    
    }

    return self;


}

-(void)setModel:(LMHomeModel *)model{
    _model=model;
    self.titleLabel.text=model.title;
    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:[UIImage imageNamed:@"placeholder_head"] options:SDWebImageRefreshCached];
    
    self.nickLabel.text=model.nick;
    
    
    float num=model.view.floatValue;
    NSString *str;
    if (num>=10000) {
     str=[NSString stringWithFormat:@"%.1f万",num/10000];
        
    }else{
        str=model.view;
    
    
    }
    
    
    NSMutableAttributedString *attString=[[NSMutableAttributedString alloc]initWithString:str];
    
    NSTextAttachment *attach=[[NSTextAttachment alloc]init];
    attach.image=[UIImage imageNamed:@"home_person"];
    attach.bounds=CGRectMake(-3, -3, 15, 15);
    NSAttributedString *attString1=[NSAttributedString attributedStringWithAttachment:attach];
    [attString insertAttributedString:attString1 atIndex:0];
    self.viewLabel.attributedText=attString;

}
@end
