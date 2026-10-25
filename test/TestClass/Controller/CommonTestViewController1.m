//
//  CommonTestViewController1.m
//  test
//
//  Created by 亭子 on 2022/8/24.
//  Copyright © 2022 T_T. All rights reserved.
//

#import "CommonTestViewController1.h"
#import "CommonTestViewController2.h"


@interface CommonTestViewController1 ()

@end

@implementation CommonTestViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *present = [UIButton buttonWithType:UIButtonTypeCustom];
    present.frame = CGRectMake(self.view.width/2-40, self.view.height/2-25, 80, 50);
    [present setTitle:@"present1" forState:UIControlStateNormal];
    [present setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [present addTarget:self action:@selector(presentAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:present];
    
    UIButton *dismiss = [UIButton buttonWithType:UIButtonTypeCustom];
    dismiss.frame = CGRectMake(self.view.width/2-40, self.view.height/2+50, 80, 50);
    [dismiss setTitle:@"dismiss1" forState:UIControlStateNormal];
    [dismiss setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [dismiss addTarget:self action:@selector(dismissAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:dismiss];
}

- (void)presentAction{
    CommonTestViewController2 *vc = [[CommonTestViewController2 alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)dismissAction{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
