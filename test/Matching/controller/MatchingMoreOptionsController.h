//
//  MatchingMoreOptionsController.h
//  test
//
//  Created by 亭子 on 2019/5/14.
//  Copyright © 2019 T_T. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MatchingAlertDelegate <NSObject>

- (void)didClickChangeInDemandButton;

- (void)didClickCancelOrderButton;

@end
@interface MatchingMoreOptionsController : UIViewController


@property (nonatomic, assign) id <MatchingAlertDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
