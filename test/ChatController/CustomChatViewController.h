//
//  CustomChatViewController.h
//  test
//
//  Created by 亭子 on 2019/3/12.
//  Copyright © 2019 Tima. All rights reserved.
//

#import "RootViewController.h"
#import <TChatController.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomChatViewController : RootViewController
@property (nonatomic, strong) TConversationCellData *conversation;

@end

NS_ASSUME_NONNULL_END
