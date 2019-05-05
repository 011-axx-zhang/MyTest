//
//  AlertSheetViewController.m
//  test
//
//  Created by 亭子 on 2019/4/29.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "AlertSheetViewController.h"
#import <MAMapKit/MAMapKit.h>

@interface AlertSheetViewController ()<MAMapViewDelegate,ClearingOrderDelegate>

@end

@implementation AlertSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat h = SCREEN_HEIGHT-64;
    MAMapView *_mapView = [[MAMapView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, h)];
    _mapView.delegate = self;
    _mapView.zoomLevel = 15;                //  缩放级别 3-20 值越小缩放越小
    _mapView.showsCompass = NO;             //  不显示指南针
    _mapView.rotateCameraEnabled = NO;      //  不许 camera 旋转
    _mapView.showsScale = NO;
    _mapView.pausesLocationUpdatesAutomatically = NO;   //后台定位
    
    [self.view addSubview:_mapView];
    
    
    optionsView = [[StartOption alloc]initWithFrame:CGRectMake(15, 300, self.view.frame.size.width-30, 300)];
    optionsView.delegate = self;
    [optionsView setViewStyle];
    [self.view addSubview:optionsView];
    
    orderView = [[ClearingOrder alloc]initWithFrame:CGRectMake(15, SCREEN_HEIGHT, SCREEN_WIDTH-30, 500)];
    orderView.delegate = self;
    [self.view addSubview:orderView];
}

- (void)optionView:(StartOption *)view didSelectOption:(NSDictionary *)options
{
    NSLog(@"选择的参数:%@",options);
    [UIView animateWithDuration:0.1 animations:^{
        self->orderView.y = SCREEN_HEIGHT-520;
    } completion:^(BOOL finished) {
        self->orderView.y = SCREEN_HEIGHT-520;
    }];
}

- (void)didSelectPayButton
{
    NSLog(@"去支付");
    [UIView animateWithDuration:0.2 animations:^{
        self->orderView.y = SCREEN_HEIGHT;
    } completion:^(BOOL finished) {
        self->orderView.y = SCREEN_HEIGHT;
    }];
}

- (void)clickCostInfo
{
    NSLog(@"查看费用详情");
    UIViewController *vc = [[NSClassFromString(@"TaxiFareEstimate") alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

@end
