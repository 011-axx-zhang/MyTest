//
//  RuleSecondItemController.m
//  test
//
//  Created by 亭子 on 2019/5/6.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "RuleSecondItemController.h"

@interface RuleSecondItemController ()
{
    UIScrollView *ruleScroll;
}
@end

@implementation RuleSecondItemController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildView];
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    ruleScroll.frame = CGRectMake(0, 0, self.view.width, self.view.height);
}
- (void)addChildView
{
    CGFloat x = 35;
    ruleScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-20)];
    ruleScroll.showsHorizontalScrollIndicator = NO;
    ruleScroll.showsVerticalScrollIndicator = NO;
    [self.view addSubview:ruleScroll];
    
    UILabel *basic = [[UILabel alloc]initWithFrame:CGRectMake(x, 20, 280, 20)];
    basic.text = @"预冻结车费/伙伴里程（1公里=1伙伴里程）";
    basic.font = [UIFont systemFontOfSize:14];
    basic.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [ruleScroll addSubview:basic];
    
    UILabel *basicItem = [[UILabel alloc]initWithFrame:CGRectMake(x, basic.bottom+10, ruleScroll.width-x*2, 90)];
    basicItem.numberOfLines = 0;
    basicItem.text = @"发布行程时，系统根据确认的规划路线的公里数预冻结相应的合乘费用/伙伴里程；预冻结金额将在下车付车费时抵扣；预冻结的里程仅用于可能存在的有责取消补偿，行程完成后剩余预冻结里程解冻。";
    basicItem.font = [UIFont systemFontOfSize:14];
    basicItem.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [ruleScroll addSubview:basicItem];
    
    //  乘车人2
    UILabel *mileage = [[UILabel alloc]initWithFrame:CGRectMake(x, basicItem.bottom+15, 190, 20)];
    mileage.text = @"乘车人2（后上车 先下车）";
    mileage.font = [UIFont systemFontOfSize:14];
    mileage.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [ruleScroll addSubview:mileage];
    
    UILabel *mileageItem1 = [[UILabel alloc]initWithFrame:CGRectMake(x, mileage.bottom+10, ruleScroll.width-x*2, 50)];
    mileageItem1.numberOfLines = 0;
    mileageItem1.text = @"分摊费用=乘车人2下车时当前计价器金额×70%需支付金额=分摊费用+信息服务费-预冻结金额";
    mileageItem1.font = [UIFont systemFontOfSize:11];
    mileageItem1.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [ruleScroll addSubview:mileageItem1];
    
    //  乘车人1
    UILabel *together = [[UILabel alloc]initWithFrame:CGRectMake(x, mileageItem1.bottom+15, 180, 20)];
    together.text = @"乘车人1（先上车 后下车）";
    together.font = [UIFont systemFontOfSize:14];
    together.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [ruleScroll addSubview:together];
    
    UILabel *togetherItem1 = [[UILabel alloc]initWithFrame:CGRectMake(x, together.bottom+10, ruleScroll.width-x*2, 60)];
    togetherItem1.numberOfLines = 0;
    togetherItem1.text = @"分摊费用=独乘段费用+合乘段费用即，分摊费用=（乘车人1下车时计价器金额-乘车人2下车时计价器金额）+乘车人2下车时计价器金额×70%需支付金额=分摊费用+信息服务费-预冻结金额";
    togetherItem1.font = [UIFont systemFontOfSize:11];
    togetherItem1.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [ruleScroll addSubview:togetherItem1];
    
    //  信息服务费
    UILabel *service = [[UILabel alloc]initWithFrame:CGRectMake(x, togetherItem1.bottom+15, 80, 20)];
    service.text = @"信息服务费";
    service.font = [UIFont systemFontOfSize:14];
    service.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [ruleScroll addSubview:service];
    
    UILabel *serviceItem1 = [[UILabel alloc]initWithFrame:CGRectMake(x, service.bottom+5, self.view.width-x*2, 60)];
    serviceItem1.numberOfLines = 0;
    serviceItem1.text = @"单次行程15公里及以下，各收取1.0元；16公里至30公里，各收取1.5元；31公里及以上，各收取2.0元；信息服务费由乘车人会员各自承担，行程距离以乘车人2（后上车 先下车）的行程距离为准。";
    serviceItem1.font = [UIFont systemFontOfSize:11];
    serviceItem1.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [ruleScroll addSubview:serviceItem1];
    
    
    //  其他费用
    UILabel *honoraria = [[UILabel alloc]initWithFrame:CGRectMake(x, serviceItem1.bottom+15, 80, 20)];
    honoraria.text = @"其他费用";
    honoraria.font = [UIFont systemFontOfSize:14];
    honoraria.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [ruleScroll addSubview:honoraria];
    
    UILabel *honorariaItem1 = [[UILabel alloc]initWithFrame:CGRectMake(x, honoraria.bottom+5, self.view.width-x*2, 50)];
    honorariaItem1.numberOfLines = 0;
    honorariaItem1.text = @"共乘段发生的高速公路通行费、过桥费及其他额外费用由乘车人1与乘车人2以均摊形式共同承担；独乘段发生的额外费用由乘车人1独自承担。";
    honorariaItem1.font = [UIFont systemFontOfSize:11];
    honorariaItem1.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [ruleScroll addSubview:honorariaItem1];
    
    
    //  关于发票
    UILabel *other = [[UILabel alloc]initWithFrame:CGRectMake(x, honorariaItem1.bottom+15, 80, 20)];
    other.text = @"关于发票";
    other.font = [UIFont systemFontOfSize:14];
    other.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [ruleScroll addSubview:other];
    
    UILabel *otherItem1 = [[UILabel alloc]initWithFrame:CGRectMake(x, other.bottom+5, self.view.width-x*2, 60)];
    otherItem1.numberOfLines = 0;
    otherItem1.text = @"由于乘车人1行程的起、终点与乘车人2行程的上、下车点位置并不完全一致，乘车人1通常需要经历一定程度的绕行和等待，因此乘车人1可在下车时向出租车承运人索取发票，乘车人2通常无法索取发票；双方另有约定的，按照其约定。";
    otherItem1.font = [UIFont systemFontOfSize:11];
    otherItem1.textColor = [UIColor colorWithRed:102.0/255.0f green:102.0/255.0f blue:102.0/255.0f alpha:1];
    [ruleScroll addSubview:otherItem1];
    [ruleScroll setContentSize:CGSizeMake(0, otherItem1.bottom+10)];
    
}


@end
