//
//  AnalysisUtil.h
//  NewAppDemo1
//
//  Created by YM on 16/5/24.
//  Copyright © 2016年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  分析统计工具
 *  底层暂时使用TalkingData
 */
@interface AnalysisUtil : NSObject


/**
 *  数据统计的初始化调用方法。
 *  主要实现key的注册
 */
+ (void)setup;

/**
 *	@method	sessionStarted:withChannelId:
 *  初始化统计实例，请在application:didFinishLaunchingWithOptions:方法里调用
 *	@param 	appKey 	应用的唯一标识，统计后台注册得到
 @param 	channelId(可选) 	渠道名，如“app store”
 */
+ (void)sessionStarted:(NSString *)appKey withChannelId:(NSString *)channelId;


/**
 *	@method	trackEvent
 *  统计自定义事件（可选），如购买动作
 *	@param 	eventId 	事件名称（自定义）
 */
+ (void)trackEvent:(NSString *)eventId;

/**
 *	@method	trackEvent:label:
	统计带标签的自定义事件（可选），可用标签来区别同一个事件的不同应用场景
 如购买某一特定的商品
 *
 *	@param 	eventId 	事件名称（自定义）
 *	@param 	eventLabel 	事件标签（自定义）
 */
+ (void)trackEvent:(NSString *)eventId label:(NSString *)eventLabel;

/**
 *	@method	trackEvent:label:parameters
 统计带二级参数的自定义事件，单次调用的参数数量不能超过10个
 *
 *	@param 	eventId 	事件名称（自定义）
 *	@param 	eventLabel 	事件标签（自定义）
 *	@param 	parameters 	事件参数 (key只支持NSString, value支持NSString和NSNumber)
 */
+ (void)trackEvent:(NSString *)eventId
             label:(NSString *)eventLabel
        parameters:(NSDictionary *)parameters;


/**
 *	@method	trackPageBegin
 *  开始跟踪某一页面（可选），记录页面打开时间
 建议在viewWillAppear或者viewDidAppear方法里调用
 *	@param 	pageName 	页面名称（自定义）
 */
+ (void)trackPageBegin:(NSString *)pageName;

/**
 *	@method	trackPageEnd
 *  结束某一页面的跟踪（可选），记录页面的关闭时间
 此方法与trackPageBegin方法结对使用，
 建议在viewWillDisappear或者viewDidDisappear方法里调用
 *	@param 	pageName 	页面名称，请跟trackPageBegin方法的页面名称保持一致
 */
+ (void)trackPageEnd:(NSString *)pageName;

@end
