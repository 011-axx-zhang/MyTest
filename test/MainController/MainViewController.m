//
//  MainViewController.m
//  test
//
//  Created by Admin on 2018/10/24.
//  Copyright © 2018年 Tima. All rights reserved.
//

#import "MainViewController.h"
#import "MapViewController.h"
//#import "NFCViewController.h"
#import "FaceRecognitionViewController.h"
#import "VehicleRouteController.h"
#import "TencentRecognitionViewController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *optionTable;


@property (nonatomic, strong) NSMutableDictionary *tableData;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configView];
    [self configDataSource];
}

- (void)configView
{
    self.optionTable.tableFooterView = [[UIView alloc]init];
}

- (void)configDataSource
{
    [self.tableData setDictionary:@{@"MapViewController":@"驾车路径规划",
                                    @"FaceRecognitionViewController":@"身份验证(云脉)",
                                    @"VehicleRouteController":@"行驶轨迹",
                                    @"TencentRecognitionViewController":@"身份验证(腾讯)",
                                    @"CustomKeyboardController":@"自定义键盘",
                                    @"CustomChatViewController":@"聊天"
                                    }];//   @"NFCViewController":@"NFC"
    [self.optionTable reloadData];
}

#pragma mark - table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *allkeys = self.tableData.allKeys;
    return allkeys.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TableCell"];
    }
    
    if (self.tableData.count) {
        NSString *key = [self.tableData.allKeys objectAtIndex:indexPath.row];
        cell.textLabel.text = [self.tableData objectForKey:key];
//        cell.detailTextLabel.text = key;
    }
    return cell;
}

#pragma mark - table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *vcStr = self.tableData.allKeys[indexPath.row];
    UIViewController *vc = [[NSClassFromString(vcStr) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - view method
- (NSMutableDictionary *)tableData
{
    if (_tableData == nil) {
        _tableData = [[NSMutableDictionary alloc]init];
    }
    return _tableData;
}


@end
