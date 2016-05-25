//
//  MainVC.m
//  NewAppDemo1
//
//  Created by YM on 16/5/24.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "MainVC.h"

@interface MainVC ()

@end

@implementation MainVC
#pragma mark - Lift Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutPageSubviews];
}

/**布局控件*/
- (void)layoutPageSubviews{
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

#pragma mark - Delegate

#pragma mark - Event Response

#pragma mark - Private Methods

#pragma mark - Getters and Setters


@end
