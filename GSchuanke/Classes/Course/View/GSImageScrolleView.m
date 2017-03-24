//
//  GSImageScrolleView.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/21.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import "GSImageScrolleView.h"
@interface GSImageScrolleView()<UIScrollViewDelegate>
{
    NSTimer *_timer;
    int _pageNumber;

}
@end
@implementation GSImageScrolleView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建scrollView
        self.scrollView = [[UIScrollView alloc]initWithFrame:frame];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.imageArray.count, frame.size.height);
        self.scrollView.delegate  = self;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.scrollView];
        //初始化pagecontrol
        self.pagecontrol = [[UIPageControl alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 40, frame.size.height - 30, 80, 30)];
        self.pagecontrol.numberOfPages = self.imageArray.count;
        self.pagecontrol.currentPage = 0;
        [self addSubview:self.pagecontrol];
        //添加时间
        [self addTimer];
    }
    return self;
}


-(void)setImageArray:(NSArray *)imageArray{
    _pageNumber = (int)imageArray.count;
    self.scrollView.contentSize = CGSizeMake(imageArray.count * SCREEN_WIDTH, self.frame.size.height);
    self.pagecontrol.numberOfPages = imageArray.count;
    //添加图片
    for (NSInteger i = 0; i < imageArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, self.frame.size.height);
        imageView.tag = i + 10;
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageArray[i]] placeholderImage:[UIImage imageNamed:@"lesson_default"]];
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [imageView addGestureRecognizer:tap];
        imageView.userInteractionEnabled = YES;
        [self.scrollView addSubview:imageView];
    }
    
    //添加图片
    for (NSInteger i = 0; i < imageArray.count; i ++) {
        UIImageView *imageView = [(UIImageView *)self.scrollView viewWithTag:i+10];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageArray[i]] placeholderImage:[UIImage imageNamed:@"lesson_default"]];
        
    }

}
#pragma mark - tapAction:,addTimer,removeTimer,netxPage
-(void)tapAction:(UITapGestureRecognizer *)sender{
    UIImageView *imageView = (UIImageView *)sender.view;
    int tag = (int)imageView.tag - 10;
    [self.delegate didSelectImageAtIndex:tag];
}


-(void)addTimer{

    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(netxPage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];


}
-(void)removeTimer{
    [_timer invalidate];

}
-(void)netxPage{
    int page = (int)self.pagecontrol.currentPage;
    if (page == _pageNumber - 1) {
        page = 0;
    }else{
    
        page ++;
    }
//滚动scrollView
    CGFloat x = page * self.scrollView.frame.size.width;
    self.scrollView.contentOffset = CGPointMake(x, 0);


}

#pragma mark -UIScrollViewDelegate
//滑动时
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat scrollViewW = scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollViewW / 2) / scrollViewW;
    self.pagecontrol.currentPage = page;
}
//开始拖动时
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];

}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

    [self addTimer];

}

-(void)dealloc{
    [self removeTimer];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
