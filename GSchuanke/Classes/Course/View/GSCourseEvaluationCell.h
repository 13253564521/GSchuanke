//
//  GSCourseEvaluationCell.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/24.
//  Copyright © 2016年 刘高升. All rights reserved.
//评论cell

#import <UIKit/UIKit.h>
#import "GSDataListModel.h"
@interface GSCourseEvaluationCell : UITableViewCell

/**
 重写set方法
 */
@property(nonatomic,strong) GSDataListModel *model;

+(instancetype)GSCourseEvaluationCellWithTableView:(UITableView *)tableView cellForindexPath:(NSIndexPath *)indexPath dataListArray:(NSMutableArray *)datalistArray;

@end
