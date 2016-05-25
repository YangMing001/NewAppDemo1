//
//  ViewController.m
//  NewAppDemo1
//
//  Created by YM on 16/5/23.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa.h>


#import "APIManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        [subscriber sendNext:@1];
//        [subscriber sendCompleted];
//        return [RACDisposable disposableWithBlock:^{
//            NSLog(@"信号被销毁");
//        }];
//    }];
//    
//    [signal subscribeNext:^(id x) {
//        NSLog(@"x %@",x);
//    }];
//    
//
//    [self showFastTips:@"xxxx" delay:12];
//    [self showRefreshHUD];
    
    NSString *urlString = @"https://coach-api.1yd.me/api/meta-data";
    
    NSMutableArray *tempArray = [NSMutableArray array];
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_apply(100, queue, ^(size_t s) {
        NSNumber *requestID = [APIManager Get:urlString params:nil headers:nil success:^(id result) {
            NSLog(@"result %@",result);
        } fail:^(id result, NSError *error) {
            NSLog(@"result %@",result);
        }];
        [tempArray addObject:requestID];
    });
    
//    [[APIManager manager] cancelAllRequest];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[APIManager manager] cancelRequestWithRequestIDList:tempArray];

    });
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
