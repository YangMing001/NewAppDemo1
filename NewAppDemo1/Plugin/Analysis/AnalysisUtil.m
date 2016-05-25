//
//  AnalysisUtil.m
//  NewAppDemo1
//
//  Created by YM on 16/5/24.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "AnalysisUtil.h"
#import <TalkingData.h>


@implementation AnalysisUtil

+ (void)setup{
    [AnalysisUtil sessionStarted:TalkingdataKey withChannelId:@"APPStore"];
}

+ (void)sessionStarted:(NSString *)appKey withChannelId:(NSString *)channelId{
    [TalkingData sessionStarted:appKey withChannelId:channelId];
}

+ (void)trackEvent:(NSString *)eventId{
    [TalkingData trackEvent:eventId];
}

+ (void)trackEvent:(NSString *)eventId label:(NSString *)eventLabel{
    [TalkingData trackEvent:eventId label:eventLabel];
}

+ (void)trackEvent:(NSString *)eventId
             label:(NSString *)eventLabel
        parameters:(NSDictionary *)parameters{
    [TalkingData trackEvent:eventId label:eventLabel parameters:parameters];
}

+ (void)trackPageBegin:(NSString *)pageName{
    [TalkingData trackPageBegin:pageName];
}

+ (void)trackPageEnd:(NSString *)pageName{
    [TalkingData trackPageEnd:pageName];
}


@end
