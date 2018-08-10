//
//  UIViewController+Base.h
//  Dong
//
//  Created by 姚智豪 on 2018/8/9.
//  Copyright © 2018年 姚智豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLiderMenuViewController.h"
/*
 #import "NavigationHelper.h"
 #import "Passable.h"
 #import "UINavigationController+Passable.h"
 */
@interface UIViewController (Base)
@property(nonatomic,readonly)SLiderMenuViewController *slideMenuController;


@end
