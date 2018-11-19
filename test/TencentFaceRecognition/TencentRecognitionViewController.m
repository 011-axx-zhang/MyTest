//
//  TencentRecognitionViewController.m
//  test
//
//  Created by Admin on 2018/11/16.
//  Copyright © 2018 Tima. All rights reserved.
//

#import "TencentRecognitionViewController.h"
#import "TencentIDCard.h"

@interface TencentRecognitionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tencentTable;

@property (nonatomic, strong) NSMutableDictionary *dataSource;
@property (nonatomic, strong) NSArray *subVC;
@end

@implementation TencentRecognitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"身份验证";
    
    self.tencentTable.tableFooterView = [[UIView alloc]init];
    self.tencentTable.sectionHeaderHeight = 40;
}

#pragma mark - table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.allKeys.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = [self.dataSource.allKeys objectAtIndex:section];
    NSArray *values = [self.dataSource objectForKey:key];
    return values.count;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *view = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
    view.text = [self.dataSource.allKeys objectAtIndex:section];
    return view;
}
static NSString *cellIdentifier = @"TableCellIdentifier";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    
    NSString *key = [self.dataSource.allKeys objectAtIndex:indexPath.section];
    NSArray *value = [self.dataSource objectForKey:key];
    cell.textLabel.text = [value objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section) {
        switch (indexPath.row) {
            case 0:{
                TencentIDCard *idVC = [[TencentIDCard alloc]init];
                [self.navigationController pushViewController:idVC animated:YES];
            }
                break;
            case 1:{
                TencentIDCard *idVC = [[TencentIDCard alloc]init];
                [self.navigationController pushViewController:idVC animated:YES];
            }
                break;
        }
    }
}


- (NSMutableDictionary *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [[NSMutableDictionary alloc]init];
        [_dataSource setObject:@[@"用户上传照片身份信息核验",
                                 @"活体检测—获取唇语验证码",
                                 @"活体检测视频身份信息核验",
                                 @"活体检测视频与用户照片的对比",
                                 @"人脸静态活体检测"] forKey:@"人脸核身"];
        [_dataSource setObject:@[@"身份证识别",@"驾驶证识别"] forKey:@"照片识别"];
    }
    return _dataSource;
}

- (NSArray *)subVC
{
    if (_subVC == nil) {
        _subVC = [NSArray arrayWithObjects:@[@"1-0",@"1-1"],@[@"0-0",@"0-1",@"0-2",@"0-3",@"0-4"],nil];
    }
    return _subVC;
}

@end
