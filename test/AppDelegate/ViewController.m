//
//  ViewController.m
//  test
//
//  Created by 亭子 on 2019/4/24.
//  Copyright © 2019 Timanetwork. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
{
    NSInteger   nowEndHour;     //  今天---距离 24 点相差的时间
    NSInteger   nowHour;        //  今天---时
    NSInteger   nowMinute;      //  今天---分
    NSInteger   selectDay;      //  选中今天---今天、明天
    NSInteger   selectHour;     //  选中今天---时
    NSInteger   selectMinute;   //  选中今天---分
    UIPickerView *today;
    UIPickerView *tomorrow;
    
}

@property (nonatomic, strong) NSArray *dayArray;
@property (nonatomic, strong) NSArray *hourArray;
@property (nonatomic, strong) NSArray *minuteArray;

//  结束时间的数据源
@property (nonatomic, strong) NSArray *endHourArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat screen_width = CGRectGetWidth([UIScreen mainScreen].bounds);
    
    today = [[UIPickerView alloc]init];
    today.frame = CGRectMake(10, 100, screen_width/2-20, 200);
    today.delegate = self;
    today.dataSource = self;
    today.tag = 1001;
    [self.view addSubview:today];
    
    tomorrow = [[UIPickerView alloc]init];
    tomorrow.frame = CGRectMake(CGRectGetMaxX(today.frame), 100, screen_width/2-20, 200);
    tomorrow.delegate = self;
    tomorrow.dataSource = self;
    tomorrow.tag = 1002;
    [self.view addSubview:tomorrow];
    
    
    //  当前选中行
    selectDay = [today selectedRowInComponent:0];
    //  设置显示当前时间
    selectMinute = nowMinute;
    selectHour = nowHour;
    [today selectRow:[self.minuteArray indexOfObject:[NSNumber numberWithInteger:nowMinute]] inComponent:2 animated:YES];
    //  设置时间选择范围
    //  选择范围要多 30 分钟
    [self getMaxMinute:nowMinute];
    
}

#pragma mark - data source
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView.tag == 1001) {
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
        }
    }else{
        switch (component) {
            case 0:
                return 2;
                break;
            case 1:
                return self.endHourArray.count;
                break;
            case 2:
                return self.minuteArray.count;
                break;
        }
    }
    
    return 0;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = [[UILabel alloc]init];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    if (pickerView.tag == 1001) {
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
    }else{
        switch (component) {
            case 0:{
                label.text = [NSString stringWithFormat:@"%@",self.dayArray[row]];
            }
                break;
            case 1:{
                label.text = [NSString stringWithFormat:@"%@",self.endHourArray[row]];
            }
                break;
            case 2:{
                label.text = [NSString stringWithFormat:@"%@",self.minuteArray[row]];
            }
                break;
        }
    }
    return label;
}


#pragma mark - delegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView.tag == 1001) {
        switch (component) {
            case 0:{
                //  滑动后需要判断时、分是否在可选范围
                selectDay = row;
            }
                break;
            case 1:{
                //  判断当前时间属于哪一天，分的可选范围
                if (row + 1 > nowEndHour) {
                    selectDay = 1;
                }else{
                    selectDay = 0;
                }
                selectHour = [[self.hourArray objectAtIndex:row] integerValue];
            }
                break;
            case 2:{
                
                NSInteger m = [[self.minuteArray objectAtIndex:row] integerValue];
                if (selectHour == nowHour) {
                    if (m>selectMinute) {
                        selectMinute = m;
                    }
                }else if(selectHour > nowHour){
                    selectMinute = m ;
                }
            }
                break;
        }
    }
    
    [self refreshPickerData:component pickerView:pickerView.tag];
}

