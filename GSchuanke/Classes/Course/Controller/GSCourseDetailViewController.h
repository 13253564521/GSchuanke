//
//  GSCourseDetailViewController.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/22.
//  Copyright © 2016年 刘高升. All rights reserved.
//课程详细介绍控制器

#import <UIKit/UIKit.h>

@interface GSCourseDetailViewController : UIViewController

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
