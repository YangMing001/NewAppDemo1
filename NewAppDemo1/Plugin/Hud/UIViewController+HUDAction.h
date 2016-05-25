//
//  UIViewController+HUDAction.h
//  NewAppDemo1
//
//  Created by YM on 16/5/24.
//  Copyright © 2016年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  提示框
 */
@interface UIViewController (HUDAction)

/**
 *  显示刷新指示层
 */
- (void)showRefreshHUD;

/**
 *  显示刷新指示层,自动消失
 *
 *  @param delay    延迟消失的秒数
 */
- (void)showRefreshHUD:(NSTimeInterval )delay;

/**
 *  显示文字提示
 *
 *  @param msg 需要显示的文字
 */
- (void)showTips:(NSString *)msg;

/**
 *  显示文字提示，自动消失
 *
 *  @param msg   显示文字
 *  @param delay    延迟消失的秒数
 */
- (void)showFastTips:(NSString *)msg delay:(NSTimeInterval )delay;

/**
 *  显示文字显示，自动消失，默认秒数
 *
 *  @param msg 显示文字
 */
- (void)showFastTips:(NSString *)msg;

/**
 *  隐藏HUD
 */
- (void)hideTips;

@end
