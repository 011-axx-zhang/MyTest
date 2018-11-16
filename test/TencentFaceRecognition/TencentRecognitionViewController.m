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

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) NSArray *subVC;
@end

@implementation TencentRecognitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"身份验证";
    
    self.tencentTable.tableFooterView = [[UIView alloc]init];
}

#pragma mark - table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dic = [self.dataSource objectAtIndex:section];
    NSLog(@"values :%ld",dic.allValues.count);
    return dic.allValues.count;
}

static NSString *cellIdentifier = @"TableCellIdentifier";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}

#pragma mark - table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *str = [[self.subVC objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    NSLog(@"选中了:%@",str);
}


- (NSArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSArray arrayWithObject:@{@"照片识别":@[@"身份证识别",
                                                           @"驾驶证识别"],
                                                 @"人脸核身":@[@"用户上传照片身份信息核验",
                                                           @"活体检测—获取唇语验证码",
                                                           @"活体检测视频身份信息核验",
                                                           @"活体检测视频与用户照片的对比",
                                                           @"人脸静态活体检测"]}];
    }
    return _dataSource;
}

- (NSArray *)subVC
{
    if (_subVC == nil) {
        _subVC = [NSArray arrayWithObjects:@[@"0-0",
                                             @"0-1"],
                                           @[@"1-0",
                                             @"1-1",
                                             @"1-2",
                                             @"1-3",
                                             @"1-4"], nil];
    }
    return _subVC;
}

@end
