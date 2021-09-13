//
//  PayFailureView.m
//  test
//
//  Created by 亭子 on 2019/5/16.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "PayFailureView.h"

@implementation PayFailureView

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
    navTitle.text = @"支付失败";
    navTitle.textAlignment = NSTextAlignmentCenter;
    [self addSubview:navTitle];
    
    icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Pay_Status_Fail_Waring"]];
    [self addSubview:icon];
    
    msg = [[UILabel alloc]init];
    msg.font = [UIFont systemFontOfSize:14];
    msg.textColor = [UIColor colorWithString:@"#666666"];
    msg.textAlignment = NSTextAlignmentCenter;
    msg.text = @"很抱歉，支付没有成功，请重新尝试";
    [self addSubview:msg];
    
    payAgain = [UIButton buttonWithType:UIButtonTypeCustom];
    payAgain.titleLabel.font = [UIFont systemFontOfSize:16];
    [payAgain setBackgroundImage:[UIImage imageNamed:@"ButtonBackgroundImage"] forState:UIControlStateNormal];
    [payAgain setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [payAgain setTitle:@"重新支付" forState:UIControlStateNormal];
    [payAgain addTarget:self action:@selector(pay) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:payAgain];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    navTitle.frame = CGRectMake(20, 20, self.width-40, 30);
    
    icon.frame = CGRectMake(self.width/2-20, navTitle.bottom+20, 40, 40);
    
    msg.frame = CGRectMake(20, icon.bottom+40, self.width-40, 20);
    
    payAgain.frame = CGRectMake(self.width/2-153/2, msg.bottom+20, 153, 40);
}

- (void)pay
{
    if ([self.delegate respondsToSelector:@selector(payAgain)]) {
        [self.delegate payAgain];
    }
}

@end
