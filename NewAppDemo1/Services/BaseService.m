//
//  BaseService.m
//  NewAppDemo1
//
//  Created by YM on 16/5/25.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "BaseService.h"

@implementation BaseService



#pragma mark - Public Method
- (void)cancelLastRequest{
    [APIManager cancelRequestWithRequestID:self.lastRequestID];
}
- (void)cancelServiceRequest{
    [APIManager cancelRequestWithRequestIDList:self.requsetIDList];
}
- (void)cancelAllRequest{
    [APIManager cancelAllRequest];
}

#pragma mark - setter and getter
- (NSMutableArray *)requsetIDList{
    if (_requsetIDList == nil) {
        _requsetIDList = [NSMutableArray array];
    }
    return _requsetIDList;
}

- (void)setLastRequestID:(NSNumber *)lastRequestID{
    [self.requsetIDList addObject:lastRequestID];
    _lastRequestID = lastRequestID;
}

@end
