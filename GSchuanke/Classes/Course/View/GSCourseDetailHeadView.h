//
//  GSCourseDetailHeadView.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/23.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSDetailHeadModel.h"
@interface GSCourseDetailHeadView : UIView

/**
 重写set方法
 */
@property(nonatomic,strong) GSDetailHeadModel *model;

/**
 父控制器
 */
@property(nonatomic,strong) UIViewController *superVc;

@end
