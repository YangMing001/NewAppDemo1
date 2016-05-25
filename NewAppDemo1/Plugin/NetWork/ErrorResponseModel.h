//
//  ErrorResponseModel.h
//  NewAppDemo1
//
//  Created by YM on 16/5/25.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "BaseModel.h"

@interface ErrorResponseModel : BaseModel


//网络错误码
@property (nonatomic,assign) NSInteger errcode;
//网络错误描述
@property (nonatomic,copy) NSString *errmsg;

@property (nonatomic,copy) NSString *errText;



@end
