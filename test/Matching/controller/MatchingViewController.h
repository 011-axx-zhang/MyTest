//
//  MatchingViewController.h
//  test
//
//  Created by 亭子 on 2019/5/13.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "RootViewController.h"
#import "MatchingView.h"
#import "RouteInfoView.h"
#import "MatchingMoreOptionsController.h"
#import "MatchingColorSettingViewController.h"
#import "OrderPayViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MatchingViewController : RootViewController<RouteInfoViewDelegate,MatchingAlertDelegate,MatchingViewDelegate>
{
    MatchingView *matchInfo;
    RouteInfoView *routeView;
}


@end

NS_ASSUME_NONNULL_END
