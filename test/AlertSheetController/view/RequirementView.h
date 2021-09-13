//
//  RequirementView.h
//  test
//
//  Created by 亭子 on 2019/5/5.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "BasicView.h"


@class RequirementView;
@protocol RequirementViewDelegate <NSObject>

- (void)didSelectRequireOptions;

@end

NS_ASSUME_NONNULL_BEGIN

@interface RequirementView : BasicView
{
    UILabel     *title;
    UILabel     *subTitle;
    
    UIButton    *luggage;
    UIButton    *pet;
    UIButton    *seat;
    UIButton    *finish;
}

@property (nonatomic, weak) id <RequirementViewDelegate> delegate;


@end

NS_ASSUME_NONNULL_END
