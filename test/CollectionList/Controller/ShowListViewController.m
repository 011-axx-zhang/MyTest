//
//  ShowListViewController.m
//  test
//
//  Created by 亭子 on 2022/3/7.
//  Copyright © 2022 T_T. All rights reserved.
//  尝试用 collection view 实现 tableView 的样式；

#import "ShowListViewController.h"

@interface ShowListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collec;

@end

@implementation ShowListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

@end
