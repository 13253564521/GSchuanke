//
//  GSCourseClassCell.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/23.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSClassListModel.h"
@interface GSCourseClassCell : UITableViewCell

/**
 重写set方法
 */
@property(nonatomic,strong) GSClassListModel *model;
+(instancetype)GSCourseClassCellWithTableView:(UITableView *)tableView cellForindexPath:(NSIndexPath *)indexPath classModelArray:(NSMutableArray *)classModelArray;
@end
