//
//  TJViewControllerIntercept.m
//  NewAppDemo1
//
//  Created by YM on 16/5/23.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "TJViewControllerIntercept.h"
#import <Aspects/Aspects.h>
#import "AnalysisUtil.h"
#import <UIKit/UIKit.h>

@implementation TJViewControllerIntercept

+ (void)load
{
    /* + (void)load 会在应用启动的时候自动被runtime调用，通过重载这个方法来实现最小的对业务方的“代码入侵” */
    [super load];
    [TJViewControllerIntercept sharedInstance];
}

/*
 按道理来说，这个sharedInstance单例方法是可以放在头文件的，但是对于目前这个应用来说，暂时还没有放出去的必要
 
 当业务方对这个单例产生配置需求的时候，就可以把这个函数放出去
 */
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static TJViewControllerIntercept *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TJViewControllerIntercept alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        /* 在这里做好方法拦截 */
        [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated){
            [self viewWillAppear:animated viewController:[aspectInfo instance]];
        } error:NULL];
        
        [UIViewController aspect_hookSelector:@selector(viewDidDisappear:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo>aspectInfo, BOOL animated){
            [self viewDidDisappear:animated viewController:[aspectInfo instance]];
        } error:NULL];
    }
    return self;
}

/*
 你也可以随便找一个什么其他的UIViewController，只要加入工程中，不需要额外添加什么代码，就可以做到自动拦截了。
 
 所以在你原来的架构中，大部分封装UIViewController的基类或者其他的什么基类，都可以使用这种方法让这些基类消失。
 */
#pragma mark - fake methods
- (void)viewWillAppear:(BOOL)animated viewController:(UIViewController *)viewController
{
    [AnalysisUtil trackPageBegin:NSStringFromClass([viewController class])];
}

- (void)viewDidDisappear:(BOOL)animated viewController:(UIViewController *)viewController
{
    [AnalysisUtil trackPageEnd:NSStringFromClass([viewController class])];
}





@end
