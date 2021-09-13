//
//  MatchingColorSettingViewController.m
//  palmobility
//
//  Created by 亭子 on 2019/5/15.
//  Copyright © 2019 TimaNetwork. All rights reserved.
//

#import "MatchingColorSettingViewController.h"

@interface MatchingColorSettingViewController ()
{
    UIView *colorView;
    UIButton *selectItem;
}
@end

@implementation MatchingColorSettingViewController

- (void)viewDidLoad {
    
    self.view.backgroundColor = kWhiteColor;
    
    [self addNavView];
    [self addChildView];
}

- (void)addChildView
{
    UIImageView *bgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH_2-155/2, SCREEN_HEIGHT_2-316/2, 155, 316)];
    [bgView setImage:[UIImage imageNamed:@"Matching_Color_Select_Color"]];
    [self.view addSubview:bgView];
    
    colorView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH_2-139/2, SCREEN_HEIGHT_2-246/2, 139, 246)];
    colorView.backgroundColor = [UIColor colorWithString:@"#44ABF1"];
    [self.view addSubview:colorView];
    
    UIImageView *line = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Line3"]];
    line.frame = CGRectMake(15, SCREEN_HEIGHT-107, SCREEN_WIDTH-30, 1);
    [self.view addSubview:line];
    
    
    NSArray *colors = @[[UIColor colorWithString:@"#44ABF1"],
                        [UIColor colorWithString:@"#F5A623"],
                        [UIColor colorWithString:@"#F8E71C"],
                        [UIColor colorWithString:@"#7ED321"],
                        [UIColor colorWithString:@"#50E3C2"]];
    UIScrollView *colorScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-100, SCREEN_WIDTH, 100)];
    colorScroll.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:colorScroll];
    
    CGFloat btnW = 64;
    CGFloat y = (100-64)/2;
    CGFloat space = 15;
    CGFloat contentSize = 0;
    for (int i=0; i<colors.count; i++) {
        UIButton *color = [UIButton buttonWithType:UIButtonTypeCustom];
        color.frame = CGRectMake(space+btnW*i+space*i, y, btnW, btnW);
        color.layer.cornerRadius = 4;
        [color setImage:[UIImage imageNamed:@"Matching_Color_Select_Color_Item"] forState:UIControlStateSelected];
        [color setImage:nil forState:UIControlStateNormal];
        [color setBackgroundColor:colors[i]];
        [color addTarget:self action:@selector(selectColorView:) forControlEvents:UIControlEventTouchUpInside];
        [color setImageEdgeInsets:UIEdgeInsetsMake(btnW-24, btnW-24, 0, 0)];
        [colorScroll addSubview:color];
        contentSize = color.right+15;
        
        if (i==0) {
            color.selected = YES;
            selectItem = color;
        }
    }
    [colorScroll setContentSize:CGSizeMake(contentSize, 0)];
}


- (void)addNavView
{
    UIButton *navBack = [UIButton buttonWithType:UIButtonTypeCustom];
    navBack.frame = CGRectMake(15, SafeAreaTopHeight, 44, 44);
    [navBack setImage:[UIImage imageNamed:@"Navigation_Back"] forState:UIControlStateNormal];
    [navBack addTarget:self action:@selector(backViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:navBack];
    
    UILabel *navTitle = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH_2-40, SafeAreaTopHeight, 80, 44)];
    navTitle.text = @"颜色选择";
    navTitle.font = [UIFont boldSystemFontOfSize:14];
    navTitle.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:navTitle];
    
    UIButton *confim = [UIButton buttonWithType:UIButtonTypeCustom];
    confim.frame = CGRectMake(SCREEN_WIDTH-44-15, SafeAreaTopHeight, 44, 44);
    confim.titleLabel.font = [UIFont systemFontOfSize:14];
    [confim setTitleColor:kBlackColor forState:UIControlStateNormal];
    [confim setTitle:@"确认" forState:UIControlStateNormal];
    [confim addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confim];
}



- (void)selectColorView:(UIButton *)button
{
    colorView.backgroundColor = button.backgroundColor;
    selectItem.selected = NO;
    button.selected = YES;
    selectItem = button;
}

- (void)changeColor
{
    self.bgColor = colorView.backgroundColor;
    [self backViewController];
}

- (void)backViewController
{
    [self.navigationController popViewControllerAnimated:YES];
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
