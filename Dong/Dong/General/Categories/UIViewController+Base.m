//
//  UIViewController+Base.m
//  Dong
//
//  Created by 姚智豪 on 2018/8/9.
//  Copyright © 2018年 姚智豪. All rights reserved.
//

#import "UIViewController+Base.h"

@implementation UIViewController (Base)

-(SLiderMenuViewController *)slideMenuController{
    UIViewController *controller = self.parentViewController;
    while (controller != nil) {
        if (controller.class == SLiderMenuViewController.class) {
            return (SLiderMenuViewController *)controller;
        }else{
            controller = controller.parentViewController;
        }
    }
    return nil;
}

@end
