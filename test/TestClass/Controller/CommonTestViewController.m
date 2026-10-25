//
//  CommonTestViewController.m
//  test
//
//  Created by 亭子 on 2022/6/3.
//  Copyright © 2022 T_T. All rights reserved.
//

#import "CommonTestViewController.h"
#import "CommonTestViewController1.h"

#import <YYKit/NSDate+YYAdd.h>
#import <YYKit/YYTimer.h>
#import <YYKit/YYCGUtilities.h>
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface CommonTestViewController ()


@end

@implementation CommonTestViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"view.frame = %@",NSStringFromCGRect(self.view.bounds));
    
    //  iPhoneX     375,812
    
    //  12 pro      390,844
    //  13 pro      390,844
    
    //  12 pro max  428,926
    //  13 pro max  428,926
    
    UIButton *present = [UIButton buttonWithType:UIButtonTypeCustom];
    present.frame = CGRectMake(self.view.width/2-40, self.view.height/2-25, 80, 50);
    [present setTitle:@"present" forState:UIControlStateNormal];
    [present setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [present addTarget:self action:@selector(presentAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:present];
}


- (void)presentAction{
    CommonTestViewController1 *vc = [[CommonTestViewController1 alloc]init];
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}


@end
