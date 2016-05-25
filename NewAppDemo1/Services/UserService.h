//
//  UserService.h
//  NewAppDemo1
//
//  Created by YM on 16/5/25.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "BaseService.h"

@interface UserService : BaseService

@property (nonatomic,copy) NSString *token;

+ (instancetype)shareInstance;

- (void)loginWithParams:(NSDictionary *)params
               complite:(void(^)(BOOL isSuccess))complite;

@end
