//
//  TaxiFareEstimate.m
//  test
//
//  Created by 亭子 on 2019/5/5.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "TaxiFareEstimate.h"

@interface TaxiFareEstimate ()

@end

@implementation TaxiFareEstimate

- (void)addNavView
{
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    navView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navView];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 63, navView.width, 1)];
    line.backgroundColor = [UIColor grayColor];
    [navView addSubview:line];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(navView.width/2-80, 22, 160, 44)];
    title.text = @"车费预估";
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont systemFontOfSize:16];
    title.textColor = [UIColor blackColor];
    [navView addSubview:title];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 22, 44, 44);
//    [back setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [back setTitle:@"back" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(popController) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:back];
    
    
    UIButton *info = [UIButton buttonWithType:UIButtonTypeCustom];
    info.frame = CGRectMake(navView.width-15-50, 22, 50, 44);
    info.titleLabel.font = [UIFont systemFontOfSize:12];
    [info setTitle:@"计价规则" forState:UIControlStateNormal];
    [info setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [info addTarget:self action:@selector(priceRule) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:info];
}


- (void)addChildView
{
    UILabel *hitchhike = [[UILabel alloc]initWithFrame:CGRectMake(self.view.width/2-24, 64+23, 48, 22)];
//    hitchhike.textColor = [UIColor colorWithRed:102 green:102 blue:102 alpha:1];
    hitchhike.textColor = [UIColor blackColor];
    hitchhike.font = [UIFont systemFontOfSize:12];
    hitchhike.textAlignment = NSTextAlignmentCenter;
    hitchhike.text = @"顺风车";
    [self.view addSubview:hitchhike];
    
    UILabel *hPriceL = [[UILabel alloc]initWithFrame:CGRectMake(35, hitchhike.bottom+20, 111, 17)];
//    hPrice.textColor = [UIColor colorWithRed:102 green:102 blue:102 alpha:1];
    hPriceL.textColor = [UIColor blackColor];
    hPriceL.font = [UIFont systemFontOfSize:12];
    hPriceL.textAlignment = NSTextAlignmentCenter;
    hPriceL.text = @"顺风车费（一口价）";
    [self.view addSubview:hPriceL];
    
    UILabel *tipL = [[UILabel alloc]initWithFrame:CGRectMake(35, hPriceL.bottom+17, 39, 17)];
//    tip.textColor = [UIColor colorWithRed:102 green:102 blue:102 alpha:1];
    tipL.textColor = [UIColor blackColor];
    tipL.font = [UIFont systemFontOfSize:12];
    tipL.textAlignment = NSTextAlignmentCenter;
    tipL.text = @"感谢费";
    [self.view addSubview:tipL];
    
    UILabel *hPriceR = [[UILabel alloc]initWithFrame:CGRectMake(self.view.width-35-38, hitchhike.bottom+20, 38, 17)];
    //    hPrice.textColor = [UIColor colorWithRed:102 green:102 blue:102 alpha:1];
    hPriceR.textColor = [UIColor blackColor];
    hPriceR.font = [UIFont systemFontOfSize:12];
    hPriceR.textAlignment = NSTextAlignmentCenter;
    hPriceR.text = @"19.5元";
    [self.view addSubview:hPriceR];
    
    UILabel *tipR = [[UILabel alloc]initWithFrame:CGRectMake(self.view.width-35-38, hPriceR.bottom+17, 38, 17)];
    //    tip.textColor = [UIColor colorWithRed:102 green:102 blue:102 alpha:1];
    tipR.textColor = [UIColor blackColor];
    tipR.font = [UIFont systemFontOfSize:12];
    tipR.textAlignment = NSTextAlignmentCenter;
    tipR.text = @"10.0元";
    [self.view addSubview:tipR];
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(35, hPriceR.bottom+14, self.view.width-70, 1)];
    line.backgroundColor = [UIColor blackColor];
    [self.view addSubview:line];
    
    UILabel *total = [[UILabel alloc]initWithFrame:CGRectMake(self.view.width-35-line.width, line.bottom+20, line.width, 38)];
    total.textAlignment = NSTextAlignmentRight;
    total.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:total];
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:@"预计支付金额：7.40元"];
    [attriStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 5)];
    [attriStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:27] range:NSMakeRange(7, 4)];
    total.attributedText = attriStr;
    
    UILabel *boldLine = [[UILabel alloc]initWithFrame:CGRectMake(0, total.bottom+23, self.view.width, 15)];
    boldLine.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:boldLine];
    
    UILabel *taxtTitle = [[UILabel alloc]initWithFrame:CGRectMake(self.view.width/2-24, boldLine.bottom+23, 80, 22)];
    //    hitchhike.textColor = [UIColor colorWithRed:102 green:102 blue:102 alpha:1];
    taxtTitle.textColor = [UIColor blackColor];
    taxtTitle.font = [UIFont systemFontOfSize:12];
    taxtTitle.textAlignment = NSTextAlignmentCenter;
    taxtTitle.text = @"出租车合乘";
    [self.view addSubview:taxtTitle];
    
    UILabel *taxtPriceL = [[UILabel alloc]initWithFrame:CGRectMake(35, taxtTitle.bottom+20, 80, 17)];
    //    hPrice.textColor = [UIColor colorWithRed:102 green:102 blue:102 alpha:1];
    taxtPriceL.textColor = [UIColor blackColor];
    taxtPriceL.font = [UIFont systemFontOfSize:12];
    taxtPriceL.textAlignment = NSTextAlignmentCenter;
    taxtPriceL.text = @"出租车车费";
    [self.view addSubview:taxtPriceL];
    
    UILabel *taxtPriceR = [[UILabel alloc]initWithFrame:CGRectMake(self.view.width-35-38, taxtTitle.bottom+20, 38, 17)];
    //    tip.textColor = [UIColor colorWithRed:102 green:102 blue:102 alpha:1];
    taxtPriceR.textColor = [UIColor blackColor];
    taxtPriceR.font = [UIFont systemFontOfSize:12];
    taxtPriceR.textAlignment = NSTextAlignmentCenter;
    taxtPriceR.text = @"20.0元";
    [self.view addSubview:taxtPriceR];
}




- (void)priceRule
{
    NSLog(@"计价规则");
}
- (void)popController
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
