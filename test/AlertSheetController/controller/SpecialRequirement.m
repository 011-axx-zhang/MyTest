//
//  SpecialRequirement.m
//  test
//
//  Created by 亭子 on 2019/5/5.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "SpecialRequirement.h"


@interface SpecialRequirement ()
{
    RequirementView *option;
}

@end

@implementation SpecialRequirement

- (void)addChildView
{
    option = [[RequirementView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-320, SCREEN_WIDTH, 320)];
    option.delegate = self;
    [self.view addSubview:option];
}


- (void)didSelectRequireOptions
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
