//
//  PaySelectPayTypeView.m
//  test
//
//  Created by 亭子 on 2019/5/16.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "PaySelectPayTypeView.h"

@implementation PaySelectPayTypeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addChildView];
    }
    return self;
}


- (void)addChildView
{
    navTitle = [[UILabel alloc]init];
    navTitle.font = [UIFont boldSystemFontOfSize:20];
    navTitle.text = @"请支付费用";
    navTitle.textAlignment = NSTextAlignmentCenter;
    [self addSubview:navTitle];
    
    price = [[InfoButton alloc]init];
    price.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [price setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [price setTitle:@"99.9元" forState:UIControlStateNormal];
    [price setImage:[UIImage imageNamed:@"ButtonInfoImage"] forState:UIControlStateNormal];
    [price addTarget:self action:@selector(costInfo) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:price];
    
    aliPayL = [UIButton buttonWithType:UIButtonTypeCustom];
    aliPayL.titleLabel.font = [UIFont systemFontOfSize:14];
    aliPayL.titleLabel.textAlignment = NSTextAlignmentLeft;
    [aliPayL setTitleColor:[UIColor colorWithString:@"#666666"] forState:UIControlStateNormal];
    [aliPayL setImage:[UIImage imageNamed:@"Pay_Select_Pay_Type_AliPay"] forState:UIControlStateNormal];
    [aliPayL setTitle:@"支付宝支付" forState:UIControlStateNormal];
    [aliPayL setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 5)];
    [self addSubview:aliPayL];
    
    aliPayR = [UIButton buttonWithType:UIButtonTypeCustom];
    aliPayR.tag = 100;
    [aliPayR setImage:[UIImage imageNamed:@"Pay_Select_Pay_Type_Normal"] forState:UIControlStateNormal];
    [aliPayR setImage:[UIImage imageNamed:@"Pay_Select_Pay_Type_Select"] forState:UIControlStateSelected];
    [aliPayR addTarget:self action:@selector(selectPayType:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:aliPayR];
    
    
    wxPayL = [UIButton buttonWithType:UIButtonTypeCustom];
    wxPayL.titleLabel.font = [UIFont systemFontOfSize:14];
    wxPayL.titleLabel.textAlignment = NSTextAlignmentLeft;
    [wxPayL setTitleColor:[UIColor colorWithString:@"#666666"] forState:UIControlStateNormal];
    [wxPayL setImage:[UIImage imageNamed:@"Pay_Select_Pay_Type_WXPay"] forState:UIControlStateNormal];
    [wxPayL setTitle:@"微信支付" forState:UIControlStateNormal];
    [wxPayL setTitleEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 0)];
    [wxPayL setImageEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 15)];
    [self addSubview:wxPayL];
    
    wxPayR = [UIButton buttonWithType:UIButtonTypeCustom];
    wxPayR.tag = 102;
    [wxPayR setImage:[UIImage imageNamed:@"Pay_Select_Pay_Type_Normal"] forState:UIControlStateNormal];
    [wxPayR setImage:[UIImage imageNamed:@"Pay_Select_Pay_Type_Select"] forState:UIControlStateSelected];
    [wxPayR addTarget:self action:@selector(selectPayType:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:wxPayR];
    
    confim = [UIButton buttonWithType:UIButtonTypeCustom];
    confim.titleLabel.font = [UIFont systemFontOfSize:16];
    [confim setBackgroundImage:[UIImage imageNamed:@"ButtonBackgroundImage"] forState:UIControlStateNormal];
    [confim setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [confim setTitle:@"支付" forState:UIControlStateNormal];
    [confim addTarget:self action:@selector(confimPayType) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:confim];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    navTitle.frame = CGRectMake(20, 20, self.width-40, 30);
    
    price.frame = CGRectMake(self.width/2-50, navTitle.bottom+17, 100, 40);
    
    aliPayL.frame = CGRectMake(35, price.bottom+34, 120, 20);
    
    wxPayL.frame = CGRectMake(35, aliPayL.bottom+13, 120, 20);
    
    aliPayR.frame = CGRectMake(self.width-40-22, price.bottom+22, 40, 40);
    
    wxPayR.frame = CGRectMake(self.width-40-22, aliPayR.bottom, 40, 40);
    
    confim.frame = CGRectMake(self.width/2-80, wxPayR.bottom+20, 160, 40);
}

- (void)costInfo
{
    if ([self.delegate respondsToSelector:@selector(didClickPriceInfo)]) {
        [self.delegate didClickPriceInfo];
    }
}


- (void)selectPayType:(UIButton *)button
{
    selectBtn.selected = NO;
    button.selected = YES;
    selectBtn = button;
}

- (void)confimPayType
{
    if ([self.delegate respondsToSelector:@selector(didSelectPayType:price:)]) {
        [self.delegate didSelectPayType:selectBtn.tag price:99.01];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
