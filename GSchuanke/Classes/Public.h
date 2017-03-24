//
//  Public.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/18.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#ifndef Public_h
#define Public_h
#import "GSAnimationRefreshHeader.h"
#import "GSNetWorkTools.h"
//第三方

#import <SVProgressHUD/SVProgressHUD.h>
#import <MJExtension/MJExtension.h>
#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/UIImageView+WebCache.h>
///
#define UID @"4597633"
#define VERSION @"2.4.1.2"

//APP尺寸
#define SCREEN_BOUNDS  [UIScreen mainScreen].bounds
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height


#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)
///导航栏颜色
#define navigationBarColor RGB(67, 199, 176)
#define separaterColor RGB(200, 199, 204)
#define selectColor RGB(46, 158, 138)

#define NavColor   RGB(58,189,161)


//

#endif /* Public_h */
