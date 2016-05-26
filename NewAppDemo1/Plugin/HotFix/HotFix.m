//
//  HotFix.m
//  NewAppDemo1
//
//  Created by YM on 16/5/26.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "HotFix.h"
#import <JSPatch/JSPatch.h>

@implementation HotFix

+ (void)setupHotFix{
    //JSPatch热修补技术
    
#if IsPAT
    [JSPatch startWithAppKey:JSPatchKey];
    
    NSDate *lastJSPathDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"JSPathDate"];
    BOOL needSync = YES;    //需要进行请求
    if (lastJSPathDate) {
        //一个小时频率检测
        needSync = [[NSDate date] timeIntervalSinceDate:lastJSPathDate] > 60*60;
    }
    
    if (needSync) {
        [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"JSPathDate"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [JSPatch sync];
    }
#else
    [JSPatch testScriptInBundle];
#endif
}

@end
