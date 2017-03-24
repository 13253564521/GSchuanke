//
//  GSSchoolHeadView.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/29.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GSSchoolModel.h"
@interface GSSchoolHeadView : UIView

/**
 重写set方法
 */
@property(nonatomic,strong) GSSchoolModel *model;


/**
 父控制器
 */
@property(nonatomic,strong) UIViewController *superVc;

@end
