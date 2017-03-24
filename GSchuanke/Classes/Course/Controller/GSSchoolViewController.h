//
//  GSSchoolViewController.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/28.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GSSchoolViewController : UIViewController
/**
 sid
 */
@property (nonatomic,assign) NSInteger SID;
/**
 学校名称
 */
@property (nonatomic , copy) NSString *schoolName;

/**
 内容视图
 
 */
@property(nonatomic,strong) UITableView  *contentTableView;
@end
