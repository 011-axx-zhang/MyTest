//
//  MatchingViewController.m
//  test
//
//  Created by 亭子 on 2019/5/13.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "MatchingViewController.h"
static CGFloat const NAVHEIGHT = 79.0f;
static CGFloat const RoutelHeight = 324.0f;

@interface MatchingViewController ()

@end

@implementation MatchingViewController

- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor redColor];
    [self addChildView];
    [self addNavView];
}


- (void)addChildView
{
    matchInfo = [[MatchingView alloc]initWithFrame:CGRectMake(15, SCREEN_HEIGHT-500, SCREEN_WIDTH-30, 500)];
    matchInfo.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:matchInfo];
    
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(didDragView:)];
    [matchInfo addGestureRecognizer:gesture];
    
    routeView = [[RouteInfoView alloc]initWithFrame:CGRectMake(0, NAVHEIGHT, SCREEN_WIDTH, 0)];
    routeView.delegate = self;
    routeView.clipsToBounds = YES;
    [self.view addSubview:routeView];
}

- (void)addNavView
{
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAVHEIGHT)];
    navView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navView];
    
    UIButton *navBack = [UIButton buttonWithType:UIButtonTypeCustom];
    navBack.frame = CGRectMake(15, SafeAreaTopHeight, 44, 44);
    [navBack setImage:[UIImage imageNamed:@"Navigation_Back"] forState:UIControlStateNormal];
    [navBack addTarget:self action:@selector(backViewController) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:navBack];
    
    UILabel *navTitle = [[UILabel alloc]initWithFrame:CGRectMake(navView.width/2-50, SafeAreaTopHeight, 100, 22)];
    navTitle.textAlignment = NSTextAlignmentCenter;
    navTitle.font = [UIFont systemFontOfSize:14];
    navTitle.textColor = [UIColor colorWithString:@"#333333"];
    navTitle.text = @"顺风车";
    [navView addSubview:navTitle];
    
    
    UIButton *infoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    infoBtn.frame = CGRectMake(navView.width/2-50, navTitle.bottom, 100, 22);
    infoBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    infoBtn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    [infoBtn setTitleColor:[UIColor colorWithString:@"#999999"] forState:UIControlStateNormal];
    [infoBtn setTitle:@"浦东国际机场T2航站楼" forState:UIControlStateNormal];
    [infoBtn setImage:[UIImage imageNamed:@"Navigation_Pull_Down"] forState:UIControlStateNormal];
    [infoBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 22)];
    [infoBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 90, 0, 0)];
    [infoBtn addTarget:self action:@selector(showOrHiddenRouteView) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:infoBtn];
    
    UIButton *navInfo = [UIButton buttonWithType:UIButtonTypeCustom];
    navInfo.frame = CGRectMake(navView.width-59, SafeAreaTopHeight, 44, 44);
    [navInfo setImage:[UIImage imageNamed:@"Navigation_More_Info"] forState:UIControlStateNormal];
    [navInfo addTarget:self action:@selector(showMoreInfo) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:navInfo];
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, NAVHEIGHT-1, SCREEN_WIDTH, 1)];
    line.backgroundColor = [UIColor colorWithString:@"#eeeeee"];
    [navView addSubview:line];
}




#pragma mark - RouteInfoViewDelegate
- (void)didClickPullUPAction:(RouteInfoView *)view
{
    [self showOrHiddenRouteView];
}

#pragma mark - MatchingAlertDelegate
- (void)didClickCancelOrderButton
{
    NSLog(@"提示取消订单");
}
- (void)didClickChangeInDemandButton
{
    NSLog(@"提示修改特殊需求");
}

#pragma mark - view method
- (void)showOrHiddenRouteView
{
    if (routeView.height > 0) {
        [UIView animateWithDuration:0.1 animations:^{
            self->routeView.y = -RoutelHeight;
        } completion:^(BOOL finished) {
            self->routeView.height = 0;
        }];
    }else{
        [UIView animateWithDuration:0.1 animations:^{
            self->routeView.height = RoutelHeight;
            self->routeView.y = NAVHEIGHT;
        }];
    }
}

- (void)didDragView:(UIPanGestureRecognizer *)gesture
{
    CGPoint transP = [gesture translationInView:matchInfo];
    NSLog(@"拖动事件:%@",NSStringFromCGPoint(transP));
//    matchInfo.y = transP.y;
//    matchInfo.transform = CGAffineTransformTranslate(matchInfo.transform, 0, transP.y);
//    [gesture setTranslation:CGPointZero inView:matchInfo];
}
- (void)showMoreInfo
{
    MatchingMoreOptionsController *moreVC = [[MatchingMoreOptionsController alloc]init];
    moreVC.delegate = self;
    moreVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    moreVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self.navigationController presentViewController:moreVC animated:YES completion:nil];
}
- (void)backViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

@end
