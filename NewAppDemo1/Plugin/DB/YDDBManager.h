//
//  YDDBManager.h
//  NewAppDemo1
//
//  Created by YM on 16/5/23.
//  Copyright © 2016年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>

/**数据库管理*/
@interface YDDBManager : NSObject

/**
 *  单例Manager管理
 *
 *  @return DBManager实例对象
 */
//+ (instancetype)shareManager;

/**
 *  增加新记录
 *
 *  @param obj 需要增加的记录数据
 */
//- (void)insertModel:(NSObject *)obj;

/**
 *  更新记录
 *
 *  @param obj 需要更新的记录数据
 *  @param key 更新的关键字比较
 */
//- (void)updateModel:(NSObject *)obj key:(NSString *)key;

/**
 */
//- (void)deleteModel:(NSObject *)obj key:(NSString *)key;


//- (NSArray<NSObject *> *)selectModelSql:(NSString *)sql;


@end
