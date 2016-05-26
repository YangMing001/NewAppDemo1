//
//  Logs.h
//  NewAppDemo1
//
//  Created by YM on 16/5/26.
//  Copyright © 2016年 YM. All rights reserved.
//

/**
 *  日志打印
 */
#ifndef Logs_h
#define Logs_h

#define IsPrinted 1

#if  IsPrinted

#define logError(fmt, ...)   BUGLY_LOG_MACRO(BuglyLogLevelError, fmt, ##__VA_ARGS__)
#define logWarn(fmt, ...)    BUGLY_LOG_MACRO(BuglyLogLevelWarn,  fmt, ##__VA_ARGS__)
#define logInfo(fmt, ...)    BUGLY_LOG_MACRO(BuglyLogLevelInfo, fmt, ##__VA_ARGS__)
#define logDebug(fmt, ...)   BUGLY_LOG_MACRO(BuglyLogLevelDebug, fmt, ##__VA_ARGS__)
#define logVerbose(fmt, ...) BUGLY_LOG_MACRO(BuglyLogLevelVerbose, fmt, ##__VA_ARGS__)

#define logger(fmt, ...)   logInfo( fmt, ##__VA_ARGS__)

//#else
//
//#define logError(fmt, ...)
//#define logWarn(fmt, ...)   
//#define logInfo(fmt, ...)  
//#define logDebug(fmt, ...)
//#define logVerbose(fmt, ...)
//#define log(fmt, ...)
//
#endif

#endif /* Logs_h */
