//
//  UIView+Frame.h
//  JACStock
//
//  Created by Admin on 2018/7/18.
//  Copyright © 2018年 Tima. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef __cplusplus
extern "C" {
#endif
    CGFloat getScreenWidth(void);
    
    CGFloat getScreenHeight(void);
#ifdef __cplusplus
}
#endif

#define SCREEN_WIDTH            getScreenWidth()
#define SCREEN_HEIGHT           getScreenHeight()
#define SCREEN_WIDTH_2          (SCREEN_WIDTH / 2)
#define SCREEN_HEIGHT_2         (SCREEN_HEIGHT / 2)



@interface UIView (Frame)

@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

@end
