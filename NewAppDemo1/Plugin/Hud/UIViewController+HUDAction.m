//
//  UIViewController+HUDAction.m
//  NewAppDemo1
//
//  Created by YM on 16/5/24.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "UIViewController+HUDAction.h"

#import <MBProgressHUD.h>

@implementation UIViewController (HUDAction)

#pragma mark - 显示刷新指示
- (void)showRefreshHUD{
    [self showRefreshHUD:NSUIntegerMax];
}

- (void)showRefreshHUD:(NSTimeInterval )delay{
    [self hideTips];
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        [hud hide:YES afterDelay:delay];
    });}

#pragma mark - 显示文字
- (void)showTips:(NSString *)msg{
    [self showFastTips:msg delay:NSUIntegerMax];
}

- (void)showFastTips:(NSString *)msg{
    [self showFastTips:msg delay:2];
}

- (void)showFastTips:(NSString *)msg delay:(NSTimeInterval )delay{
    [self hideTips];
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = msg;
        [hud hide:YES afterDelay:delay];
    });
}

#pragma mark -  隐藏HUD
- (void)hideTips{
    [self hideTipsWithDelay:0];
}

- (void)hideTipsWithDelay:(NSTimeInterval)delay{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    });
}

@end
