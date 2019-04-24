//
//  CustomKeyboardController.m
//  test
//
//  Created by Admin on 2019/1/15.
//  Copyright © 2019 Tima. All rights reserved.
//

#import "CustomKeyboardController.h"

@interface CustomKeyboardController (){
    UITextField     *pwdView;
}

@end

@implementation CustomKeyboardController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"安全文本";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(30, 100, 80, 30)];
    title.text = @"请输入密码";
    title.textColor = [UIColor blackColor];
    title.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:title];
    
    pwdView = [[UITextField alloc]initWithFrame:CGRectMake(110, 100, 230, 30)];
//    pwdView.backgroundColor = [UIColor redColor];
    pwdView.placeholder = @"请输入密码";
    pwdView.inputView = nil;
    [self.view addSubview:pwdView];
}
@end
