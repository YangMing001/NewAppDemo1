//
//  AppDelegate.m
//  NewAppDemo1
//
//  Created by YM on 16/5/23.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "AppDelegate.h"


#import "MainVC.h"
#import "YYFPSLabel.h"

#import "AnalysisUtil.h"
#import "TJViewControllerIntercept.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupLaunch:application options:launchOptions];
    [self setupUI];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Finish 方法汇总
- (void)setupLaunch:(UIApplication *)application
    options:(NSDictionary *)launchOptions
{
    //开启拦截器
    [TJViewControllerIntercept startIntercept];

    //数据统计初始化
    [AnalysisUtil setup];

}

#pragma mark - 初始化UI
- (void)setupUI{
    //step 1    设置rootVC
    self.window.rootViewController = [self setupRootVC];
    //step 2    设置其他View
    [self setupOtherView];
    //step 3    key and Visible
    [self.window makeKeyAndVisible];
}

/** 设置根VC */
- (UIViewController *)setupRootVC{
    MainVC *vc = [MainVC new];
    return vc;
}

/**  设置其他View   */
- (void)setupOtherView{
    [self addFPSLabel];
}

- (void)addFPSLabel{
    YYFPSLabel *fps = [[YYFPSLabel alloc] initWithFrame:CGRectMake(5, 90, 130, 30)];
    [self.window addSubview:fps];
    
}

#pragma mark - getter and setter

- (UIWindow *)window{
    if (_window == nil) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.backgroundColor = [UIColor redColor];
    }
    return _window;
}


@end
