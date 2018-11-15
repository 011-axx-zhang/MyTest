//
//  FaceRecognitionViewController.m
//  test
//
//  Created by Admin on 2018/11/9.
//  Copyright © 2018 Tima. All rights reserved.
//

#import "FaceRecognitionViewController.h"
#import "IDCard.h"
#import "DriversLicenseController.h"
#import "FaceController.h"

@interface FaceRecognitionViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *verify;
    
    NSString *key;
    NSArray *row;
}

@property (nonatomic, strong) NSMutableDictionary *dataSource;

@end

@implementation FaceRecognitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"身份验证";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configTable];
}

- (void)configTable
{
    verify = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStyleGrouped];
    verify.delegate = self;
    verify.dataSource = self;
    verify.rowHeight = 60;
    verify.tableFooterView = [[UIView alloc]init];
    verify.sectionHeaderHeight = 40;
    verify.sectionFooterHeight = 0;
    [self.view addSubview:verify];
}

#pragma mark - table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    key = self.dataSource.allKeys[section];
    row = [self.dataSource objectForKey:key];
    return row.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    key = self.dataSource.allKeys[section];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
    label.text = key;
    label.textColor = [UIColor blackColor];
    return label;
}

static NSString *cellIdentifier = @"TableCellIdentifier";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    key = self.dataSource.allKeys[indexPath.section];
    row = [self.dataSource objectForKey:key];
    cell.textLabel.text = [row objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{
                IDCard *idCardVC = [[IDCard alloc]init];
                [self.navigationController pushViewController:idCardVC animated:YES];
            }
                break;
            case 1:{
                DriversLicenseController *driverCardVC = [[DriversLicenseController alloc]init];
                [self.navigationController pushViewController:driverCardVC animated:YES];
            }
                break;
            case 2:{
                DriversLicenseController *driverCardVC = [[DriversLicenseController alloc]init];
                [self.navigationController pushViewController:driverCardVC animated:YES];
            }
                break;
        }
    }else{
        FaceController *faceVC = [[FaceController alloc]init];
        [self.navigationController pushViewController:faceVC animated:YES];
    }
}


#pragma mark - view method
- (NSMutableDictionary *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [[NSMutableDictionary alloc]initWithDictionary:@{@"证件识别":@[@"身份证识别",@"驾驶证识别",@"驾驶证副页识别"],
                                                                       @"人脸识别":@[@"人脸比对"]}];
    }
    return _dataSource;
}
@end
