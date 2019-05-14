//
//  WIPassengerTagView.h
//  test
//
//  Created by 亭子 on 2019/5/13.
//  Copyright © 2019 T_T. All rights reserved.
//  顺风车车主标签

#import "WhiteInfoView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PassengerTagType) {
    PassengerTagTypeCarOwner,       //  顺风车车主
    PassengerTagTypeTaxiOwner,      //  出租车车主
    PassengerTagTypePassenger,      //  乘客
};

@interface WIPassengerTagView : WhiteInfoView
{
    UIImageView *pic;       //  头像
    UILabel     *name;      //  名称
    UILabel     *number;    //  车牌
    UILabel     *carType;   //  车型
    NSMutableArray  *tags;  //  标签
    UIButton    *chatBtn;   //  聊天
    UILabel     *peopleNum; //  乘车人数
    
}

@property (nonatomic, assign) PassengerTagType type;

@end

NS_ASSUME_NONNULL_END
