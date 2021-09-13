//
//  PayFinishAppraiseOrder.h
//  test
//
//  Created by 亭子 on 2019/5/16.
//  Copyright © 2019 T_T. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol PayFinishAppraiseOrderDelegate <NSObject>

- (void)clickPayFinishAppraiseOrderMore;
- (void)finifhAppraiseOrder;

@end


@interface PayFinishAppraiseOrder : UIView
{
    UILabel *navTitle;
    
    UIButton *emojiL;
    UIButton *emojiC;
    UIButton *emojiR;
    
    UIScrollView    *contentView;
    
    UIButton *more;
    UIButton *commit;
    UIButton *selectEmoji;
    
    NSArray *titles;
    NSMutableArray *items;
    NSMutableArray *selectItems;
    
    CGFloat viewH;
}

@property (nonatomic, assign) id <PayFinishAppraiseOrderDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
