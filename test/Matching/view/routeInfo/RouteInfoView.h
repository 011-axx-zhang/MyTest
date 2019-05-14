//
//  RouteInfoView.h
//  test
//
//  Created by 亭子 on 2019/5/13.
//  Copyright © 2019 T_T. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RouteInfoStyleSubview.h"
@class RouteInfoView;
@protocol RouteInfoViewDelegate <NSObject>

- (void)didClickPullUPAction:(RouteInfoView *)view;

@end
NS_ASSUME_NONNULL_BEGIN

@interface RouteInfoView : UIView
{
    UIImageView *bgView;
    UIImageView *itemBG;
    UIImageView *iconL;
    
    UILabel     *timeL;
    UILabel     *timeR;
    UILabel     *getOn;
    UILabel     *getDown;
    UILabel     *price;
    UILabel     *numberL;
    UILabel     *numberR;
    UILabel     *line;
    
    NSMutableArray *icons;
    RouteInfoStyleSubview   *styleL;
    RouteInfoStyleSubview   *styleR;
    
    UIButton    *pullUp;
}

@property (nonatomic, assign) id <RouteInfoViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
