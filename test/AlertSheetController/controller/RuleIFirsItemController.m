//
//  RuleIFirsItemController.m
//  test
//
//  Created by 亭子 on 2019/5/6.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "RuleIFirsItemController.h"

@interface RuleIFirsItemController ()
{
    UIScrollView *scroll;
}
@end

@implementation RuleIFirsItemController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    scroll.frame = CGRectMake(0, 0, self.view.width, self.view.height);
}

- (void)addChildView
{
    CGFloat x = 35;
    scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scroll];
    
    UILabel *basic = [[UILabel alloc]initWithFrame:CGRectMake(x, 20, 170, 20)];
    basic.text = @"基础费（含3公里里程费）";
    basic.font = [UIFont systemFontOfSize:14];
    basic.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [scroll addSubview:basic];
    
    UILabel *basicR = [[UILabel alloc]initWithFrame:CGRectMake(self.view.width-x-45, 20, 45, 20)];
    basicR.text = @"99.0元";
    basicR.textAlignment = NSTextAlignmentRight;
    basicR.font = [UIFont systemFontOfSize:14];
    basicR.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [scroll addSubview:basicR];
    
    //  里程
    UILabel *mileage = [[UILabel alloc]initWithFrame:CGRectMake(x, basic.bottom+15, 45, 20)];
    mileage.text = @"里程费";
    mileage.font = [UIFont systemFontOfSize:14];
    mileage.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [scroll addSubview:mileage];
    
    UILabel *mileageItem1 = [[UILabel alloc]initWithFrame:CGRectMake(x, mileage.bottom+10, 150, 20)];
    mileageItem1.text = @"3公里-20公里区间内";
    mileageItem1.font = [UIFont systemFontOfSize:11];
    mileageItem1.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [scroll addSubview:mileageItem1];
    
    UILabel *mileageItem1R = [[UILabel alloc]initWithFrame:CGRectMake(self.view.width-x-60, mileage.bottom+10, 60, 20)];
    mileageItem1R.text = @"2.3元/公里";
    mileageItem1R.textAlignment = NSTextAlignmentRight;
    mileageItem1R.font = [UIFont systemFontOfSize:11];
    mileageItem1R.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [scroll addSubview:mileageItem1R];
    
    UILabel *mileageItem2 = [[UILabel alloc]initWithFrame:CGRectMake(x, mileageItem1.bottom+5, 150, 20)];
    mileageItem2.text = @"20公里以上部分";
    mileageItem2.font = [UIFont systemFontOfSize:11];
    mileageItem2.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [scroll addSubview:mileageItem2];
    
    UILabel *mileageItem2R = [[UILabel alloc]initWithFrame:CGRectMake(self.view.width-x-60, mileageItem1R.bottom+5, 60, 20)];
    mileageItem2R.text = @"1.0元/公里";
    mileageItem2R.textAlignment = NSTextAlignmentRight;
    mileageItem2R.font = [UIFont systemFontOfSize:11];
    mileageItem2R.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [scroll addSubview:mileageItem2R];
    
    //  多人同行
    UILabel *together = [[UILabel alloc]initWithFrame:CGRectMake(x, mileageItem2.bottom+15, 80, 20)];
    together.text = @"多人同行";
    together.font = [UIFont systemFontOfSize:14];
    together.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [scroll addSubview:together];
    
    UILabel *togetherItem1 = [[UILabel alloc]initWithFrame:CGRectMake(x, together.bottom+10, 180, 20)];
    togetherItem1.text = @"1-2人出行，按正常车费收取；";
    togetherItem1.font = [UIFont systemFontOfSize:11];
    togetherItem1.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [scroll addSubview:togetherItem1];
    
    UILabel *togetherItem2 = [[UILabel alloc]initWithFrame:CGRectMake(x, togetherItem1.bottom+5, 180, 20)];
    togetherItem2.text = @"3人出行，按正常车费的1.2倍收取；";
    togetherItem2.font = [UIFont systemFontOfSize:11];
    togetherItem2.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [scroll addSubview:togetherItem2];
    
    UILabel *togetherItem3 = [[UILabel alloc]initWithFrame:CGRectMake(x, togetherItem2.bottom+5, 180, 20)];
    togetherItem3.text = @"4人出行，按正常车费的1.5倍收取。";
    togetherItem3.font = [UIFont systemFontOfSize:11];
    togetherItem3.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [scroll addSubview:togetherItem3];
    
    //  信息服务费
    UILabel *service = [[UILabel alloc]initWithFrame:CGRectMake(x, togetherItem3.bottom+15, 80, 20)];
    service.text = @"信息服务费";
    service.font = [UIFont systemFontOfSize:14];
    service.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [scroll addSubview:service];
    
    UILabel *serviceItem1 = [[UILabel alloc]initWithFrame:CGRectMake(x, service.bottom+5, self.view.width-x*2, 60)];
    serviceItem1.numberOfLines = 0;
    serviceItem1.text = @"单次行程10公里及以下，收取1.0元；11公里至20公里，收取1.5元；21公里至30公里，收取2.0元；31公里至40公里，收取2.5元；41公里及以上，收取3.0元；信息服务费由乘车人会员承担；当乘车人会员用伙伴里程支付车费时，免除信息费。";
    serviceItem1.font = [UIFont systemFontOfSize:11];
    serviceItem1.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [scroll addSubview:serviceItem1];
    
    
    //  信息服务费
    UILabel *honoraria = [[UILabel alloc]initWithFrame:CGRectMake(x, serviceItem1.bottom+15, 80, 20)];
    honoraria.text = @"伙伴感谢费";
    honoraria.font = [UIFont systemFontOfSize:14];
    honoraria.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [scroll addSubview:honoraria];
    
    UILabel *honorariaItem1 = [[UILabel alloc]initWithFrame:CGRectMake(x, honoraria.bottom+5, self.view.width-x*2, 50)];
    honorariaItem1.numberOfLines = 0;
    honorariaItem1.text = @"乘车人会员邀约驾驶人会员时，可以主动增加5元、10元、20元或其他金额（最低金额1元，最高金额200元）的伙伴感谢费。";
    honorariaItem1.font = [UIFont systemFontOfSize:11];
    honorariaItem1.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [scroll addSubview:honorariaItem1];
    
    
    //  其他费用
    UILabel *other = [[UILabel alloc]initWithFrame:CGRectMake(x, honorariaItem1.bottom+15, 80, 20)];
    other.text = @"其他费用";
    other.font = [UIFont systemFontOfSize:14];
    other.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [scroll addSubview:other];
    
    UILabel *otherItem1 = [[UILabel alloc]initWithFrame:CGRectMake(x, other.bottom+5, self.view.width-x*2, 40)];
    otherItem1.numberOfLines = 0;
    otherItem1.text = @"如行程合乘阶段中产生高速公路通行费、过桥费等额外费用，由乘车人会员当场现金支付。";
    otherItem1.font = [UIFont systemFontOfSize:11];
    otherItem1.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [scroll addSubview:otherItem1];
    [scroll setContentSize:CGSizeMake(0, otherItem1.bottom+10)];
}

@end
