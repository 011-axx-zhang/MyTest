//
//  PeopleNumberViewController.h
//  test
//
//  Created by 亭子 on 2019/4/30.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "RootViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PeopleNumberViewController : RootViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIPickerView *picker;
    UIButton     *finish;
}

@end

NS_ASSUME_NONNULL_END
