//
//  AlertSheetViewController.h
//  test
//
//  Created by 亭子 on 2019/4/29.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "RootViewController.h"
#import "StartOption.h"
#import "ClearingOrder.h"

NS_ASSUME_NONNULL_BEGIN

@interface AlertSheetViewController : RootViewController<StartOptionDelegate>
{
    StartOption *optionsView;
    ClearingOrder *orderView;
}

@end

NS_ASSUME_NONNULL_END
