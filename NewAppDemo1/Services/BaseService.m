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
    self.lastRequestID = nil;
}
- (void)cancelServiceRequest{
    [APIManager cancelRequestWithRequestIDList:self.requsetIDList];
    [self.requsetIDList removeAllObjects];
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
    _lastRequestID = lastRequestID;
    if (lastRequestID) {
        [self.requsetIDList addObject:lastRequestID];
    }
}

@end
