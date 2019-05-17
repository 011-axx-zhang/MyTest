//
//  OrderPayViewController.m
//  test
//
//  Created by 亭子 on 2019/5/16.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "OrderPayViewController.h"

@interface OrderPayViewController ()
{
    UIImageView *bgView;
    UIScrollView *scroll;
}

@end

@implementation OrderPayViewController

- (void)viewDidLoad {
     self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    
    [self addChildView];
}

- (void)addChildView
{
    bgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Button_Background_White"]];
    bgView.frame = CGRectMake(0, SCREEN_HEIGHT-300, SCREEN_WIDTH, 400);
    bgView.userInteractionEnabled = YES;
    [self.view addSubview:bgView];
    
    scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, bgView.width, bgView.height)];
    scroll.pagingEnabled = YES;
    scroll.scrollEnabled = NO;
    [bgView addSubview:scroll];
    
    
    //  支付
    payView = [[PaySelectPayTypeView alloc]initWithFrame:CGRectMake(0, 0, scroll.width, scroll.height)];
    payView.delegate = self;
    [scroll addSubview:payView];
    
    
    //  支付失败
    failureView = [[PayFailureView alloc]initWithFrame:CGRectMake(scroll.width, 0, scroll.width, scroll.height)];
    failureView.delegate = self;
    [scroll addSubview:failureView];

    
    //  确认支付
    reconfirmView = [[PayReconfirmView alloc]initWithFrame:CGRectMake(scroll.width*2, 0, scroll.width, scroll.height)];
    reconfirmView.delegate = self;
    [scroll addSubview:reconfirmView];
    
    
    //  评价
    finishView = [[PayFinishAppraiseOrder alloc]initWithFrame:CGRectMake(scroll.width*3, 0, scroll.width, scroll.height)];
    finishView.delegate = self;
    [scroll addSubview:finishView];
    
    [scroll setContentSize:CGSizeMake(SCREEN_WIDTH*3, 0)];
}


- (void)didClickPriceInfo
{
    NSLog(@"查看价格详情");
}

- (void)didSelectPayType:(NSInteger)type price:(CGFloat)price
{
    NSLog(@"选中支付平台，去支付");
    [scroll setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:YES];
}

- (void)payAgain
{
    NSLog(@"重新支付");
    [scroll setContentOffset:CGPointMake(SCREEN_WIDTH*2, 0) animated:YES];
}

- (void)clickPayReconfirmPriceInfo
{
    NSLog(@"查看价格详情");
}

- (void)clickPayReconfirmConfigBtn
{
    NSLog(@"确认支付");
    [scroll setContentOffset:CGPointMake(SCREEN_WIDTH*3, 0) animated:YES];
}

- (void)clickPayFinishAppraiseOrderMore
{
    if (bgView.y == SCREEN_HEIGHT-300) {
        [UIView animateWithDuration:0.3 animations:^{
            self->bgView.y = SCREEN_HEIGHT-400;
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            self->bgView.y = SCREEN_HEIGHT-300;
        }];
    }
}

- (void)finifhAppraiseOrder
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
