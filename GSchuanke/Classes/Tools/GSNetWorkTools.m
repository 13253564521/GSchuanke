//
//  GSNetWorkTools.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/18.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import "GSNetWorkTools.h"
#define TIMEOUT 30
@implementation GSNetWorkTools
+(instancetype)shareManger{
    static GSNetWorkTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
        instance.requestSerializer.timeoutInterval = TIMEOUT;
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/html", @"application/json", nil];
    
    });

    return instance;
}
//-(instancetype)initWithBaseURL:(NSURL *)url{
//    self = [super initWithBaseURL:url];
//    if (self) {
//        // 设置请求以及相应的序列化器
//        self.requestSerializer = [AFHTTPRequestSerializer serializer];
//        // 设置相应的缓存策略--URL应该加载源端数据，不使用本地缓存数据,忽略缓存直接从原始地址下载。
//        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
//        // 设置超时时间
//        self.requestSerializer.timeoutInterval = TIMEOUT;
//        // 设置请求内容的类型-- 复杂的参数类型 需要使用json传值-设置请求内容的类型
////        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"]; // 设置请求内容的类型
//        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/html", @"application/json", nil];
//
//        //注意：默认的Response为json数据
//        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
//        // 在服务器返回json数据的时候，时常会出现null数据。json解析的时候，可能会将这个null解析成NSNull的对象，我们向这个NSNull对象发送消息的时候就会遇到crash的问题。
//        responseSerializer.removesKeysWithNullValues = YES;
//        self.responseSerializer = responseSerializer;
//    }
//
//    return self;
//}
#pragma mark - 推荐课程

#pragma mark - 获取推荐课程内容
+(void)getCourseWithUrl:(NSString *)url parameters:(id)parameters isHud:(BOOL)isHud succeses:(SuccessBlock)success fail:(FailBlock)fail{
    //两种编码格式
//    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //是否显示请稍后
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (isHud) {
            [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
            [SVProgressHUD showWithStatus:@"请稍后。。。"];
        }
    });

    [[GSNetWorkTools shareManger]GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        if (success) {
           success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        if (fail) {
            NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
           fail(errorStr);
        }
        
    }];


}


+(void)checkNetworkStatus{
    
    //1.创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    /*枚举里面四个状态  分别对应 未知 无网络 数据 WiFi
     typedef NS_ENUM(NSInteger, AFNetworkReachabilityStatus) {
     AFNetworkReachabilityStatusUnknown          = -1,      未知
     AFNetworkReachabilityStatusNotReachable     = 0,       无网络
     AFNetworkReachabilityStatusReachableViaWWAN = 1,       蜂窝数据网络
     AFNetworkReachabilityStatusReachableViaWiFi = 2,       WiFi
     };
     */
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        //在里面可以随便写事件
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                [SVProgressHUD showInfoWithStatus:@"未知网络状态"];
                NSLog(@"未知网络状态");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                [SVProgressHUD showInfoWithStatus:@"无网络"];
                NSLog(@"无网络");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                [SVProgressHUD showInfoWithStatus:@"蜂窝数据网"];
                NSLog(@"蜂窝数据网");
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [SVProgressHUD showInfoWithStatus:@"WiFi网络"];
                NSLog(@"WiFi网络");
                
                break;
                
            default:
                break;
        }
        
    }] ;
    
}
@end
