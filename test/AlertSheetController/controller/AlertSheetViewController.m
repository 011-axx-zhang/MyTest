//
//  AlertSheetViewController.m
//  test
//
//  Created by 亭子 on 2019/4/29.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "AlertSheetViewController.h"

@interface AlertSheetViewController ()

@end

@implementation AlertSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    optionsView = [[StartOption alloc]initWithFrame:CGRectMake(15, 300, self.view.frame.size.width-30, 300)];
    optionsView.delegate = self;
    [optionsView setViewStyle];
    [self.view addSubview:optionsView];
}

- (void)optionView:(StartOption *)view didSelectOption:(NSDictionary *)options
{
    NSLog(@"选择的参数:%@",options);
}


@end
