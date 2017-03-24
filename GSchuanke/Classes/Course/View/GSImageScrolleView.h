//
//  GSImageScrolleView.h
//  GSchuanke
//
//  Created by 刘高升 on 16/11/21.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol GSImageScrolleViewDelegate<NSObject>
-(void)didSelectImageAtIndex:(NSInteger)index;
@end
@interface GSImageScrolleView : UIView

/**
 底层滚动视图
 */
@property(nonatomic,strong) UIScrollView *scrollView;

/**
 分页
 */
@property(nonatomic,strong) UIPageControl *pagecontrol;

/**
 存放图片的数组
 */
@property(nonatomic,strong) NSArray *imageArray;
/**
 代理
 */
@property (nonatomic,assign) id<GSImageScrolleViewDelegate> delegate;




@end
