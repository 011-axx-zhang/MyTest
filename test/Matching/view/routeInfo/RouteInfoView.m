//
//  RouteInfoView.m
//  test
//
//  Created by 亭子 on 2019/5/13.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "RouteInfoView.h"

@implementation RouteInfoView

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
    bgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Button_Background_White"]];
    bgView.transform = CGAffineTransformMakeRotation(M_PI);
    [self addSubview:bgView];
    
    itemBG = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Info_White_Background"]];
    [self addSubview:itemBG];
    
    timeL = [[UILabel alloc]init];
    timeL.text = @"上车时间: ";
    timeL.font = [UIFont systemFontOfSize:12];
    timeL.textColor = [UIColor colorWithString:@"#666666"];
    [itemBG addSubview:timeL];
    
    timeR = [[UILabel alloc]init];
    timeR.text = @"今天13：00 ~ 13：30";
    timeR.font = [UIFont boldSystemFontOfSize:12];
    timeR.textColor = [UIColor colorWithString:@"#333333"];
    [itemBG addSubview:timeR];
    
    iconL = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Route_Info_Icon"]];
    [itemBG addSubview:iconL];
    
    getOn = [[UILabel alloc]init];
    getOn.font = [UIFont boldSystemFontOfSize:14];
    getOn.text = @"上车点：华鑫天地-B栋";
    [itemBG addSubview:getOn];
    
    getDown = [[UILabel alloc]init];
    getDown.font = [UIFont boldSystemFontOfSize:14];
    getDown.text = @"下车点：华鑫天地-B栋";
    [itemBG addSubview:getDown];
    
    price = [[UILabel alloc]init];
    price.font = [UIFont boldSystemFontOfSize:24];
    price.text = @"¥ 37.6";
    [itemBG addSubview:price];
    
    numberL = [[UILabel alloc]init];
    numberL.font = [UIFont systemFontOfSize:12];
    numberL.text = @"搭乘人数: ";
    numberL.textColor = [UIColor colorWithString:@"#666666"];
    [self addSubview:numberL];
    
    numberR = [[UILabel alloc]init];
    numberR.font = [UIFont boldSystemFontOfSize:13];
    numberR.text = @"1234567890人";
    [self addSubview:numberR];
    
    icons = [[NSMutableArray alloc]init];
    NSArray *names1 = @[@"Creat_Order_Option_One_Normal",@"Creat_Order_Option_Two_Normal",@"Creat_Order_Option_Three_Normal"];
    NSArray *names2 = @[@"Creat_Order_Option_One_Select",@"Creat_Order_Option_Two_Select",@"Creat_Order_Option_Three_Select"];
    for (int i=0; i<3; i++) {
        UIImage *img1 = [UIImage imageNamed:names1[i]];
        UIImage *img2 = [UIImage imageNamed:names2[i]];
        UIButton *icon = [UIButton buttonWithType:UIButtonTypeCustom];
        icon.selected = NO;
        [icon setImage:img1 forState:UIControlStateNormal];
        [icon setImage:img2 forState:UIControlStateSelected];
        [self addSubview:icon];
        [icons addObject:icon];
    }
    
    line = [[UILabel alloc]init];
    line.backgroundColor = [UIColor colorWithString:@"#f5f5f5"];
    [self addSubview:line];
    
    styleL = [[RouteInfoStyleSubview alloc]init];
    styleL.iconName = @"Rotel_Info_Style_Left";
    styleL.titleName = @"顺风车";
    styleL.priceName = @"一口价 37.6 元";
    [self addSubview:styleL];
    
    styleR = [[RouteInfoStyleSubview alloc]init];
    styleR.iconName = @"Rotel_Info_Style_Right";
    styleR.titleName = @"出租车合乘";
    styleR.priceName = @"预计  37.6 元";
    [self addSubview:styleR];
    
    pullUp = [UIButton buttonWithType:UIButtonTypeCustom];
    [pullUp setImage:[UIImage imageNamed:@"Button_Pull_Up_Icon"] forState:UIControlStateNormal];
    [pullUp addTarget:self action:@selector(clickPullUp) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:pullUp];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    bgView.frame = self.bounds;
    
    itemBG.frame = CGRectMake(15, 19, 330, 115);
    
    timeL.frame = CGRectMake(15, 14, 64, 17);
    timeR.frame = CGRectMake(timeL.right, 14, itemBG.width-100, 17);
    
    iconL.frame = CGRectMake(23, timeL.bottom+18, 14, 40);
    getOn.frame = CGRectMake(iconL.right+12, timeL.bottom+16, 180, 20);
    getDown.frame = CGRectMake(iconL.right+12, getOn.bottom+8, 180, 20);
    
    price.frame = CGRectMake(itemBG.width-70-30, 64, 70, 30);
    
    numberL.frame = CGRectMake(15, itemBG.bottom+18, 70, 17);
    numberR.frame = CGRectMake(numberL.right, itemBG.bottom+18, 100, 17);
    
    CGFloat btnW = 22;
    CGFloat space = 8;
    CGFloat x = self.width-btnW*3-space*2-15;
    CGFloat y = itemBG.bottom+15;
    for (int i=0; i<3; i++) {
        UIButton *icon = [icons objectAtIndex:i];
        icon.frame = CGRectMake(x+btnW*i+space*i, y, btnW, btnW);
    }
    
    line.frame = CGRectMake(15, numberL.bottom+16, self.width-30, 1);
    
    styleL.frame = CGRectMake(50, line.bottom+15, 100, 88);
    
    styleR.frame = CGRectMake(self.width-150, line.bottom+15, 100, 88);
    
    pullUp.frame = CGRectMake(self.width/2-40, self.height-40, 80, 30);
}


- (void)clickPullUp
{
    if ([self.delegate respondsToSelector:@selector(didClickPullUPAction:)]) {
        [self.delegate didClickPullUPAction:self];
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
