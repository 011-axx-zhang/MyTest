//
//  PayFinishAppraiseOrder.m
//  test
//
//  Created by 亭子 on 2019/5/16.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "PayFinishAppraiseOrder.h"

@implementation PayFinishAppraiseOrder

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        viewH = 190;
        items = [[NSMutableArray alloc]init];
        selectItems = [[NSMutableArray alloc]init];
        titles = @[@"准时",@"友善",@"车内干净",@"文明礼貌",@"安全行驶",@"帮拿行李",@"开的很稳",
                   @"不太准时",@"迟到",@"态度不佳",@"车内不干净",@"危险驾驶"];
        [self addChildView];
    }
    return self;
}

- (void)addChildView
{
    contentView = [[UIScrollView alloc]init];
    contentView.showsVerticalScrollIndicator = NO;
    [self addSubview:contentView];
    
    navTitle = [[UILabel alloc]init];
    navTitle.font = [UIFont boldSystemFontOfSize:20];
    navTitle.text = @"行程已完成！评价此行程";
    navTitle.textAlignment = NSTextAlignmentCenter;
    [contentView addSubview:navTitle];
    
    emojiL = [UIButton buttonWithType:UIButtonTypeCustom];
    emojiL.titleLabel.font = [UIFont systemFontOfSize:12];
    [emojiL setImage:[UIImage imageNamed:@"Pay_Finish_Emoji_ShiWang_Normal"] forState:UIControlStateNormal];
    [emojiL setImage:[UIImage imageNamed:@"Pay_Finish_Emoji_ShiWang_Select"] forState:UIControlStateSelected];
    [emojiL setTitle:@"不满意" forState:UIControlStateNormal];
    [emojiL setTitleColor:[UIColor colorWithString:@"#bbbbbb"] forState:UIControlStateNormal];
    [emojiL setTitleColor:kBlackColor forState:UIControlStateSelected];
    [emojiL addTarget:self action:@selector(selectEmoji:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:emojiL];
    
    emojiC = [UIButton buttonWithType:UIButtonTypeCustom];
    emojiC.titleLabel.font = [UIFont systemFontOfSize:12];
    [emojiC setImage:[UIImage imageNamed:@"Pay_Finish_Emoji_YiBan_Normal"] forState:UIControlStateNormal];
    [emojiC setImage:[UIImage imageNamed:@"Pay_Finish_Emoji_YiBan_Select"] forState:UIControlStateSelected];
    [emojiC setTitle:@"一般" forState:UIControlStateNormal];
    [emojiC setTitleColor:[UIColor colorWithString:@"#bbbbbb"] forState:UIControlStateNormal];
    [emojiC setTitleColor:kBlackColor forState:UIControlStateSelected];
    [emojiC addTarget:self action:@selector(selectEmoji:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:emojiC];
    
    emojiR = [UIButton buttonWithType:UIButtonTypeCustom];
    emojiR.titleLabel.font = [UIFont systemFontOfSize:12];
    [emojiR setImage:[UIImage imageNamed:@"Pay_Finish_Emoji_Smile_Normal"] forState:UIControlStateNormal];
    [emojiR setImage:[UIImage imageNamed:@"Pay_Finish_Emoji_Smile_Select"] forState:UIControlStateSelected];
    [emojiR setTitle:@"满意" forState:UIControlStateNormal];
    [emojiR setTitleColor:[UIColor colorWithString:@"#bbbbbb"] forState:UIControlStateNormal];
    [emojiR setTitleColor:kBlackColor forState:UIControlStateSelected];
    [emojiR addTarget:self action:@selector(selectEmoji:) forControlEvents:UIControlEventTouchUpInside];
    [contentView addSubview:emojiR];
    
    
    for (int i=0; i<titles.count; i++) {
        UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
        item.titleLabel.font = [UIFont systemFontOfSize:12];
        item.layer.cornerRadius = 15;
        item.layer.borderWidth = 1.0f;
        item.clipsToBounds = YES;
        item.layer.borderColor = [UIColor colorWithString:@"#C1C1C1"].CGColor;
        item.selected = NO;
        [item setTitleColor:[UIColor colorWithString:@"#999999"] forState:UIControlStateNormal];
        [item setTitleColor:[UIColor colorWithString:@"#0160A3"] forState:UIControlStateSelected];
        [item addTarget:self action:@selector(selectPag:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:item];
        [items addObject:item];
    }
    
    more = [UIButton buttonWithType:UIButtonTypeCustom];
    [more setImage:[UIImage imageNamed:@"Pay_Finish_App_Order_Pull_Down"] forState:UIControlStateNormal];
    [more setImage:[UIImage imageNamed:@"Pay_Finish_App_Order_Pull_Up"] forState:UIControlStateSelected];
    [more addTarget:self action:@selector(more) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:more];
    
    commit = [UIButton buttonWithType:UIButtonTypeCustom];
    commit.titleLabel.font = [UIFont systemFontOfSize:16];
    commit.enabled = NO;
    [commit setBackgroundImage:[UIImage imageNamed:@"Button_Background_Normal"] forState:UIControlStateDisabled];
    [commit setBackgroundImage:[UIImage imageNamed:@"ButtonBackgroundImage"] forState:UIControlStateNormal];
    [commit addTarget:self action:@selector(clickCommit) forControlEvents:UIControlEventTouchUpInside];
    [commit setTitle:@"提交" forState:UIControlStateNormal];
    [commit setTitleColor:kWhiteColor forState:UIControlStateNormal];
    [self addSubview:commit];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    contentView.frame = CGRectMake(0, 0, self.width, viewH);
    navTitle.frame = CGRectMake(50, 20, contentView.width-100, 20);
    
    emojiL.frame = CGRectMake(72, navTitle.bottom+22, 34, 34);
    emojiC.frame = CGRectMake(emojiL.right+56, navTitle.bottom+22, 34, 34);
    emojiR.frame = CGRectMake(emojiC.right+56, navTitle.bottom+22, 34, 34);
    
    CGFloat x = 15;
    CGFloat y = emojiL.bottom+20;
    CGFloat btnW = 96;
    CGFloat btnH = 30;
    CGFloat spaceX = 25;
    CGFloat spaceY = 10;
    for (int i=0; i<items.count; i++) {
        UIButton *item = [items objectAtIndex:i];
        item.frame = CGRectMake(spaceX, y, btnW, btnH);
        [item setTitle:titles[i] forState:UIControlStateNormal];
        
        spaceX += btnW + x;
        if (spaceX+btnW+x >= SCREEN_WIDTH) {
            spaceX = 25;
            y += spaceY+btnH;
        }
    }
    
    more.frame = CGRectMake(self.width/2-48, contentView.bottom+10, 96, 20);
    
    commit.frame = CGRectMake(self.width/2-153/2, more.bottom+10, 153, 34);
}


- (void)selectEmoji:(UIButton *)emoji
{
    selectEmoji.selected = NO;
    emoji.selected = YES;
    selectEmoji = emoji;
    
    commit.enabled = YES;
}

- (void)clickCommit
{
    if (selectItems.count > 0 || selectEmoji != nil) {
        //  可以提交
        NSLog(@"点击提交按钮，提交对订单的评价");
        if ([self.delegate respondsToSelector:@selector(finifhAppraiseOrder)]) {
            [self.delegate finifhAppraiseOrder];
        }
    }
}

- (void)more
{
    if ([self.delegate respondsToSelector:@selector(clickPayFinishAppraiseOrderMore)]) {
        
        viewH = viewH == 280 ? 190 : 280;
        
        more.selected = !more.selected;
        
        [self.delegate clickPayFinishAppraiseOrderMore];
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}

- (void)selectPag:(UIButton *)button
{
    button.selected = YES;
    
    if ([selectItems containsObject:button]) {
        button.selected = !button.selected;
        [selectItems removeObject:button];
    }else{
        [selectItems addObject:button];
    }
    
    if (selectItems.count > 0 || selectEmoji != nil) {
        commit.enabled = YES;
    }else{
        commit.enabled = NO;
    }
}

@end
