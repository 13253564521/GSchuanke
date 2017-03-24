//
//  GSSchoolHeadView.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/29.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import "GSSchoolHeadView.h"

@interface GSSchoolHeadView()
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImageView;
@property (weak, nonatomic) IBOutlet UIView *baseView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageVIew;
@property (weak, nonatomic) IBOutlet UIButton *courseButton;
@property (weak, nonatomic) IBOutlet UIButton *zhiboButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *deskTopButton;
@property (weak, nonatomic) IBOutlet UILabel *courseCountLable;
@property (weak, nonatomic) IBOutlet UILabel *zhiboCountLable;




@end
@implementation GSSchoolHeadView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.baseView.backgroundColor = RGB(246, 246, 246);
    self.iconImageVIew.layer.cornerRadius = 5;
    self.iconImageVIew.clipsToBounds = YES;
    [self.iconImageVIew sizeToFit];
    self.courseCountLable.textColor = RGB(121, 121, 121);
    self.zhiboCountLable.textColor = RGB(121, 121, 121);
    [self.courseButton setTitleColor:RGB(121, 121, 121) forState:UIControlStateNormal];
    [self.zhiboButton setTitleColor:RGB(121, 121, 121) forState:UIControlStateNormal];
    [self.courseButton setTitle:@"课程" forState:UIControlStateNormal];
    [self.zhiboButton setTitle:@"直播" forState:UIControlStateNormal];
    
    

}

-(void)setModel:(GSSchoolModel *)model{
    _model = model;
    [self.iconImageVIew sd_setImageWithURL:[NSURL URLWithString:model.SchoolLogoUrl] placeholderImage:[UIImage imageNamed:@"lesson_default.png"]];
    self.courseCountLable.text = [NSString stringWithFormat:@"%ld",model.CourseSaleNumber];
    self.zhiboCountLable.text = [NSString stringWithFormat:@"%ld",model.PrelectNum];
    

}

- (IBAction)courseClick:(id)sender {
}
- (IBAction)zhiboClick:(id)sender {
}
- (IBAction)shareClick:(id)sender {
}
- (IBAction)deskTopClick:(id)sender {
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
