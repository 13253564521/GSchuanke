//
//  GSNetWorkTools.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/18.
//  Copyright © 2016年 刘高升. All rights reserved.
//网络工具封装类

#import <AFNetworking/AFNetworking.h>
typedef void(^SuccessBlock) (id responseBody);
typedef void(^FailBlock)(NSString *error);
@interface GSNetWorkTools : AFHTTPSessionManager
+(instancetype)shareManger;
+(void)checkNetworkStatus;
/**获取推荐课程内容*/
+(void)getCourseWithUrl:(NSString *)url parameters:(id)parameters isHud:(BOOL)isHud succeses:(SuccessBlock)success fail:(FailBlock)fail;
@end
