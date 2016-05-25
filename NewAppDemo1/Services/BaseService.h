//
//  BaseService.h
//  NewAppDemo1
//
//  Created by YM on 16/5/25.
//  Copyright © 2016年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIManager.h"

@interface BaseService : NSObject

/** 请求列表 */
@property (nonatomic,strong) NSMutableArray *requsetIDList;

/**最后一次请求ID*/
@property (nonatomic,strong) NSNumber *lastRequestID;



#pragma mark - 取消请求
- (void)cancelLastRequest;
- (void)cancelServiceRequest;
- (void)cancelAllRequest;

@end
