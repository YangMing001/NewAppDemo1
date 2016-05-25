//
//  APIManager.h
//  NewAppDemo1
//
//  Created by YM on 16/5/24.
//  Copyright © 2016年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
@interface APIManager : NSObject


#pragma mark - 正常文本请求

/**
 *  GET请求
 *
 *  @param url     请求接口地址
 *  @param params  参数
 *  @param headers httpHeader
 *  @param success 成功的回调
 *  @param fail    失败的回调
 *
 *  @return 请求的标识
 */
+ (NSNumber *)Get:(NSString *)url
           params:(NSDictionary *)params
          headers:(NSDictionary *)headers
          success:(void(^)(id result))success
             fail:(void (^)(id result,NSError *error))fail;

/**
 *  Post请求
 *
 *  @param url     请求接口地址
 *  @param params  参数
 *  @param headers httpHeader
 *  @param success 成功的回调
 *  @param fail    失败的回调
 *
 *  @return 请求的标识
 */
+ (NSNumber *)Post:(NSString *)url
            params:(NSDictionary *)params
           headers:(NSDictionary *)headers
           success:(void(^)(id result))success
              fail:(void (^)(id result,NSError *error))fail;

/**
 *  Put请求
 *
 *  @param url     请求接口地址
 *  @param params  参数
 *  @param headers httpHeader
 *  @param success 成功的回调
 *  @param fail    失败的回调
 *
 *  @return 请求的标识
 */
+ (NSNumber *)Put:(NSString *)url
           params:(NSDictionary *)params
          headers:(NSDictionary *)headers
          success:(void(^)(id result))success
             fail:(void (^)(id result,NSError *error))fail;

/**
 *  Delete请求
 *
 *  @param url     请求接口地址
 *  @param params  参数
 *  @param headers httpHeader
 *  @param success 成功的回调
 *  @param fail    失败的回调
 *
 *  @return 请求的标识
 */
+ (NSNumber *)Delete:(NSString *)url
              params:(NSDictionary *)params
             headers:(NSDictionary *)headers
             success:(void(^)(id result))success
                fail:(void (^)(id result,NSError *error))fail;

#pragma mark - 上传文件

/**
 *  上传文件请求
 *
 *  @param URLString      请求接口地址
 *  @param parameters     参数
 *  @param block          上传数据的封装回调
 *  @param uploadProgress 进度
 *  @param success        成功的回调
 *  @param failure        失败的回调
 *
 *  @return request的标识
 */
+ (NSNumber *)Upload:(NSString *)URLString
          parameters:(id)parameters
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
            progress:( void (^)(NSProgress * ))uploadProgress
             success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
             failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;


+ (instancetype)manager;

#pragma mark  - 取消Request
/**
 *  通过标识取消Request
 *
 *  @param requestID request 标识
 */
+ (void)cancelRequestWithRequestID:(NSNumber *)requestID;

/**
 *  取消 Request list
 *
 *  @param requestIDList request 标识数组
 */
+ (void)cancelRequestWithRequestIDList:(NSArray *)requestIDList;

+ (void)cancelAllRequest;


@end
