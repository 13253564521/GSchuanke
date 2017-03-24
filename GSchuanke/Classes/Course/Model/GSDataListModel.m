//
//  GSDataListModel.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/24.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import "GSDataListModel.h"

@implementation GSDataListModel

-(void)setCreateTime:(NSInteger)CreateTime{
    _CreateTime = CreateTime;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:MM"];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:CreateTime];
    //    NSLog(@"时间：%ld",[CreateTime integerValue]);
    NSString  *confromTimespStr = [formatter stringFromDate:confromTimesp];
    _CreateTimeToDate = confromTimespStr;
}

@end