//  刷新选择器
- (void)refreshPickerData:(NSInteger)component pickerView:(NSInteger)viewTag
{
    if (viewTag == 1001) {
        switch (component) {
            case 0:{
                //  刷新时的数据源
                if (selectDay) {
                    [today selectRow:nowEndHour inComponent:1 animated:YES];
                }else{
                    [today selectRow:0 inComponent:1 animated:YES];
                }
            }
                break;
            case 1:{
                //  刷新今天、明天、分数据源
                if (selectDay) {
                    if ([today selectedRowInComponent:0] != 1) {
                        //  选中的时间为明天的时间
                        [today selectRow:1 inComponent:0 animated:YES];
                        [tomorrow selectRow:1 inComponent:0 animated:YES];
                    }
                }else{
                    //  选中的时间属于今天
                    [today selectRow:0 inComponent:0 animated:YES];
                    //  今天的话，分钟要保证大于当前
                    NSInteger m = [today selectedRowInComponent:2];
                    NSInteger numb = [[self.minuteArray objectAtIndex:m] integerValue];
                    if (selectHour == nowHour && numb < nowMinute) {
                        NSInteger row = [self.minuteArray indexOfObject:[NSNumber numberWithInteger:nowMinute]];
                        [today selectRow:row inComponent:2 animated:YES];
                    }
                }
            }
                break;
            case 2:{
                NSInteger row = [self.minuteArray indexOfObject:[NSNumber numberWithInteger:nowMinute]];
                //  判断选中的时间是否比现在小
                if (selectDay == 1) {
                    //  明天，时间随便选
                }else{
                    //  今天，必须大于现在
                    //  时要大，或者分要大于或等于
                    NSInteger m = [[self.minuteArray objectAtIndex:[today selectedRowInComponent:2]] integerValue];
                    if (selectHour <= nowHour && m <= nowMinute) {
                        [today selectRow:row inComponent:2 animated:YES];
                    }
                }
            }
                break;
        }
        //  选择了起始时间后，刷新结束时间
        
        [self refreshEndTime];
    }else{
        switch (component) {
            case 0:{
            }
                break;
            case 1:
            case 2:{
                //  要比起始时间大30分钟
                NSInteger h = [[self.hourArray objectAtIndex:[today selectedRowInComponent:1]] integerValue];
                NSInteger m  = [[self.minuteArray objectAtIndex:[today selectedRowInComponent:2]] integerValue] + 30;
                if (m >= 60) {
                    h += 1;
                    m = m - 60;
                }
                
                NSInteger hh = [[self.endHourArray objectAtIndex:[tomorrow selectedRowInComponent:1]] integerValue];
                NSInteger mm = [[self.minuteArray objectAtIndex:[tomorrow selectedRowInComponent:2]] integerValue];
                
                NSInteger local = [self.minuteArray indexOfObject:[NSNumber numberWithInteger:m]];
                
                if (hh <= h && mm < m) {
                    [tomorrow selectRow:local inComponent:2 animated:YES];
                }
            }
                break;
        }
    }
}





#pragma mark - 计算时间
- (NSArray *)getMaxHour
{
    //  得到当前时间
    NSMutableArray *maxHour = [[NSMutableArray alloc]init];
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *componets = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute fromDate:date];
    
    //  时
    nowHour = componets.hour;
    //  将分钟做处理，使分钟的间隔为5
    nowMinute = componets.minute;
    NSInteger min = nowMinute % 5;
    if (min == 0) {
        nowMinute += 5;
    }else{
        nowMinute += 5 - min;
    }
    //  如果处理之后的分钟 = 60，需要将时 + 1，分归0
    if (nowMinute == 60) {
        nowHour += 1;
        nowMinute = 0;
    }
    
    
    NSInteger i = nowHour;
    
    //  当天的结束时间点
    nowEndHour = 24 - nowHour;
    
    NSInteger tormr = 24 + nowEndHour;
    
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

- (void)getMaxMinute:(NSInteger)minute
{
    //    NSInteger toMinute = nowMinute + 30;
    NSInteger toMinute = minute + 30;
    
    if (toMinute >= 60) {
        toMinute -= 60;
    }
    NSNumber *numb = [NSNumber numberWithInteger:toMinute];
    NSInteger row = [self.minuteArray indexOfObject:numb];
    [tomorrow selectRow:row inComponent:2 animated:YES];
    
}

//  选择了起始时间后刷新结束时间的数据
- (void)refreshEndTime
{
    //  得到开始时间的 时 和 分
    NSInteger h = [today selectedRowInComponent:1];
    NSInteger m = [today selectedRowInComponent:2];
    NSInteger value = [[self.minuteArray objectAtIndex:m] integerValue];
    value += 30;
    //  对起始时间做范围限制
    if (value >= 60) {
        h += 1;
        value = value-60;
    }
    //  刷新终止时间开始的显示范围
    m = [self.minuteArray indexOfObject:[NSNumber numberWithInteger:value]];
    //  刷新结束时间的数据源
    self.endHourArray = [self getEndHour];
    [tomorrow reloadComponent:1];
    [self getMaxMinute:selectMinute];
}

//  获取结束时间---时
- (NSArray *)getEndHour
{
    NSInteger count = 3;    //  结束时间最大有3个可选范围
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    //  起始时间的时
    NSInteger h = [today selectedRowInComponent:1];
    //  如果分钟 > 30 ，结束的时只有两个可选范围
    NSInteger m = [today selectedRowInComponent:2];
    m = [[self.minuteArray objectAtIndex:m] integerValue];
    if (m >= 30) {
        count = 2;
        h += 1;
    }
    //  时间的范围
    for (int i=0; i<count; i++) {
        //  终止时间在数组中的位置
        NSString *endH = [self.hourArray objectAtIndex:h+i];
        [arr addObject:endH];
    }
    
    return [arr copy];
}

#pragma mark - 懒加载
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

- (NSArray *)endHourArray
{
    if (_endHourArray == nil) {
        _endHourArray = [self getEndHour];
    }
    return _endHourArray;
}

@end
