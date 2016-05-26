//
//  APIManager.m
//  NewAppDemo1
//
//  Created by YM on 16/5/24.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "APIManager.h"
#import <AFNetworking.h>
#import <RealReachability.h>
@interface APIManager ()

/**分发表，记录请求*/
@property (nonatomic, strong) NSMutableDictionary *dispatchTable;
@property (nonatomic, strong) NSNumber *recordedRequestId;
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation APIManager

#pragma mark - life cycle
+ (instancetype)manager
{
    static dispatch_once_t onceToken;
    static APIManager *apiManager ;
    dispatch_once(&onceToken, ^{
        apiManager = [[APIManager alloc] init];
    });
    return apiManager;
}

#pragma mark - public methods

#pragma mark - GET
+ (NSNumber *)Get:(NSString *)url
          success:(void(^)(id result))success
             fail:(void (^)(id result,NSError *error))fail
{
    return [APIManager Get:url params:nil success:success fail:fail];
}

+ (NSNumber *)Get:(NSString *)url
           params:(NSDictionary *)params
          success:(void(^)(id result))success
             fail:(void (^)(id result,NSError *error))fail
{
    return [APIManager Get:url params:params headers:nil success:success fail:fail];
}

+ (NSNumber *)Get:(NSString *)url
           params:(NSDictionary *)params
          headers:(NSDictionary *)headers
          success:(void (^)(id))success
             fail:(void (^)(id result,NSError *error))fail
{
    return [[APIManager manager] requsetWithMethodName:@"Get"
                                                   url:url
                                                params:params
                                               headers:headers
                                               success:success
                                                  fail:fail];
}

#pragma mark - Post
+ (NSNumber *)Post:(NSString *)url
           success:(void(^)(id result))success
              fail:(void (^)(id result,NSError *error))fail
{
    return [APIManager Post:url params:nil success:success fail:fail];
}

+ (NSNumber *)Post:(NSString *)url
            params:(NSDictionary *)params
           success:(void(^)(id result))success
              fail:(void (^)(id result,NSError *error))fail
{
    return [APIManager Post:url params:params headers:nil success:success fail:fail];
}

+ (NSNumber *)Post:(NSString *)url
            params:(NSDictionary *)params
           headers:(NSDictionary *)headers
           success:(void (^)(id))success
              fail:(void (^)(id result,NSError *error))fail
{
    return [[APIManager manager] requsetWithMethodName:@"Post"
                                                   url:url
                                                params:params
                                               headers:headers
                                               success:success
                                                  fail:fail];
}

#pragma mark - Put
+ (NSNumber *)Put:(NSString *)url
          success:(void(^)(id result))success
             fail:(void (^)(id result,NSError *error))fail
{
    return [APIManager Put:url params:nil success:success fail:fail];
}

+ (NSNumber *)Put:(NSString *)url
           params:(NSDictionary *)params
          success:(void(^)(id result))success
             fail:(void (^)(id result,NSError *error))fail
{
    return [APIManager Put:url params:params headers:nil success:success fail:fail];
}

+ (NSNumber *)Put:(NSString *)url
           params:(NSDictionary *)params
          headers:(NSDictionary *)headers
          success:(void (^)(id))success
             fail:(void (^)(id result,NSError *error))fail
{
    return [[APIManager manager] requsetWithMethodName:@"Put"
                                                   url:url
                                                params:params
                                               headers:headers
                                               success:success
                                                  fail:fail];
}

#pragma mark - Delete

+ (NSNumber *)Delete:(NSString *)url
             success:(void (^)(id))success
                fail:(void (^)(id,NSError *))fail
{
    return [APIManager Delete:url params:nil success:success fail:fail];
}

+ (NSNumber *)Delete:(NSString *)url
              params:(NSDictionary *)params
             success:(void (^)(id))success
                fail:(void (^)(id,NSError *))fail
{
    return [APIManager Delete:url params:params headers:nil success:success fail:fail];
}

+ (NSNumber *)Delete:(NSString *)url
              params:(NSDictionary *)params
             headers:(NSDictionary *)headers
             success:(void (^)(id))success
                fail:(void (^)(id,NSError *))fail
{
    return [[APIManager manager] requsetWithMethodName:@"Delete"
                                                   url:url
                                                params:params
                                               headers:headers
                                               success:success
                                                  fail:fail];
}

#pragma mark - 上传文件
+ (NSNumber *)Upload:(NSString *)URLString
          parameters:(id)parameters
constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
            progress:(void (^)(NSProgress * ))uploadProgress
             success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
             failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    APIManager *manager = [APIManager manager];
    NSNumber *requestId = [manager generateRequestId];
    
    NSURLSessionDataTask *task = [[APIManager manager].sessionManager
                                  POST:URLString
                                  parameters:parameters
                                  constructingBodyWithBlock:block
                                  progress:uploadProgress
                                  success:success
                                  failure:failure];
    
    return  [manager sendTask:task requestID:requestId];
}

#pragma mark - 取消请求
+ (void)cancelRequestWithRequestID:(NSNumber *)requestID
{
    if (!requestID) {
        return;
    }
   
    APIManager *manager = [APIManager manager];
    NSString *requsetkey = [requestID stringValue];
    NSURLSessionDataTask *task = manager.dispatchTable[requsetkey];
    if (task) {
        logger(@"task cancel %@",task);
        [task cancel];
        [manager.dispatchTable removeObjectForKey:requsetkey];
    }
}

