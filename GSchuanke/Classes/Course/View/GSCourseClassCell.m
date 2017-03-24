//
//  GSCourseClassCell.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/23.
//  Copyright © 2016年 刘高升. All rights reserved.
//courseclassCell

#import "GSCourseClassCell.h"
@interface GSCourseClassCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;


@end
@implementation GSCourseClassCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+(instancetype)GSCourseClassCellWithTableView:(UITableView *)tableView cellForindexPath:(NSIndexPath *)indexPath classModelArray:(NSMutableArray *)classModelArray{
static NSString *identifier = @"courseclassCell";
    GSCourseClassCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"GSCourseClassCell" owner:nil options:nil].lastObject;
    }

    cell.model = classModelArray[indexPath.row];
    cell.titleLable.text = [NSString stringWithFormat:@"第%ld节:%@",indexPath.row + 1,cell.model.ClassName];
    cell.timeLable.text = [NSString stringWithFormat:@"课程时长：%ld分钟",cell.model.VideoTimeLength / 60];
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
