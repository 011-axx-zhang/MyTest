//
//  WISimpleQuestionView.h
//  test
//
//  Created by 亭子 on 2019/5/13.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "WhiteInfoView.h"

NS_ASSUME_NONNULL_BEGIN

@interface WISimpleQuestionView : WhiteInfoView
{
    UILabel *title;
    UILabel *msg;
    UIButton    *cancelBtn;
    UIButton    *continueBtn;
}

@end

NS_ASSUME_NONNULL_END
