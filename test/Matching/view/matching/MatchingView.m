//
//  MatchingView.m
//  test
//
//  Created by 亭子 on 2019/5/13.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "MatchingView.h"

@implementation MatchingView


- (void)addChildView
{
    self.backgroundColor = [UIColor clearColor];
    safeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    safeBtn.backgroundColor = [UIColor whiteColor];
    safeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    safeBtn.layer.cornerRadius = 15;
    [safeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [safeBtn setImage:[UIImage imageNamed:@"Match_Child_Safe"] forState:UIControlStateNormal];
    [safeBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 5)];
    [safeBtn setTitle:@"安全功能" forState:UIControlStateNormal];
    [self addSubview:safeBtn];
    
    locationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [locationBtn setBackgroundImage:[UIImage imageNamed:@"Navigation_Point_Locate"] forState:UIControlStateNormal];
    [locationBtn addTarget:self action:@selector(clickLocation) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:locationBtn];
    
    
    DBView = [[WIDoubleLabelView alloc]initWithFrame:CGRectZero viewStyle:WhiteInfoViewStyleDoubleLabel];
    [self addSubview:DBView];
    
    simpleView = [[WISimpleQuestionView alloc]initWithFrame:CGRectZero viewStyle:WhiteInfoViewStyleSimpleQuestion];
    [self addSubview:simpleView];
    
    carOwner = [[WIPassengerTagView alloc]initWithFrame:CGRectZero viewStyle:WhiteInfoViewStylePassengerTag];
    carOwner.type = PassengerTagTypePassenger;
    [self addSubview:carOwner];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    safeBtn.frame = CGRectMake(0, 10, 102, 32);
    
    locationBtn.frame = CGRectMake(self.width-45-9, 0, 45, 45);
    
    simpleView.frame = CGRectMake(0, 52, self.width, 127);
    
    DBView.frame = CGRectMake(0, simpleView.bottom+7, self.width, 100);
    
    carOwner.frame = CGRectMake(0, DBView.bottom+7, self.width, 100);
}

- (void)clickLocation
{
    if ([self.delegate respondsToSelector:@selector(didClickLocationActive)]) {
        [self.delegate didClickLocationActive];
    }
}

@end
