//
//  ThirdPartKeys.h
//  NewAppDemo1
//
//  Created by YM on 16/5/24.
//  Copyright © 2016年 YM. All rights reserved.
//

#ifndef ThirdPartKeys_h
#define ThirdPartKeys_h
#import <UIKit/UIKit.h>


#if IsPAT
//  生产环境
/** 使用高德地图API，请注册Key，注册地址：http://lbs.amap.com/console/key */
static NSString * const  AMapAPIKey     = @"6ae2b80c0c20514d81bbd37cff8f3be1";

/** TalkingData key*/
static NSString * const  TalkingdataKey = @"9DF209173CD73B94BFBF31F9A76550CE";
/** 友盟分享 key*/
static NSString * const  UMSocialKey    = @"5618875867e58e21c8000797";

/** 微信分享 key*/
static NSString * const  WXAppKey       = @"wxdea173aeff9d0cfa";
static NSString * const  WXAppSecret    = @"cf1ebb822747231f4f8dd8e9bb7df3c8";

/** JSPatch 热修补 key*/
static NSString * const  JSPatchKey     = @"983ce23410b62537";

/** Bugly key */
static NSString * const BuglyKey        = @"";
#else

// 测试环境
/** 使用高德地图API，请注册Key，注册地址：http://lbs.amap.com/console/key */
static NSString * const  AMapAPIKey     = @"6ae2b80c0c20514d81bbd37cff8f3be1";

/** TalkingData key*/
static NSString * const  TalkingdataKey = @"9DF209173CD73B94BFBF31F9A76550CE";
/** 友盟分享 key*/
static NSString * const  UMSocialKey    = @"5618875867e58e21c8000797";

/** 微信分享 key*/
static NSString * const  WXAppKey       = @"wxdea173aeff9d0cfa";
static NSString * const  WXAppSecret    = @"cf1ebb822747231f4f8dd8e9bb7df3c8";

/** JSPatch 热修补 key*/
static NSString * const  JSPatchKey     = @"983ce23410b62537";

/** Bugly key */
static NSString * const BuglyKey        = @"";

#endif
#endif /* ThirdPartKeys_h */
