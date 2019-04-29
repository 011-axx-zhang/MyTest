//
//  ConditionView.m
//  test
//
//  Created by 亭子 on 2019/4/29.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "ConditionView.h"

@implementation ConditionView

//- (instancetype)initWithFrame:(CGRect)frame viewType:(OptionViewType)type otherImages:(nullable NSArray *)images
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        self.type = type;
//        if (images) {
//            self.icons = images;
//        }
//        [self addChildView];
//    }
//    return self;
//}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addChildView];
    }
    return self;
}

- (void)addChildView
{
    //  标题
    viewTitle = [[UILabel alloc]init];
    viewTitle.font = [UIFont systemFontOfSize:12];
    viewTitle.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
    viewTitle.textAlignment = NSTextAlignmentCenter;
    
    
    //  描述
    subTitle = [[UILabel alloc]init];
    subTitle.textAlignment = NSTextAlignmentCenter;
    subTitle.numberOfLines = 0;
    
    
    iconsView = [[NSMutableArray alloc]init];
    for (int i=0; i<3; i++) {
//        UIImage *img = [UIImage imageNamed:self.icons[i]];
        UIImageView *icon = [[UIImageView alloc]init];
        icon.hidden = YES;
        [self addSubview:icon];
        [iconsView addObject:icon];
    }
    
    
    [self addSubview:viewTitle];
    [self addSubview:subTitle];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    viewTitle.frame = CGRectMake(0, 22, self.frame.size.width, 17);
    
    CGFloat y = CGRectGetMaxY(viewTitle.frame);
    CGFloat w = 22;
    
    subTitle.frame = CGRectMake(0, y+4, self.frame.size.width, 40);
    
    
    NSArray *colors = @[[UIColor redColor],[UIColor blackColor],[UIColor grayColor]];
    CGFloat x = 14;
    for (int i=0; i<iconsView.count; i++) {
        UIImageView *img = [iconsView objectAtIndex:i];
        img.frame = CGRectMake(x+i*w+i*x, y+4, w, w);
        img.backgroundColor = [colors objectAtIndex:i];
    }
}


- (void)setViewType:(OptionViewType)type titleStr:(NSString *)title otherImages:(NSArray *)imgs
{
    self.type = type;
    switch (type) {
        case OptionViewTypePeople:{
            viewTitle.text = [NSString stringWithFormat:@"出行人数"];
            subTitle.text = [NSString stringWithFormat:@"2人"];
        }
            break;
        case OptionViewTypeTime:{
            viewTitle.text = [NSString stringWithFormat:@"出发时间"];
            subTitle.attributedText = [self attributedStr:@"今日\n12:40 - 16:20"];
        }
            break;
        case OptionViewTypeOther:{
            viewTitle.text = [NSString stringWithFormat:@"其他需求"];
            subTitle.hidden = YES;
            for (int i=0; i<3; i++) {
                UIImageView *img = [iconsView objectAtIndex:i];
                img.hidden = NO;
            }
        }
            break;
    }
}

- (NSAttributedString *)attributedStr:(NSString *)str
{
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attriStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 5)];
    [attriStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14] range:NSMakeRange(0, str.length)];
    
    NSTextAttachment *attchImage = [[NSTextAttachment alloc] init];
    // 表情图片
    attchImage.image = [UIImage imageNamed:@"Location_Start_Point"];
    // 设置图片大小
    attchImage.bounds = CGRectMake(0, -5, 20, 20);
    NSAttributedString *stringImage = [NSAttributedString attributedStringWithAttachment:attchImage];
    [attriStr insertAttributedString:stringImage atIndex:0];
    
    
    return attriStr;
}

@end
