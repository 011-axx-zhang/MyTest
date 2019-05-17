//
//  PayFailureView.h
//  test
//
//  Created by 亭子 on 2019/5/16.
//  Copyright © 2019 T_T. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol PayFailureViewDelegate <NSObject>

- (void)payAgain;

@end
@interface PayFailureView : UIView
{
    UILabel *navTitle;
    UILabel *msg;
    UIImageView *icon;
    UIButton *payAgain;
}
@property (nonatomic, assign) id <PayFailureViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
