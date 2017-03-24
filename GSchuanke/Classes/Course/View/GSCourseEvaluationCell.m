//
//  GSCourseEvaluationCell.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/24.
//  Copyright © 2016年 刘高升. All rights reserved.
//evaluationCell

#import "GSCourseEvaluationCell.h"
#import "NSString+GSSize.h"
@interface GSCourseEvaluationCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *evaluationLable;
@property (weak, nonatomic) IBOutlet UILabel *dateLable;

@end
@implementation GSCourseEvaluationCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //用户名颜色
    self.userName.textColor = navigationBarColor;
    //设置图片圆角
    self.iconImageView.layer.cornerRadius = 30;
    self.iconImageView.layer.masksToBounds = YES;
    [self.iconImageView sizeToFit];
    self.iconImageView.backgroundColor = RGB(230, 230, 230);
}
+(instancetype)GSCourseEvaluationCellWithTableView:(UITableView *)tableView cellForindexPath:(NSIndexPath *)indexPath dataListArray:(NSMutableArray *)datalistArray{
static NSString *identifier = @"evaluationCell";
    
    GSCourseEvaluationCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"GSCourseEvaluationCell" owner:nil options:nil].lastObject ;
    }
    cell.model = datalistArray[indexPath.row];
    return cell;
}

-(void)setModel:(GSDataListModel *)model{
    _model = model;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.Avatar] placeholderImage:[UIImage imageNamed:@"defualt_course_icon"]];
    self.userName.text = model.NickName;
    self.evaluationLable.text = model.VoteText;
    self.dateLable.text = [NSString stringWithFormat:@"发布日期:%@",model.CreateTimeToDate];
//    [self layoutIfNeeded];
//    CGSize contentSize = [model.VoteText boundingRectWithSize:CGSizeMake(self.evaluationLable.bounds.size.width, 0) withFont:13];
    model.cellHeight = CGRectGetMaxY(self.dateLable.frame) + 10;

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
