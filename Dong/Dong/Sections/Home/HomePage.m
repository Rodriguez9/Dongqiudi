//
//  HomePageTableViewController.m
//  Dong
//
//  Created by 姚智豪 on 2018/6/13.
//  Copyright © 2018年 姚智豪. All rights reserved.
//

#import "HomePage.h"
#import "UIViewController+Base.h"
@interface HomePage ()

@end

@implementation HomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)testButtonPressed:(UIButton *)sender{
    [self.slideMenuController switchController];
}



@end
