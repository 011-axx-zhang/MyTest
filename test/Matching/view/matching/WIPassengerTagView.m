//
//  WIPassengerTagView.m
//  test
//
//  Created by 亭子 on 2019/5/13.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "WIPassengerTagView.h"


@implementation WIPassengerTagView

- (void)addChildView
{
    pic = [[UIImageView alloc]init];
    pic.backgroundColor = kRedColor;
    [self addSubview:pic];
    
    name = [[UILabel alloc]init];
    name.font = [UIFont boldSystemFontOfSize:14];
    name.text = @"张三";
    [self addSubview:name];
    
    number = [[UILabel alloc]init];
    number.textColor = kWhiteColor;
    number.backgroundColor = kBlueColor;
    number.font = [UIFont systemFontOfSize:10];
    number.textAlignment = NSTextAlignmentCenter;
    number.text = @"沪 A12345";
    [self addSubview:number];
    
    carType = [[UILabel alloc]init];
    carType.textColor = [UIColor colorWithString:@"#666666"];
    carType.font = [UIFont systemFontOfSize:11];
    carType.text  =@"白色 奔驰 C200";
    [self addSubview:carType];
    
    chatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [chatBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [chatBtn setBackgroundColor:kBlueColor];
    [self addSubview:chatBtn];
    
    tags = [[NSMutableArray alloc]init];
    NSArray *itemStr = @[@"人很友善",@"人很友善",@"人很友善"];
    for (int i=0; i<3; i++) {
        UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
        item.hidden = YES;
        item.titleLabel.font = [UIFont systemFontOfSize:8];
        [item setTitle:itemStr[i] forState:UIControlStateNormal];
        [item setTitleColor:[UIColor colorWithString:@"#666666"] forState:UIControlStateNormal];
        [item setBackgroundColor:[UIColor grayColor]];
        [self addSubview:item];
        [tags addObject:item];
    }
    
    peopleNum = [[UILabel alloc]init];
    peopleNum.textColor = kWhiteColor;
    peopleNum.backgroundColor = kBlueColor;
    peopleNum.font = [UIFont systemFontOfSize:10];
    peopleNum.textAlignment = NSTextAlignmentCenter;
    peopleNum.text = @"上海强生出租汽车有限公司";
    [self addSubview:peopleNum];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    pic.frame = CGRectMake(10, self.height/2-20, 40, 40);
    
    name.frame = CGRectMake(pic.right+15, 17, 50, 20);
    
    
    switch (self.type) {
        case PassengerTagTypeCarOwner:{
            //  顺风车显示头像、名称、标签、车牌、车型
            peopleNum.hidden = YES;
            number.hidden = NO;
            carType.hidden = NO;
            
            CGFloat btnX = name.right+10;
            CGFloat space = 5;
            CGFloat btnW = 50;
            CGFloat btnH = 17;
            
            for (int i=0; i<tags.count; i++) {
                UIButton *item = [tags objectAtIndex:i];
                item.hidden = NO;
                item.frame = CGRectMake(btnX + btnW*i + space*i, 17, btnW, btnH);
            }
            
            number.frame = CGRectMake(pic.right+15, name.bottom+7, 80, 20);
            
            carType.frame = CGRectMake(number.right+15, name.bottom+7, 100, 20);
        }
            break;
        case PassengerTagTypeTaxiOwner:{
            //  出租车显示头像、名称、出租公司、车牌、车型
            
            peopleNum.hidden = NO;
            number.hidden = NO;
            carType.hidden = NO;
            
            peopleNum.frame = CGRectMake(name.right+10, 17, 150, 16);
            
            number.frame = CGRectMake(pic.right+15, name.bottom+7, 80, 20);
            
            carType.frame = CGRectMake(number.right+15, name.bottom+7, 100, 20);
        }
            break;
        case PassengerTagTypePassenger:{
            //  乘客显示头像、名称、标签、乘车人数
            
            number.hidden = YES;
            carType.hidden = YES;
            peopleNum.hidden = NO;
            
            CGFloat btnX = pic.right+15;
            CGFloat space = 5;
            CGFloat btnW = 50;
            CGFloat btnH = 17;
            
            peopleNum.frame = CGRectMake(name.right+10, 17, 150, 16);
            for (int i=0; i<tags.count; i++) {
                UIButton *item = [tags objectAtIndex:i];
                item.hidden = NO;
                item.frame = CGRectMake(btnX + btnW*i + space*i, name.bottom+15, btnW, btnH);
            }
        }
            break;
    }
    
    chatBtn.frame = CGRectMake(self.width-15-30, self.height/2-15, 30, 30);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
