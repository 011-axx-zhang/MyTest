//
//  ViewController.m
//  test
//
//  Created by 亭子 on 2019/4/24.
//  Copyright © 2019 Timanetwork. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) NSArray *dayArray;
@property (nonatomic, strong) NSArray *hourArray;
@property (nonatomic, strong) NSArray *minuteArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat screen_width = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat screen_height = CGRectGetHeight([UIScreen mainScreen].bounds);
    
    UIPickerView *today = [[UIPickerView alloc]init];
    today.frame = CGRectMake(10, 100, screen_width-20, 200);
    today.backgroundColor = [UIColor redColor];
    today.delegate = self;
    today.dataSource = self;
    [self.view addSubview:today];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"选中回调 row = %ld  component = %ld",row,component);
    switch (component) {
        case 0:{
            //  滑动后需要判断时、分是否在可选范围
        }
            break;
        case 1:{
            //  判断当前时间属于哪一天，分的可选范围
            NSString *str = [self.hourArray objectAtIndex:row];
            NSInteger time = [str integerValue];
            NSLog(@"当前时间:%ld",time);
//            if (time) {
//                <#statements#>
//            }
        }
            break;
        case 2:{
            //
        }
            break;
    }
    [self refreshPickerData];
}

- (void)refreshPickerData
{
    
}


- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    switch (component) {
        case 0:
            return self.dayArray.count;
            break;
        case 1:
            return self.hourArray.count;
            break;
        case 2:
            return self.minuteArray.count;
            break;
            
        default:
            break;
    }
    return 0;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = [[UILabel alloc]init];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    switch (component) {
        case 0:{
            label.text = [NSString stringWithFormat:@"%@",self.dayArray[row]];
        }
            break;
        case 1:{
            label.text = [NSString stringWithFormat:@"%@",self.hourArray[row]];
        }
            break;
        case 2:{
            label.text = [NSString stringWithFormat:@"%@",self.minuteArray[row]];
        }
            break;
    }
    return label;
}


- (NSArray *)getMaxHour
{
    //  得到当前时间
    NSMutableArray *maxHour = [[NSMutableArray alloc]init];
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *componets = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:date];
    
    //  时
    NSInteger hour = componets.hour;
    NSInteger i = hour;
    NSInteger tormr = 24 + 24 - hour;
    
    while (tormr > 0) {
        i = i == 24 ? 0 : i;
        if (i < 10) {
            [maxHour addObject:[NSString stringWithFormat:@"0%ld",i]];
        }else
            [maxHour addObject:[NSString stringWithFormat:@"%ld",i]];
        i += 1;
        tormr -= 1;
    }
    return [maxHour copy];
}

- (NSArray *)getMinutes
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    NSInteger minute = 0;
    
    while (minute < 60) {
        [arr addObject:[NSNumber numberWithInteger:minute]];
        
        minute += 5;
    }
    
    return [arr copy];
}


- (NSArray *)dayArray
{
    if (_dayArray == nil) {
        _dayArray = [NSArray arrayWithObjects:@"今天",@"明天", nil];
    }
    return _dayArray;
}
- (NSArray *)hourArray
{
    if (_hourArray == nil) {
        _hourArray = [self getMaxHour];
    }
    return _hourArray;
}
- (NSArray *)minuteArray
{
    if (_minuteArray == nil) {
        _minuteArray = [self getMinutes];
    }
    return _minuteArray;
}

@end
