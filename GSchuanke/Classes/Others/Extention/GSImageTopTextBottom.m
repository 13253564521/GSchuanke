//
//  GSImageTopTextBottom.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/23.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import "GSImageTopTextBottom.h"

@implementation GSImageTopTextBottom
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.clipsToBounds = YES;
        self.imageView.contentMode = UIViewContentModeCenter;
        [self.imageView sizeToFit];
        
        [self.titleLabel setFont:[UIFont systemFontOfSize:12]];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    //图片在上
    self.imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * 2 / 3 - 2);
    
    //文字在下
    self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame) + 2, self.frame.size.width + 10, self.frame.size.height / 3);
    
    
    


}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
