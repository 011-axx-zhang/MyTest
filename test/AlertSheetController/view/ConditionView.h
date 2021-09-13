//
//  ConditionView.h
//  test
//
//  Created by 亭子 on 2019/4/29.
//  Copyright © 2019 T_T. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, OptionViewType) {
    OptionViewTypePeople      = 1,
    OptionViewTypeTime    = 2,
    OptionViewTypeOther   = 3,
};

NS_ASSUME_NONNULL_BEGIN

@interface ConditionView : UIView
{
    UILabel     *viewTitle;
    UILabel     *subTitle;
    
    NSMutableArray *iconsView;
}

@property (nonatomic, assign) OptionViewType type;
@property (nonatomic, copy) NSArray *icons;



/**
 设置view的数据

 @param type view类型
 @param title 描述内容
 @param imgs 选中的其他需求，可以为空
 */
- (void)setViewType:(OptionViewType)type titleStr:(NSString *)title otherImages:(nullable NSArray *)imgs;

@end

NS_ASSUME_NONNULL_END
