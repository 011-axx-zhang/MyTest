//
//  PriceRuleViewController.m
//  test
//
//  Created by 亭子 on 2019/5/5.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "PriceRuleViewController.h"
#import "RuleIFirsItemController.h"
#import "RuleSecondItemController.h"

@interface PriceRuleViewController ()
{
    UIButton    *selectItem;
    UIScrollView    *views;
}

@end

@implementation PriceRuleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addViews];
}

- (void)addNavView
{
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    [self.view addSubview:navView];
    
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 63, navView.width, 1)];
    line.backgroundColor = [UIColor grayColor];
    [navView addSubview:line];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(navView.width/2-80, 22, 160, 44)];
    title.text = @"计价规则";
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont systemFontOfSize:16];
    title.textColor = [UIColor blackColor];
    [navView addSubview:title];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 22, 44, 44);
    //    [back setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [back setTitle:@"back" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(popController) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:back];
}

- (void)addChildView
{
    UIView *segmentView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH_2-75, 84, 150, 30)];
//    segmentView.backgroundColor = [UIColor colorWithRed:245 green:245 blue:245 alpha:1];
    segmentView.backgroundColor = [UIColor grayColor];
    segmentView.layer.cornerRadius = 15;
    segmentView.layer.masksToBounds = YES;
    [self.view addSubview:segmentView];
    
    UIButton *item1 = [UIButton buttonWithType:UIButtonTypeCustom];
    item1.frame = CGRectMake(0, 0, segmentView.width/2, segmentView.height);
    item1.titleLabel.font = [UIFont systemFontOfSize:12];
    item1.tag = 101;
    item1.selected = YES;
    [item1 setTitle:@"顺风车" forState:UIControlStateNormal];
    [item1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [item1 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [item1 addTarget:self action:@selector(didSelectSegmentItem:) forControlEvents:UIControlEventTouchUpInside];
    [segmentView addSubview:item1];
    
    UIButton *item2 = [UIButton buttonWithType:UIButtonTypeCustom];
    item2.frame = CGRectMake(segmentView.width/2, 0, segmentView.width/2, segmentView.height);
    item2.titleLabel.font = [UIFont systemFontOfSize:12];
    item2.tag = 102;
    [item2 setTitle:@"出租车" forState:UIControlStateNormal];
//    [item2 setTitleColor:[UIColor colorWithRed:153 green:153 blue:153 alpha:1] forState:UIControlStateNormal];
//    [item2 setTitleColor:[UIColor colorWithRed:102 green:102 blue:102 alpha:1] forState:UIControlStateSelected];
    [item2 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [item2 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [item2 addTarget:self action:@selector(didSelectSegmentItem:) forControlEvents:UIControlEventTouchUpInside];
    [segmentView addSubview:item2];
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(segmentView.width/2, 8, 1, segmentView.height-16)];
    line.backgroundColor = [UIColor redColor];
    [segmentView addSubview:line];
    
    selectItem = item1;
    
    views = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 124, SCREEN_WIDTH, SCREEN_HEIGHT-124)];
    views.pagingEnabled = YES;
    views.showsVerticalScrollIndicator = NO;
    views.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:views];
}

- (void)addViews
{
    RuleIFirsItemController *vc = [[RuleIFirsItemController alloc]init];
    [self addChildViewController:vc];
    
    RuleSecondItemController *vc2 = [[RuleSecondItemController alloc]init];
    [self addChildViewController:vc2];
    
    [views addSubview:vc.view];
    [views addSubview:vc2.view];
    [views setContentSize:CGSizeMake(SCREEN_WIDTH*2, 0)];
    
    [vc didMoveToParentViewController:self];
    [vc2 didMoveToParentViewController:self];
    vc.view.frame = CGRectMake(0, 0, views.width, views.height);
    vc2.view.frame = CGRectMake(views.width, 0, views.width, views.height);
}


- (void)didSelectSegmentItem:(UIButton *)item
{
    if (selectItem == item) {
        return;
    }
    item.selected = YES;
    selectItem.selected = NO;
    selectItem = item;
    if (item.tag == 101) {
        [views setContentOffset:CGPointMake(0, 0)];
    }else{
        [views setContentOffset:CGPointMake(SCREEN_WIDTH, 0)];
    }
}
- (void)popController
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
@end
