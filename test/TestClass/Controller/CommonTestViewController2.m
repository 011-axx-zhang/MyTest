//
//  CommonTestViewController2.m
//  test
//
//  Created by 亭子 on 2022/8/24.
//  Copyright © 2022 T_T. All rights reserved.
//

#import "CommonTestViewController2.h"

@interface CommonTestViewController2 ()

@end

@implementation CommonTestViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 60, 30)];
    title.text = @"vc2";
    title.textColor = [UIColor blackColor];
    [self.view addSubview:title];
    
    UIButton *dismiss = [UIButton buttonWithType:UIButtonTypeCustom];
    dismiss.frame = CGRectMake(self.view.width/2-40, self.view.height/2+50, 80, 50);
    [dismiss setTitle:@"dismiss1" forState:UIControlStateNormal];
    [dismiss setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [dismiss addTarget:self action:@selector(dismissAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismiss];
}

- (void)dismissAction{
    [self dismissViewControllerAnimated:YES completion:nil];
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
