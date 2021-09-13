//
//  WhiteInfoView.m
//  test
//
//  Created by 亭子 on 2019/5/13.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "WhiteInfoView.h"

@implementation WhiteInfoView

- (instancetype)initWithFrame:(CGRect)frame viewStyle:(WhiteInfoViewStyle)style
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.viewStyle = style;
        [self addBGView];
        [self addChildView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.viewStyle = WhiteInfoViewStyleDoubleLabel;
        [self addBGView];
        [self addChildView];
    }
    return self;
}

- (void)addBGView
{
    bgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Info_White_Background"]];
    [self addSubview:bgView];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    bgView.frame = self.bounds;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
