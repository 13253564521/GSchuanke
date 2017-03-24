//
//  NSString+GSSize.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/24.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (GSSize)
- (CGSize)boundingRectWithSize:(CGSize)size withFont:(NSInteger)font;
@end
