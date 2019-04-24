//
//  VideoAndLipLanguage.m
//  test
//
//  Created by Admin on 2018/11/21.
//  Copyright © 2018 Tima. All rights reserved.
//

#import "VideoAndLipLanguage.h"

@interface VideoAndLipLanguage ()

@end

@implementation VideoAndLipLanguage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.lipLanguage.length < 1) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请前获取唇语验证码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
        [self.navigationController presentViewController:alert animated:YES completion:nil];
    }
}



@end
