//
//  PeopleNumberViewController.m
//  test
//
//  Created by 亭子 on 2019/4/30.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "PeopleNumberViewController.h"

@interface PeopleNumberViewController ()

@end

@implementation PeopleNumberViewController

- (void)addChildView
{
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-330, SCREEN_WIDTH, 330)];
    [self.view addSubview:bgView];
    
    
    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    cancel.frame = CGRectMake(10, 10, 40, 40);
    [cancel setImage:[UIImage imageNamed:@"Cancel"] forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:cancel];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(bgView.width/2-90, 20, 180, 30)];
    title.text = @"请选择您的乘车人数";
    title.font = [UIFont systemFontOfSize:18];
    title.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:title];
    
    picker = [[UIPickerView alloc]initWithFrame:CGRectMake(bgView.width/2-40, bgView.height/2-80, 80, 160)];
//    picker.backgroundColor = [UIColor redColor];
    picker.delegate = self;
    picker.dataSource = self;
    [bgView addSubview:picker];
    
    
    finish = [UIButton buttonWithType:UIButtonTypeCustom];
    finish.frame = CGRectMake(15, bgView.height-18-46, bgView.width-30, 46);
    finish.titleLabel.font = [UIFont systemFontOfSize:16];
    [finish setTitle:@"1 人" forState:UIControlStateNormal];
    [finish setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [finish setBackgroundImage:[UIImage imageNamed:@"ButtonBackgroundImage"] forState:UIControlStateNormal];
    [bgView addSubview:finish];
    [picker selectRow:0 inComponent:0 animated:YES];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 4;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60;
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = [[UILabel alloc]init];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:24];
    label.text = [NSString stringWithFormat:@"%ld 人",row+1];
    return label;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [finish setTitle:[NSString stringWithFormat:@"%ld 人",row+1] forState:UIControlStateNormal];
}


- (void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
