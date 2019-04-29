//
//  DatePicker.h
//  test
//
//  Created by 亭子 on 2019/4/29.
//  Copyright © 2019 Tima. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DatePicker : UIView<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>
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

NS_ASSUME_NONNULL_END
