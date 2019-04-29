//
//  StartOption.m
//  test
//
//  Created by 亭子 on 2019/4/29.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "StartOption.h"

@implementation StartOption

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addChildView];
    }
    return self;
}

- (void)addChildView
{
    people = [[ConditionView alloc]init];
    [self addSubview:people];
    
    time = [[ConditionView alloc]init];
    [self addSubview:time];
    
    other = [[ConditionView alloc]init];
    [self addSubview:other];
    
    done = [UIButton buttonWithType:UIButtonTypeCustom];
    [done setTitle:@"确认发布" forState:UIControlStateNormal];
    [done setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [done setBackgroundColor:[UIColor blueColor]];
    [done addTarget:self action:@selector(selectDone) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:done];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat w = 110;
    CGFloat h = 85;
    
    people.frame = CGRectMake(0, 0, w, h);
    
    time.frame = CGRectMake(0, h, w, h);
    
    other.frame = CGRectMake(0, h*2, w, h);
    
    done.frame = CGRectMake(0, self.frame.size.height-50, self.frame.size.width, 50);
}

- (void)setViewStyle
{
    [people setViewType:OptionViewTypePeople titleStr:@"2人" otherImages:nil];
    [time setViewType:OptionViewTypeTime titleStr:@"2人" otherImages:nil];
    [other setViewType:OptionViewTypeOther titleStr:@"2人" otherImages:nil];
}


- (void)selectDone
{
    NSLog(@"select done");
    if ([self.delegate respondsToSelector:@selector(optionView:didSelectOption:)]) {
        [self.delegate optionView:self didSelectOption:@{@"key":@"value"}];
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
