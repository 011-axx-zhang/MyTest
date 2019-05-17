//
//  PayReconfirmView.m
//  test
//
//  Created by 亭子 on 2019/5/16.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "PayReconfirmView.h"

@implementation PayReconfirmView

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
    navTitle.text = @"请确认已完成本次行程";
    navTitle.textAlignment = NSTextAlignmentCenter;
    [self addSubview:navTitle];
    
    priceL = [[UILabel alloc]init];
    priceL.font = [UIFont systemFontOfSize:14];
    priceL.text = @"顺风车费";
    priceL.textAlignment = NSTextAlignmentLeft;
    [self addSubview:priceL];
    
    priceR = [[UILabel alloc]init];
    priceR.font = [UIFont systemFontOfSize:14];
    priceR.text = @"24.0元";
    priceR.textAlignment = NSTextAlignmentRight;
    [self addSubview:priceR];
    
    price = [[InfoButton alloc]init];
    price.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [price setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [price setTitle:@"99.9元" forState:UIControlStateNormal];
    [price setImage:[UIImage imageNamed:@"ButtonInfoImage"] forState:UIControlStateNormal];
    [price addTarget:self action:@selector(priceInfo) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:price];
    
    confirm = [UIButton buttonWithType:UIButtonTypeCustom];
    confirm.titleLabel.font = [UIFont systemFontOfSize:16];
    [confirm setBackgroundImage:[UIImage imageNamed:@"ButtonBackgroundImage"] forState:UIControlStateNormal];
    [confirm setTitle:@"确定" forState:UIControlStateNormal];
    [confirm setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [confirm addTarget:self action:@selector(configPay) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:confirm];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    navTitle.frame = CGRectMake(20, 20, self.width-40, 30);
    priceL.frame = CGRectMake(35, navTitle.bottom+25, 80, 20);
    priceR.frame = CGRectMake(self.width-35-80, navTitle.bottom+25, 80, 20);
    price.frame = CGRectMake(self.width/2-40, navTitle.bottom+60, 80, 40);
    confirm.frame = CGRectMake(16, price.bottom+25, self.width-32, 46);
}

- (void)priceInfo
{
    if ([self.delegate respondsToSelector:@selector(clickPayReconfirmPriceInfo)]) {
        [self.delegate clickPayReconfirmPriceInfo];
    }
}

- (void)configPay
{
    if ([self.delegate respondsToSelector:@selector(clickPayReconfirmConfigBtn)]) {
        [self.delegate clickPayReconfirmConfigBtn];
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
