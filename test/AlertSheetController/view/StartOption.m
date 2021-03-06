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
    [people addTarget:self action:@selector(presentSubView)];
    
    time = [[ConditionView alloc]init];
    [self addSubview:time];
    
    other = [[ConditionView alloc]init];
    [self addSubview:other];
    [other addTarget:self action:@selector(otherOptions)];
    
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


- (void)presentSubView
{
    NSLog(@"选择人数");
    UIResponder *responder = self;
    UIViewController *vc = nil;
    // 循环获取下一个响应者,直到响应者是一个UIViewController类的一个对象为止,然后返回该对象.
    while ((responder = [responder nextResponder])) {
        if ([responder isKindOfClass:[UIViewController class]] && ![responder isKindOfClass:[UINavigationController class]]) {
            vc = (UIViewController *)responder;
            NSLog(@"控制器:%@",vc);
            UIViewController *controller = [[NSClassFromString(@"PeopleNumberViewController") alloc] init];
            [vc presentViewController:controller animated:YES completion:nil];
        }
    }
}

- (void)otherOptions
{
    UIResponder *responder = self;
    UIViewController *vc = nil;
    // 循环获取下一个响应者,直到响应者是一个UIViewController类的一个对象为止,然后返回该对象.
    while ((responder = [responder nextResponder])) {
        if ([responder isKindOfClass:[UIViewController class]] && ![responder isKindOfClass:[UINavigationController class]]) {
            vc = (UIViewController *)responder;
//            NSLog(@"控制器:%@",vc);
            UIViewController *controller = [[NSClassFromString(@"SpecialRequirement") alloc] init];
            [vc presentViewController:controller animated:YES completion:nil];
        }
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
