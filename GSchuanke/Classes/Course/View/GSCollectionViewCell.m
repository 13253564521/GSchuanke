//
//  GSCollectionViewCell.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/22.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import "GSCollectionViewCell.h"
@interface GSCollectionViewCell()
/**
 底层视图
 */
@property(nonatomic,strong) UIScrollView *baseScrollView;

@end
@implementation GSCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+(instancetype)GSCollectionViewCellWithTableView:(UITableView *)tableView cellForIndexPath:(NSIndexPath *)indexPath imagearrayModel:(NSArray *)arrayModel{
static NSString *identifier = @"imagecell";
    GSCollectionViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[GSCollectionViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.imageArray = arrayModel;
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.baseScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(5, 3, SCREEN_WIDTH - 5, 80 )];
        self.baseScrollView.showsHorizontalScrollIndicator = NO;
        self.baseScrollView.showsVerticalScrollIndicator = NO;
        self.baseScrollView.bounces = NO;
        [self.contentView addSubview:self.baseScrollView];
        
        
        
    }
    return self;
}

#pragma mark- 重写set方法
-(void)setImageArray:(NSArray *)imageArray{
    _imageArray = imageArray;
    //设置scrollView的contentSize
    self.baseScrollView.contentSize = CGSizeMake((SCREEN_WIDTH * 2 / 5 + 5) * imageArray.count, 80);
    for (NSInteger i = 0; i < imageArray.count; i ++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH * 2 / 5 + 5) * i, 0, SCREEN_WIDTH * 2 / 5, 80)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageArray[i]] placeholderImage:[UIImage imageNamed:@"defualt_course_icon"]];
        imageView.clipsToBounds = YES;
        imageView.layer.cornerRadius = 5;
        imageView.tag = i + 20;
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickTap:)];
        [imageView addGestureRecognizer:tap];
        
        [self.baseScrollView addSubview:imageView];
    }

}

#pragma mark - 手势方法实现
-(void)onClickTap:(UITapGestureRecognizer *)sender{
    UIImageView *imageView = (UIImageView *)sender.view;
    int index = (int)imageView.tag - 20;
    //实现代理
    [self.delegate selectcollectionImageAtIndex:index];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
