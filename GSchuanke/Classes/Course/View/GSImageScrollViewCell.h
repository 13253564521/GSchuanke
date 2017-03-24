//
//  GSImageScrollViewCell.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/21.
//  Copyright © 2016年 刘高升. All rights reserved.
//第一行cell 图片轮播图

#import <UIKit/UIKit.h>
#import "GSImageScrolleView.h"
@interface GSImageScrollViewCell : UITableViewCell

/**
 轮播图GSImageScrolleView
 */
@property(nonatomic,strong) GSImageScrolleView *imageScrollView;

/**
 轮播图片的url数组
 */
@property(nonatomic,strong) NSArray *imageArray;

+(instancetype)GSImageScrollViewCellWithTableView:(UITableView *)tableView cellForIndexPath:(NSIndexPath *)indexPath imageArr:(NSArray *)imageArray;
@end
