//
//  GSAnimationRefreshHeader.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/18.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import "GSAnimationRefreshHeader.h"

@implementation GSAnimationRefreshHeader
#pragma mark - 重写初始化方法

-(void)prepare{
    [super prepare];
    //设置普通状态的动画
    NSMutableArray *nomal = [NSMutableArray array];
    for (NSInteger i; i <= 60 ; i++) {
        UIImage *image = [UIImage imageNamed:@"icon_listheader_animation_1"];
        [nomal addObject:image];
    }
    [self setImages:nomal forState:MJRefreshStateIdle];
    //设置即将刷新状态的动画
    NSMutableArray *statePullingArr = [NSMutableArray array];
    for (NSInteger i; i <= 60; i++) {
        UIImage *image1 = [UIImage imageNamed:@"icon_listheader_animation_1"];
        UIImage *image2 = [UIImage imageNamed:@"icon_listheader_animation_2"];
        [statePullingArr addObject:image1];
        [statePullingArr addObject:image2];
        
    }
    [self setImages:statePullingArr forState:MJRefreshStatePulling];
    //设置正在刷新的状态的动画
    [self setImages:statePullingArr forState:MJRefreshStateRefreshing];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
