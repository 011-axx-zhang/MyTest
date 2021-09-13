//
//  DatePickerController.m
//  test
//
//  Created by 亭子 on 2019/4/29.
//  Copyright © 2019 Tima. All rights reserved.
//

#import "DatePickerController.h"

@interface DatePickerController ()

@end

@implementation DatePickerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    picker = [[DatePicker alloc]initWithFrame:CGRectMake(20, 200, CGRectGetMaxX(self.view.frame)-40, 300)];
    [self.view addSubview:picker];
}

@end
