//
//  StartOption.h
//  test
//
//  Created by 亭子 on 2019/4/29.
//  Copyright © 2019 T_T. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConditionView.h"

NS_ASSUME_NONNULL_BEGIN

@class StartOption;
@protocol StartOptionDelegate <NSObject>

- (void)optionView:(StartOption *)view didSelectOption:(NSDictionary *)options;

@end

@interface StartOption : UIView
{
    ConditionView *people;
    ConditionView *time;
    ConditionView *other;
    UIButton    *done;
}

@property (nonatomic, weak) id <StartOptionDelegate>delegate;

- (void)setViewStyle;

@end

NS_ASSUME_NONNULL_END
