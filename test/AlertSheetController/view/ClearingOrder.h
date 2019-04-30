//
//  ClearingOrder.h
//  test
//
//  Created by 亭子 on 2019/4/29.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "BasicView.h"

@class ClearingOrder;
@protocol ClearingOrderDelegate <NSObject>

- (void)didSelectPayButton;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ClearingOrder : BasicView{
    UILabel     *title;
    UIImageView *icon;
    UILabel     *msg;
    UIView      *line;
    
    UILabel     *tripMode;      //  出行方式
    UILabel     *orderNumb;     //  价格
    UILabel     *gift;          //  红包
    UILabel     *giftNumb;      //  可用红包
    UILabel     *totalNumb;     //  总价
    UILabel     *errMsg;        //  失败信息
    
    UIButton    *aliPay;   //
    UIButton    *wxPay;
    UIButton    *selectAli;
    UIButton    *selectWX;
    
    
    UIButton    *finish;        //  完成
}

@property (nonatomic, weak) id <ClearingOrderDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
