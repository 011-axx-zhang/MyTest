//
//  ClearingOrder.m
//  test
//
//  Created by 亭子 on 2019/4/29.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "ClearingOrder.h"

@implementation ClearingOrder

- (void)addChildView
{
    title = [[UILabel alloc]init];
    title.font = [UIFont boldSystemFontOfSize:18];
    title.textAlignment = NSTextAlignmentCenter;
    
    icon = [[UIImageView alloc]init];
    
    msg = [[UILabel alloc]init];
    msg.font = [UIFont systemFontOfSize:16];
    msg.textAlignment = NSTextAlignmentCenter;
    msg.numberOfLines = 0;
    msg.lineBreakMode = NSLineBreakByClipping;
    
    line = [[UIView alloc]init];
    
    tripMode = [[UILabel alloc]init];
    tripMode.font = [UIFont systemFontOfSize:12];
    tripMode.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
    
    orderNumb = [[UILabel alloc]init];
    orderNumb.font = [UIFont boldSystemFontOfSize:14];
    orderNumb.textColor = [UIColor blackColor];
    orderNumb.textAlignment = NSTextAlignmentRight;
    
    gift = [[UILabel alloc]init];
    gift.font = [UIFont systemFontOfSize:12];
    gift.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
    
    
    giftNumb = [[UILabel alloc]init];
    giftNumb.font = [UIFont boldSystemFontOfSize:14];
    giftNumb.textColor = [UIColor blackColor];
    giftNumb.textAlignment = NSTextAlignmentRight;
    
    
    totalNumb = [[UILabel alloc]init];
    totalNumb.textAlignment = NSTextAlignmentCenter;
    
    errMsg = [[UILabel alloc]init];
    errMsg.textAlignment = NSTextAlignmentCenter;
    errMsg.font = [UIFont boldSystemFontOfSize:10];
    errMsg.textColor = [UIColor colorWithRed:187/255 green:187/255 blue:187/255 alpha:1];
    
    
    aliPay = [UIButton buttonWithType:UIButtonTypeCustom];
    aliPay.titleLabel.font = [UIFont systemFontOfSize:14];
    [aliPay setImage:[UIImage imageNamed:@"Location_Start_Point"] forState:UIControlStateNormal];
    [aliPay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [aliPay setTitle:@"支付宝支付" forState:UIControlStateNormal];
    
    
    wxPay = [UIButton buttonWithType:UIButtonTypeCustom];
    wxPay.titleLabel.font = [UIFont systemFontOfSize:14];
    wxPay.titleLabel.textAlignment = NSTextAlignmentLeft;
    [wxPay setImage:[UIImage imageNamed:@"Location_Start_Point"] forState:UIControlStateNormal];
    [wxPay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [wxPay setTitle:@"微信支付" forState:UIControlStateNormal];
    
    
    selectAli = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    
    finish = [UIButton buttonWithType:UIButtonTypeCustom];
    [finish setTitle:@"去支付" forState:UIControlStateNormal];
    [finish setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [finish setBackgroundColor:[UIColor blueColor]];
    [finish addTarget:self action:@selector(orderFinish) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:title];
    [self addSubview:icon];
    [self addSubview:msg];
    [self addSubview:line];
    [self addSubview:tripMode];
    [self addSubview:orderNumb];
    [self addSubview:gift];
    [self addSubview:giftNumb];
    [self addSubview:totalNumb];
    [self addSubview:errMsg];
    [self addSubview:aliPay];
    [self addSubview:wxPay];
    [self addSubview:finish];
}

- (void)layoutSubviews
{
    title.frame = CGRectMake(20, 17, self.width-40, 25);
    title.text = @"冻结费用";
    
    icon.frame = CGRectMake(self.width/2-33, 62, 66, 36);
    
    msg.frame = CGRectMake(20, 120, self.width-40, 44);
    msg.text = @"恭喜您！\n该行程 携有伙伴卡，行程将会最优先匹配";
    
    line.frame = CGRectMake(0, 170, self.width, 20);
    line.backgroundColor = [UIColor brownColor];
//    line.backgroundColor = [UIColor colorWithRed:245 green:245 blue:245 alpha:1];
    
    tripMode.frame = CGRectMake(35, 210, 87, 17);
    tripMode.text = @"顺风车+出租车";
    
    orderNumb.frame = CGRectMake(self.width-35-100, 210, 100, 20);
    orderNumb.text = @"99.9元";
    
    gift.frame = CGRectMake(35, 230, 87, 17);
    gift.text = @"给司机小红包";
    
    giftNumb.frame = CGRectMake(self.width-35-100, 230, 100, 20);
    giftNumb.text = @"10.0元";
    
    
    totalNumb.frame = CGRectMake(self.width/2-100, 260, 200, 47);
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:@"合计99.9元"];
    [attriStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 5)];
    [attriStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:40] range:NSMakeRange(2, 4)];
    totalNumb.attributedText = attriStr;
    
    
    errMsg.frame = CGRectMake(20, totalNumb.bottom+10, self.width-40, 15);
    errMsg.text = @"若没有达成伙伴行程，费用将即时原路返还";
    
    aliPay.frame = CGRectMake(18, errMsg.bottom+16, 112, 20);
    [aliPay setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
    wxPay.frame = CGRectMake(18, aliPay.bottom+14, 112, 20);
    [wxPay setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
    [wxPay setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    
    
    finish.frame = CGRectMake(0, self.height-50, self.width, 50);
}

- (void)orderFinish
{
    if ([self.delegate respondsToSelector:@selector(didSelectPayButton)]) {
        [self.delegate didSelectPayButton];
    }
}

@end
