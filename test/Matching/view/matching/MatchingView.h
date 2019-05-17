//
//  MatchingView.h
//  test
//
//  Created by 亭子 on 2019/5/13.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "BasicView.h"
#import "WIDoubleLabelView.h"
#import "WISimpleQuestionView.h"
#import "WIPassengerTagView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MatchingViewDelegate <NSObject>

- (void)didClickLocationActive;

@end

@interface MatchingView : BasicView
{
    UIButton *safeBtn;
    UIButton *locationBtn;
    
    WIDoubleLabelView *DBView;      //  双 label 展示
    WISimpleQuestionView *simpleView;   //  询问框
    WIPassengerTagView      *carOwner;  //  顺风车车主
}

@property (nonatomic, assign) id <MatchingViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
