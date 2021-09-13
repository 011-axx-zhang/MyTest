//
//  RouteInfoStyleSubview.h
//  test
//
//  Created by 亭子 on 2019/5/14.
//  Copyright © 2019 T_T. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RouteInfoStyleSubview : UIView
{
    UILabel *title;
    UIImageView *icon;
    UIButton *price;
//    UILabel *price;
}

@property (nonatomic, copy) NSString *titleName;
@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, copy) NSString *priceName;

@end

NS_ASSUME_NONNULL_END
