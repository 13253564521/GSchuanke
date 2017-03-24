//
//  GSCourseDetailHeadView.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/23.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import "GSCourseDetailHeadView.h"
#import "GSImageTopTextBottom.h"
#import "GSCourseIntroductionViewController.h"
#import "GSCourseEvaluationViewController.h"
#import "GSSchoolViewController.h"
@interface GSCourseDetailHeadView()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *peopeleLable;
@property (weak, nonatomic) IBOutlet UIButton *schoolButton;
//目录
@property (weak, nonatomic) IBOutlet GSImageTopTextBottom *catalogButton;
//详细
@property (weak, nonatomic) IBOutlet GSImageTopTextBottom *detailsButton;
//评价
@property (weak, nonatomic) IBOutlet GSImageTopTextBottom *evaluate;
@property (weak, nonatomic) IBOutlet UILabel *evaluateLable;


@end
@implementation GSCourseDetailHeadView
-(void)awakeFromNib{
    [super awakeFromNib];
    self.bottomView.backgroundColor = selectColor;
    self.schoolButton.layer.borderWidth = 0.5;
    self.schoolButton.layer.borderColor = selectColor.CGColor;
    self.schoolButton.layer.cornerRadius = 2.0;
    
    
    
    [self.catalogButton setImage:[UIImage imageNamed:@"course_catalog_icon"] forState:UIControlStateNormal];
    [self.detailsButton setImage:[UIImage imageNamed:@"course_info_icon"] forState:UIControlStateNormal];
    [self.evaluate setImage:[UIImage imageNamed:@"course_catalog_icon"] forState:UIControlStateNormal];
    
    [self.catalogButton setTitle:@"目录" forState:UIControlStateNormal];
    [self.detailsButton setTitle:@"详情" forState:UIControlStateNormal];
    [self.evaluate setTitle:@"评价" forState:UIControlStateNormal];
    self.catalogButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
    self.detailsButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
    self.evaluate.titleLabel.font = [UIFont systemFontOfSize:14.0];
    self.evaluate.titleLabel.textAlignment = NSTextAlignmentLeft;


}

-(void)setModel:(GSDetailHeadModel *)model{
    _model = model;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.PhotoURL] placeholderImage:[UIImage imageNamed:@"defualt_course_icon"]];
    self.titleLable.text = model.CourseName;
    if (model.Cost) {
      self.priceLable.text = [NSString stringWithFormat:@"￥%ld",model.Cost];
    }else{
        self.priceLable.text = @"免费";
    }
    
    self.peopeleLable.text =[NSString stringWithFormat:@"%ld",model.StudentNumber] ;
    [self.schoolButton setTitle:model.SchoolName forState:UIControlStateNormal];
    if (model.TotalAppraise) {
        self.evaluateLable.text = [NSString stringWithFormat:@"(%ld)",model.TotalAppraise];
    }else{
        self.evaluateLable.hidden = YES;
    
    }

}
#pragma mark - 点击事件

- (IBAction)schoolButtonClick:(id)sender {
    GSSchoolViewController *school = [[GSSchoolViewController alloc]init];
    school.SID = self.model.SID;
    school.schoolName = self.model.SchoolName;
    [_superVc.navigationController pushViewController:school animated:YES];
    
}
- (IBAction)catalogClick:(id)sender {
}
- (IBAction)detailClick:(id)sender {
    GSCourseIntroductionViewController *detail = [[GSCourseIntroductionViewController alloc]init];
    [self.superVc.navigationController pushViewController:detail animated:YES];
    
}
- (IBAction)evaluate:(id)sender {
    GSCourseEvaluationViewController *evaluate = [[GSCourseEvaluationViewController alloc]init];
    evaluate.SID = self.model.SID;
    evaluate.courseId = self.model.CourseID;
    [_superVc.navigationController pushViewController:evaluate animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
