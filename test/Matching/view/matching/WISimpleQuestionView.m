//
//  WISimpleQuestionView.m
//  test
//
//  Created by 亭子 on 2019/5/13.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "WISimpleQuestionView.h"

@implementation WISimpleQuestionView

- (void)addChildView
{
    title = [[UILabel alloc]init];
    title.font = [UIFont boldSystemFontOfSize:16];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"行程最晚出发时间已到达";
    [self addSubview:title];
    
    msg = [[UILabel alloc]init];
    msg.font = [UIFont systemFontOfSize:14];
    msg.textAlignment = NSTextAlignmentCenter;
    msg.text = @"是否继续匹配？";
    [self addSubview:msg];
    
    cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [cancelBtn setBackgroundImage:[UIImage imageNamed:@"Button_Background_Normal"] forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor colorWithString:@"#45ABF2"] forState:UIControlStateNormal];
    [cancelBtn setTitle:@"取消行程" forState:UIControlStateNormal];
    [self addSubview:cancelBtn];
    
    continueBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    continueBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [continueBtn setBackgroundImage:[UIImage imageNamed:@"ButtonBackgroundImage"] forState:UIControlStateNormal];
    [continueBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [continueBtn setTitle:@"继续等待" forState:UIControlStateNormal];
    [self addSubview:continueBtn];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    title.frame = CGRectMake(10, 18, self.width-20, 22);
    
    msg.frame = CGRectMake(20, title.bottom+5, self.width-40, 20);
    
    cancelBtn.frame = CGRectMake(60, msg.bottom+18, 94, 25);
    
    continueBtn.frame = CGRectMake(cancelBtn.right+22, msg.bottom+18, 94, 25);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