+ (void)cancelRequestWithRequestIDList:(NSArray *)requestIDList
{
    for (NSNumber *requestId in requestIDList) {
        [APIManager cancelRequestWithRequestID:requestId];
    }
}

+ (void)cancelAllRequest{
    APIManager *manager = [APIManager manager];
    NSArray *requestIDArray = [[manager.dispatchTable allKeys] copy];
    for (NSString *requestID in requestIDArray) {
        NSNumber *number = [NSNumber numberWithInteger:[requestID integerValue]];
        [APIManager cancelRequestWithRequestID:number];
    }
}

#pragma mark - private methods

- (NSNumber *)requsetWithMethodName:(NSString *)mothedName
                                url:(NSString *)url
                             params:(NSDictionary *)params
                            headers:(NSDictionary *)headers
                            success:(void (^)(id))success
                               fail:(void (^)(id result,NSError *error))fail
{
    NSURLRequest *request   = [self generateRequestWithMethodName:mothedName
                                                              url:url
                                                           params:params
                                                          headers:headers];
    return  [self callApiWithRequest:request
                             success:success
                                fail:fail];
}

/**
 *  根据参数生成Request对象
 *
 *  @param params     参数
 *  @param methodName 请求方式
 *
 *  @return 生成的request对象
 */
- (NSURLRequest *)generateRequestWithMethodName:(NSString *)methodName
                                            url:(NSString *)url
                                         params:(NSDictionary *)params
                                        headers:(NSDictionary *)headers
{
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    
    for (NSString *key in [headers allKeys]) {
        [serializer setValue:headers[key] forHTTPHeaderField:key];
    }
    
    //这一步可以配置不同参数要求的request对象。统一的参数请求等。
    NSURLRequest *request = [serializer requestWithMethod:methodName
                                                URLString:url
                                               parameters:params
                                                    error:nil];
    
    return request;
}

/**
 *  发送请求，统一入口
 *
 *  @param request 执行的request对象
 *
 *  @return request 对应的 requestID
 */

- (NSNumber *)callApiWithRequest:(NSURLRequest *)request
                         success:(void (^)(id result))success
                            fail:(void (^)(id result,NSError *error))fail
{
    /**
     *  1 生成 requestId
     *  2 创建发送request 任务 task
     *  3 task 与 requestId 建立连接
     *  4 执行 task ,返回 requestId
     */
    NSNumber *requestId = [self generateRequestId];
    NSURLSessionDataTask *task = [self.sessionManager dataTaskWithRequest:request
                                                        completionHandler:
                                  ^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                      NSURLSessionDataTask *storedTask = self.dispatchTable[[requestId stringValue]];
                                      if (storedTask == nil) {
                                          // 如果这个operation是被cancel的，那就不用处理回调了。
                                          return;
                                      }else{
                                          [self.dispatchTable removeObjectForKey:requestId];
                                      }
                                      
                                      NSString *responseString = [[NSString alloc]
                                                                  initWithData:responseObject
                                                                  encoding:NSUTF8StringEncoding];
                                      logInfo(@"---------responseString start---------------");
                                      logInfo(@"--------------------------------------------");
                                      logInfo(@"-responseString----%@",responseString);
                                      logInfo(@"--------------------------------------------");
                                      logInfo(@"--------responseString end------------------");
                                      if (!error) {
                                          success?success(responseString):nil;
                                      }else{
                                          fail?fail(responseString,error):nil;
                                      }
                                  }];
    logInfo(@"--------------------------");
    logInfo(@"--------------------------");
    logInfo(@"-RequestID----%@-",requestId);
    logInfo(@"-request------%@-",request);
    logInfo(@"--------------------------");
    logInfo(@"--------------------------");
    return [self sendTask:task requestID:requestId];
}


/**
 *  发送请求，没有网络就不发送
 *
 */
- (NSNumber *)sendTask:(NSURLSessionTask *)task requestID:(NSNumber *)requestID{
    
    ReachabilityStatus status = [GLobalRealReachability currentReachabilityStatus];
    //没有网络不请求
    if (status == RealStatusNotReachable) {
        return  @(-1);
    }
    
    [self.dispatchTable setValue:task forKey:[requestID stringValue]];
    [task resume];
    return requestID;
}



#pragma mark - getters and setters
- (NSMutableDictionary *)dispatchTable
{
    if (_dispatchTable == nil) {
        _dispatchTable = [[NSMutableDictionary alloc] init];
    }
    return _dispatchTable;
}

- (AFHTTPSessionManager *)sessionManager
{
    if (_sessionManager == nil) {
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:nil];
        _sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return _sessionManager;
}

/**
 *  生成RequestId
 *  RequestId规则为顺序递增，循环创建。
 */
- (NSNumber *)generateRequestId
{
    if (_recordedRequestId == nil) {
        _recordedRequestId = @(1);
    } else {
        if ([_recordedRequestId integerValue] == NSIntegerMax) {
            _recordedRequestId = @(1);
        } else {
            _recordedRequestId = @([_recordedRequestId integerValue] + 1);
        }
    }
    return _recordedRequestId;
}
@end