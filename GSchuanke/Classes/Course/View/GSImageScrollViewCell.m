//
//  GSImageScrollViewCell.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/21.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import "GSImageScrollViewCell.h"

@implementation GSImageScrollViewCell
+(instancetype)GSImageScrollViewCellWithTableView:(UITableView *)tableView cellForIndexPath:(NSIndexPath *)indexPath imageArr:(NSArray *)imageArray{
    static NSString *identifier = @"imageScrollViewcell";
    GSImageScrollViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[GSImageScrollViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.imageScrollView.imageArray = imageArray;
    
    return cell;

}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageScrollView = [[GSImageScrolleView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 155)];
        [self.contentView addSubview:self.imageScrollView];
    }

    return self;
}
//-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier frame:(CGRect)frame imageArray:(NSArray *)imageArray{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        self.imageScrollView = [[GSImageScrolleView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) ImageArray:imageArray];
//        NSLog(@"!!!%@",imageArray);
//        [self.contentView addSubview:self.imageScrollView];
//    }
//
//    return self;
//}
-(void)setImageArray:(NSArray *)imageArray{
    _imageArray = imageArray;
    [self.imageScrollView setImageArray:imageArray];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
