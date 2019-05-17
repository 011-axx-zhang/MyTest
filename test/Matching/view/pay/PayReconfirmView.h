//
//  PayReconfirmView.h
//  test
//
//  Created by 亭子 on 2019/5/16.
//  Copyright © 2019 T_T. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoButton.h"

NS_ASSUME_NONNULL_BEGIN


@protocol PayReconfirmViewDelegate <NSObject>

- (void)clickPayReconfirmPriceInfo;
- (void)clickPayReconfirmConfigBtn;

@end
@interface PayReconfirmView : UIView
{
    UILabel *navTitle;
    UILabel *priceL;
    UILabel *priceR;
    InfoButton  *price;
    UIButton    *confirm;
}

@property (nonatomic, assign)id <PayReconfirmViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
