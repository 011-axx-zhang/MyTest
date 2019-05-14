//
//  WIDoubleLabelView.m
//  test
//
//  Created by 亭子 on 2019/5/13.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "WIDoubleLabelView.h"

@implementation WIDoubleLabelView

- (void)addChildView
{
    first = [[UILabel alloc]init];
    first.text = @"计划行程，发布成功…";
    first.font = [UIFont boldSystemFontOfSize:20];
    first.textAlignment = NSTextAlignmentCenter;
    [self addSubview:first];
    
    second = [[UILabel alloc]init];
    second.text = @"正在寻找同行车主伙伴";
    second.textColor = [UIColor colorWithString:@"#999999"];
    second.font = [UIFont systemFontOfSize:12];
    second.textAlignment = NSTextAlignmentCenter;
    [self addSubview:second];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    first.frame = CGRectMake(10, 22, self.width-20, 30);
    
    second.frame = CGRectMake(10, 63, self.width-20, 20);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
