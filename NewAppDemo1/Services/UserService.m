//
//  UserService.m
//  NewAppDemo1
//
//  Created by YM on 16/5/25.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "UserService.h"

@implementation UserService

#pragma mark - Lift Cycle
+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    static UserService *service;
    dispatch_once(&onceToken, ^{
        service = [[UserService alloc] init];
    });
    return service;
}

#pragma mark - Publich Methods
- (void)loginWithParams:(NSDictionary *)params
               complite:(void (^)(BOOL))complite
{
    NSAssert(params[@"userName"], @"缺少 userName 参数");
    NSAssert(params[@"userPW"], @"缺少 userPW 参数");

    NSString *urlString = [NSString stringWithFormat:@""];
    
    
    self.lastRequestID = [APIManager Get:urlString
                                 success:^(id result) {
            
                                 } fail:^(id result, NSError *error) {
            
                                 }];
    
}

#pragma mark - Private Methods
/**
 *  保存用户信息
 *
 *  @param dic 请求用户信息字典
 */
- (void)saveUserInfo:(NSDictionary *)dic{
    
}


#pragma mark - Getters and Setters

@end
