//
//  UIView+Corner.m
//  Dong
//
//  Created by YZH on 2018/8/26.
//  Copyright © 2018年 姚智豪. All rights reserved.
//

#import "UIView+Corner.h"

@implementation UIView (Corner)

-(CGFloat)cornerRadius{
    return self.layer.cornerRadius;
}

-(void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

-(UIColor *)borderColor{
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

-(void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}

-(CGFloat)borferWidth{
    return self.layer.borderWidth;
}

-(void)setBorferWidth:(CGFloat)borferWidth{
    self.layer.borderWidth = borferWidth;
}

@end
