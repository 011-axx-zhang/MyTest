//
//  RouteInfoStyleSubview.m
//  test
//
//  Created by 亭子 on 2019/5/14.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "RouteInfoStyleSubview.h"

@implementation RouteInfoStyleSubview

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
    title = [[UILabel alloc]init];
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor colorWithString:@"#666666"];
    title.font = [UIFont systemFontOfSize:12];
    [self addSubview:title];
    
    icon = [[UIImageView alloc]init];
    [self addSubview:icon];
    
    price = [UIButton buttonWithType:UIButtonTypeCustom];
    price.titleLabel.font = [UIFont systemFontOfSize:10];
    [price setTitleColor:[UIColor colorWithString:@"#666666"] forState:UIControlStateNormal];
    [price setImage:[UIImage imageNamed:@"ButtonInfoImage"] forState:UIControlStateNormal];
    [self addSubview:price];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    title.frame = CGRectMake(0, 0, self.width, 17);
    title.text = self.titleName;
    
    icon.frame = CGRectMake(10, title.bottom+10, self.width-20, 30);
    [icon setImage:[UIImage imageNamed:self.iconName]];
    
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:self.priceName];
    NSDictionary *dic = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:20],
                          NSForegroundColorAttributeName:[UIColor blackColor]};
    [attriString addAttributes:dic range:NSMakeRange(4, 4)];
    price.frame = CGRectMake(0, icon.bottom+10, self.width, 25);
    [price setAttributedTitle:attriString forState:UIControlStateNormal];
    [price setImageEdgeInsets:UIEdgeInsetsMake(5, self.width-5, 0, 0)];
    [price setTitleEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
