//
//  InfoButton.m
//  test
//
//  Created by 亭子 on 2019/5/5.
//  Copyright © 2019 T_T. All rights reserved.
//

#import "InfoButton.h"

@implementation InfoButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    
    NSDictionary *dic = @{NSFontAttributeName:self.titleLabel.font};
    titleSize = [title sizeWithAttributes:dic];
    
    NSLog(@"文字的宽度:%@",NSStringFromCGSize(titleSize));
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    
    imageSize = image.size;
}


- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat selfW = CGRectGetWidth(contentRect);
    CGFloat selfH = contentRect.size.height;
    
    if (!CGSizeEqualToSize(titleSize, CGSizeZero) && CGSizeEqualToSize(imageSize, CGSizeZero)) {
        return CGRectMake(0, 0, selfW, selfH);
    }else if (!CGSizeEqualToSize(titleSize, CGSizeZero) && !CGSizeEqualToSize(imageSize, CGSizeZero)){
        if (imageSize.width + titleSize.width >= selfW) {
            return CGRectMake(0, 0, titleSize.width, titleSize.height);
        }else{
            CGFloat space = (selfW - titleSize.width - imageSize.width)/3;
            return CGRectMake(space, 0, titleSize.width, titleSize.height);
        }
    }else{
        return CGRectMake(0, 0, 0, 0);
    }
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat selfW = CGRectGetWidth(contentRect);
    CGFloat selfH = CGRectGetHeight(contentRect);
    
    if (CGSizeEqualToSize(titleSize, CGSizeZero) && !CGSizeEqualToSize(imageSize, CGSizeZero)) {
        return CGRectMake(0, 0, imageSize.width, imageSize.height);
    }else if (!CGSizeEqualToSize(titleSize, CGSizeZero) && !CGSizeEqualToSize(imageSize, CGSizeZero)){
        if (imageSize.width + titleSize.width >= selfW) {
            return CGRectMake(0, 0, imageSize.width, imageSize.height);
        }else{
            CGFloat space = (selfW - titleSize.width - imageSize.width)/3;
            return CGRectMake(space + titleSize.width + space, selfH/2-imageSize.height/2, imageSize.width, imageSize.height);
        }
    }else{
        return CGRectMake(0, 0, 0, 0);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
