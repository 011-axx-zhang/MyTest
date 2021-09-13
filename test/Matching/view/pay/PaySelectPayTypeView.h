//
//  PaySelectPayTypeView.h
//  test
//
//  Created by 亭子 on 2019/5/16.
//  Copyright © 2019 T_T. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoButton.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PaySelectPayTypeViewDelegate <NSObject>

- (void)didClickPriceInfo;
- (void)didSelectPayType:(NSInteger)type price:(CGFloat)price;

@end

@interface PaySelectPayTypeView : UIView
{
    UILabel *navTitle;
    InfoButton *price;
    UIButton *aliPayL;
    UIButton *aliPayR;
    UIButton *wxPayL;
    UIButton *wxPayR;
    UIButton *confim;
    UIButton *selectBtn;
}

@property (nonatomic, assign) id <PaySelectPayTypeViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
