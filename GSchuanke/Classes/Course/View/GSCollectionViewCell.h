//
//  GSCollectionViewCell.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/22.
//  Copyright © 2016年 刘高升. All rights reserved.
//中间课程展示的collectionViewcell

#import <UIKit/UIKit.h>
@protocol GSCollectionViewCellDelegate<NSObject>
-(void)selectcollectionImageAtIndex:(int)index;
@end
@interface GSCollectionViewCell : UITableViewCell
/**
 GSCollectionViewCell代理
 */
@property (nonatomic,assign) id<GSCollectionViewCellDelegate> delegate;
/**
 图片的数组
 */
@property(nonatomic,strong) NSArray *imageArray;

+(instancetype)GSCollectionViewCellWithTableView:(UITableView *)tableView cellForIndexPath:(NSIndexPath *)indexPath imagearrayModel:(NSArray *)arrayModel;

@end
