//
//  MatchingMoreOptionsController.m
//  test
//
//  Created by 亭子 on 2019/5/14.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "MatchingMoreOptionsController.h"

@interface MatchingMoreOptionsController ()<UIGestureRecognizerDelegate>
{
    UIImageView *bgView;
}
@end

@implementation MatchingMoreOptionsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    
    [self addChildView];
    [self addGesture];
}
- (void)addChildView
{
    bgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Button_Background_White"]];
    bgView.frame = CGRectMake(0, SCREEN_HEIGHT-150, SCREEN_WIDTH, 150);
    bgView.userInteractionEnabled = YES;
    [self.view addSubview:bgView];
    
    CGFloat btnH = 87;
    CGFloat btnW = 80;
    CGFloat space = 50;
    CGFloat x = (bgView.width-btnW*2-space)/2;
    CGFloat y = bgView.height/2-btnH/2;
    
    
    UIButton *change = [UIButton buttonWithType:UIButtonTypeCustom];
    change.frame = CGRectMake(x, y, btnW, btnH);
    change.titleLabel.font = [UIFont systemFontOfSize:12];
    [change setImage:[UIImage imageNamed:@"Button_Background_Change"] forState:UIControlStateNormal];
    [change setTitle:@"修改特殊需求" forState:UIControlStateNormal];
    [change setTitleColor:[UIColor colorWithString:@"#333333"] forState:UIControlStateNormal];
    [change setImageEdgeInsets:UIEdgeInsetsMake(-10, 10, 10, 10)];
    [change setTitleEdgeInsets:UIEdgeInsetsMake(65, -60, 0, 0)];
    [change addTarget:self action:@selector(changeInDemand) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:change];
    
    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeCustom];
    cancel.frame = CGRectMake(x+space+btnW, y, btnW, btnH);
    cancel.titleLabel.font = [UIFont systemFontOfSize:12];
    [cancel setImage:[UIImage imageNamed:@"Button_Background_Cancel"] forState:UIControlStateNormal];
    [cancel setTitle:@"取消订单" forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor colorWithString:@"#333333"] forState:UIControlStateNormal];
    [cancel setImageEdgeInsets:UIEdgeInsetsMake(-10, 10, 10, 10)];
    [cancel setTitleEdgeInsets:UIEdgeInsetsMake(65, -60, 0, 0)];
    [cancel addTarget:self action:@selector(cancelOrder) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:cancel];
}

- (void)addGesture
{
    UIView *tapView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-bgView.height)];
    [self.view addSubview:tapView];
    UITapGestureRecognizer *touch = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissSelf)];
    [tapView addGestureRecognizer:touch];
}

- (void)dismissSelf
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)changeInDemand
{
    if ([self.delegate respondsToSelector:@selector(didClickChangeInDemandButton)]) {
        [self.delegate didClickChangeInDemandButton];
        [self dismissSelf];
    }
}

- (void)cancelOrder
{
    if ([self.delegate respondsToSelector:@selector(didClickCancelOrderButton)]) {
        [self.delegate didClickCancelOrderButton];
        [self dismissSelf];
    }
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
