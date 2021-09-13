//
//  RequirementView.m
//  test
//
//  Created by 亭子 on 2019/5/5.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "RequirementView.h"

@implementation RequirementView

- (void)addChildView
{
    title = [[UILabel alloc]init];
    title.font = [UIFont boldSystemFontOfSize:20];
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor blackColor];
    title.text = @"特殊需求";
    [self addSubview:title];
    
    
    luggage = [UIButton buttonWithType:UIButtonTypeCustom];
    luggage.titleLabel.font = [UIFont systemFontOfSize:12];
//    [luggage setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [luggage setTitle:@"大件行李" forState:UIControlStateNormal];
//    [luggage setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
//    [luggage setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [luggage setBackgroundColor:[UIColor colorWithRed:105/255 green:105/255 blue:205/255 alpha:1]];
    [self addSubview:luggage];
    
    
    
    pet = [UIButton buttonWithType:UIButtonTypeCustom];
    pet.titleLabel.font = [UIFont systemFontOfSize:12];
    //    [pet setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [pet setTitle:@"携带宠物" forState:UIControlStateNormal];
    //    [pet setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    //    [pet setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [pet setBackgroundColor:[UIColor colorWithRed:105/255 green:155/255 blue:205/255 alpha:1]];
    [self addSubview:pet];
    
    
    
    seat = [UIButton buttonWithType:UIButtonTypeCustom];
    seat.titleLabel.font = [UIFont systemFontOfSize:12];
    //    [seat setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [seat setTitle:@"儿童座椅" forState:UIControlStateNormal];
    //    [seat setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    //    [seat setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [seat setBackgroundColor:[UIColor colorWithRed:125/255 green:100/255 blue:133/255 alpha:1]];
    [self addSubview:seat];
    
    
    subTitle = [[UILabel alloc]init];
    subTitle.textColor = [UIColor colorWithRed:153 green:153 blue:153 alpha:1];
    subTitle.font = [UIFont systemFontOfSize:12];
    subTitle.textAlignment = NSTextAlignmentCenter;
    subTitle.text = @"仅为我匹配同性别伙伴";
    [self addSubview:subTitle];
    
    
    finish = [UIButton buttonWithType:UIButtonTypeCustom];
    finish.titleLabel.font = [UIFont systemFontOfSize:16];
    [finish setBackgroundImage:[UIImage imageNamed:@"ButtonBackgroundImage"] forState:UIControlStateNormal];
    [finish setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [finish setTitle:@"选好了" forState:UIControlStateNormal];
    [finish addTarget:self action:@selector(requireFinish) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:finish];
}

- (void)layoutSubviews
{
    CGFloat w = 100;
    CGFloat h = 134;
    title.frame = CGRectMake(self.width/2-60, 30, 120, 30);
    
    luggage.frame = CGRectMake(20, title.bottom+17, w, h);
    
    pet.frame = CGRectMake(30+w, title.bottom+17, w, h);
    
    seat.frame = CGRectMake(40+w*2, title.bottom+17, w, h);
    
    subTitle.frame = CGRectMake(self.width/2-80, self.height-94, 160, 17);
    
    finish.frame = CGRectMake(23, self.height-68, self.width-46, 46);
}


- (void)requireFinish
{
    if ([self.delegate respondsToSelector:@selector(didSelectRequireOptions)]) {
        [self.delegate didSelectRequireOptions];
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
