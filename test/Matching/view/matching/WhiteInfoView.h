//
//  WhiteInfoView.h
//  test
//
//  Created by 亭子 on 2019/5/13.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "BasicView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, WhiteInfoViewStyle) {
    WhiteInfoViewStyleDoubleLabel,      //  一般样式，表现为只有两个文本框
    WhiteInfoViewStyleMoreSubviews,     //  多视图样式，用于展示行程信息
    WhiteInfoViewStyleSimpleQuestion,   //  询问样式，简单的询问框，与 WhiteInfoViewStyleDoubleLabel 样式相近
    WhiteInfoViewStylePassengerTag,     //  乘客标签样式，展示乘客标签
};

@interface WhiteInfoView : BasicView
{
    UIImageView *bgView;
}

@property (nonatomic, assign) WhiteInfoViewStyle viewStyle;     //  本视图样式


- (instancetype)initWithFrame:(CGRect)frame viewStyle:(WhiteInfoViewStyle)style;

@end

NS_ASSUME_NONNULL_END
