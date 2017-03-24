//
//  GSCommonlyCell.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/22.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSCourseList.h"
@interface GSCommonlyCell : UITableViewCell

/**
 重写model的set方法
 */
@property(nonatomic,strong) GSCourseList *model;
+(instancetype)GSCommonlyCellWhithTableView:(UITableView *)tabbleView cellForIndexPath:(NSIndexPath *)indexPath courseModelArray:(NSArray *)courseModelArray;
@end
