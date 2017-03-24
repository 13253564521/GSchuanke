//
//  GSCourseEvaluationViewController.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/24.
//  Copyright © 2016年 刘高升. All rights reserved.
//评论控制器

#import <UIKit/UIKit.h>

@interface GSCourseEvaluationViewController : UIViewController

/**
 内容tableView
 */
@property(nonatomic,strong) UITableView *contentTableView;
/**
 接收传参
 */
@property (nonatomic , assign) NSInteger SID;

/**
 课程 接收传参
 */
@property (nonatomic,assign) NSInteger courseId;
@end
