//
//  UIView+Corner.h
//  Dong
//
//  Created by YZH on 2018/8/26.
//  Copyright © 2018年 姚智豪. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UIView (Corner)
//IBInspectable可在interface中编辑
@property(nonatomic,assign) IBInspectable CGFloat cornerRadius;
@property(nonatomic,assign) IBInspectable UIColor *borderColor;
@property(nonatomic,assign) IBInspectable CGFloat borferWidth;

@end
