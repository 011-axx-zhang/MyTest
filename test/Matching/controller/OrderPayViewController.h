//
//  OrderPayViewController.h
//  test
//
//  Created by 亭子 on 2019/5/16.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "RootViewController.h"
#import "PaySelectPayTypeView.h"
#import "PayFailureView.h"
#import "PayReconfirmView.h"
#import "PayFinishAppraiseOrder.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderPayViewController : RootViewController<PaySelectPayTypeViewDelegate,PayFailureViewDelegate,PayReconfirmViewDelegate,PayFinishAppraiseOrderDelegate>
{
    PaySelectPayTypeView    *payView;
    PayFailureView          *failureView;
    PayReconfirmView        *reconfirmView;
    PayFinishAppraiseOrder  *finishView;
}

@end

NS_ASSUME_NONNULL_END
