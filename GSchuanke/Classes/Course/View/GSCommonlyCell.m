//
//  GSCommonlyCell.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/22.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import "GSCommonlyCell.h"
@interface GSCommonlyCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLable;


@end

@implementation GSCommonlyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconView.layer.cornerRadius = 5;
    self.iconView.clipsToBounds = YES;
    // Initialization code
}

+(instancetype)GSCommonlyCellWhithTableView:(UITableView *)tabbleView cellForIndexPath:(NSIndexPath *)indexPath courseModelArray:(NSArray *)courseModelArray{
    static NSString *identifier = @"commonlyCell";
    GSCommonlyCell *cell = [tabbleView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"GSCommonlyCell" owner:nil options:nil].lastObject;
    }
    cell.model = courseModelArray[indexPath.row - 2];
    return cell;
}

-(void)setModel:(GSCourseList *)model{
    _model = model;
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.PhotoURL] placeholderImage:[UIImage imageNamed:@"lesson_default"]];
    self.titleLable.text = model.CourseName;
    self.subTitleLable.text = model.Brief;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
