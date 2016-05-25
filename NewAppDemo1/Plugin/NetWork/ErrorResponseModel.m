//
//  ErrorResponseModel.m
//  NewAppDemo1
//
//  Created by YM on 16/5/25.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "ErrorResponseModel.h"

@implementation ErrorResponseModel


- (NSString *)errText{
    
    NSString *tempString = _errmsg;
    if([self IsChinese:tempString]) {
        return tempString;
    }else if([tempString isEqualToString:@""]) {
        return @"";
    }else{
        return @"网络异常";
    }
}


//判断是否有中文
- (BOOL)IsChinese:(NSString *)str {
    for(int i=0; i< [str length];i++){
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff){
            return YES;
        }
    }
    return NO;
}

@end
