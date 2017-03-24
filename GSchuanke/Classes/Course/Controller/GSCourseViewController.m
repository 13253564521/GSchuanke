//
//  GSCourseViewController.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/18.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import "GSCourseViewController.h"
#import "GSCourseDetailViewController.h"
#import "GSCouerseModel.h"
#import "GSCourseList.h"
#import "GSFocusListModel.h"
#import "GSImageScrollViewCell.h"
#import "GSCollectionViewCell.h"
#import "GSCommonlyCell.h"
#import "GSClassCategoryModel.h"
@interface GSCourseViewController ()<UITableViewDelegate , UITableViewDataSource , GSImageScrolleViewDelegate ,GSCollectionViewCellDelegate>

/**
 自定义导航栏
 */
@property(nonatomic,strong) UIView *navView;

/**
 导航栏左侧按钮
 */
@property(nonatomic,strong) UIButton *leftButton;

/**
 导航栏右侧按钮
 */
@property(nonatomic,strong) UIButton  *rightButton;

/**
 导航栏标题
 */
@property(nonatomic,strong) UILabel *titleLable;

/**
 选择
 */
@property(nonatomic,strong) UISegmentedControl *segmentedControl;


/**
 存放中间collectionView的数组
 */
@property(nonatomic,strong) NSMutableArray *albumListArray;
/**
 存放中间collectionView图片的数组
 */
@property(nonatomic,strong) NSMutableArray *albumListImageArray;
/**
 存放的数组
 */
@property(nonatomic,strong) NSMutableArray *focusListArray;
/**
 图片轮播的数组
 */
@property(nonatomic,strong) NSMutableArray *focusListImageArray;
/**
存放课程列表的数组
 */
@property(nonatomic,strong) NSMutableArray *courseListArray;


/**
 课程分类数组
 */
@property(nonatomic,strong) NSArray *classCategoryArray;

/**
 区分类型：
 精选推荐 = 0；
 课程推荐 = 1；
 */
@property (nonatomic,assign) NSInteger type;

@end

@implementation GSCourseViewController
//懒加载
-(NSMutableArray *)focusListArray{
    if (_focusListArray == nil) {
        _focusListArray = [[NSMutableArray alloc]init];
    }
    return _focusListArray;

}
-(NSMutableArray *)focusListImageArray{

    if (_focusListImageArray == nil) {
        _focusListImageArray = [[NSMutableArray alloc]init];
    }
    return _focusListImageArray;
}

-(NSMutableArray *)albumListArray{
    if (_albumListArray == nil) {
        _albumListArray = [[NSMutableArray alloc]init];
    }
    return _albumListArray;
}

-(NSMutableArray *)albumListImageArray{
    if (_albumListImageArray == nil) {
        _albumListImageArray = [[NSMutableArray alloc]init];
    }
    return _albumListImageArray;
}

-(NSMutableArray *)courseListArray{
    if (_courseListArray == nil) {
        _courseListArray = [[NSMutableArray alloc]init];
    }
    return _courseListArray;
}

-(NSArray *)classCategoryArray{
    if (_classCategoryArray == nil) {
        _classCategoryArray = [[NSArray alloc]init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"classCategory" ofType:@"plist"];
        NSArray *temp = [NSArray arrayWithContentsOfFile:path];
        _classCategoryArray = [GSClassCategoryModel mj_objectArrayWithKeyValuesArray:temp];
    }
    return _classCategoryArray;
}
#pragma mark -

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES];
   
}
-(void)viewWillDisappear:(BOOL)animated{

    //恢复导航栏
    [self.navigationController setNavigationBarHidden:NO];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //自定义导航栏
    [self custoumNav];
    //初始化Tableview
    [self initTableView];
}

-(void)custoumNav{
    self.navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 98)];
    self.navView.backgroundColor = navigationBarColor;
    [self.view addSubview:self.navView];
    //左侧按钮
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton.frame = CGRectMake(8, 20, 60, 40);
    [self.leftButton setTitle:@"城市" forState:UIControlStateNormal];
    self.leftButton.contentMode = UIViewContentModeLeft;
    self.leftButton.tintColor = [UIColor whiteColor];
    //添加点击事件
    [self.leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    //添加到视图
    [self.navView addSubview:self.leftButton];

    //标题
    self.titleLable = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 80, 20, 160, 30)];
    self.titleLable.textColor = [UIColor whiteColor];
    self.titleLable.font = [UIFont systemFontOfSize:19];
    self.titleLable.textAlignment = NSTextAlignmentCenter;
    self.titleLable.text = @"百度传课";
    [self.navView addSubview:self.titleLable];
    
    //右侧按钮
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightButton.frame = CGRectMake(SCREEN_WIDTH - 8 - 40, 20, 40, 40);
    [self.rightButton setImage:[UIImage imageNamed:@"search_btn_unpre_bg"] forState:UIControlStateNormal];
    self.rightButton.contentMode = UIViewContentModeCenter;
    //添加点击事件
    [self.rightButton addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    //添加到视图
    [self.navView addSubview:self.rightButton];
    //UISegmentedControl
    NSArray *segmentedArr = [[NSArray alloc]initWithObjects:@"精选推荐",@"课程分类", nil];
    self.segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArr];
    self.segmentedControl.frame = CGRectMake(36, 64, SCREEN_WIDTH  - 36 * 2, 30);
    self.segmentedControl.selectedSegmentIndex = 0;
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:15],NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName, nil];
    [self.segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
    NSDictionary *heightattributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [self.segmentedControl setTitleTextAttributes:heightattributes forState:UIControlStateHighlighted];
    self.segmentedControl.tintColor = RGB(46, 158, 138);
    //添加点击事件
    [self.segmentedControl addTarget:self action:@selector(segmentedControlClick:) forControlEvents:UIControlEventValueChanged];
    //添加到视图
    [self.navView addSubview:self.segmentedControl];
    
    [self.navView addSubview:self.segmentedControl];
    
    
}
-(void)initTableView{
    self.type = 0;

    self.contentTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 98, SCREEN_WIDTH, SCREEN_HEIGHT - 98 - 49) style:UITableViewStylePlain];
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    [self.view addSubview:self.contentTableView];
    [self setTableviewHeader];


}
-(void)setTableviewHeader{
    self.contentTableView.mj_header = [GSAnimationRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    //立刻进入刷新
    [self.contentTableView.mj_header beginRefreshing];

}
#pragma mark - 数据加载
-(void)loadData{
    __weak typeof(self) weakSelf = self;
    //此处加载数据
    NSString *urlStr = @"http://pop.client.chuanke.com/?mod=recommend&act=mobile&client=2&limit=20";
[GSNetWorkTools getCourseWithUrl:urlStr parameters:nil isHud:YES succeses:^(id responseBody) {
//    NSLog(@"%@",responseBody);
    weakSelf.focusListArray =  [GSFocusListModel mj_objectArrayWithKeyValuesArray:responseBody[@"FocusList"]];
    weakSelf.albumListArray = [GSCouerseModel mj_objectArrayWithKeyValuesArray:responseBody[@"AlbumList"]];
    weakSelf.courseListArray = [GSCourseList mj_objectArrayWithKeyValuesArray:responseBody[@"CourseList"]];
    [weakSelf.focusListImageArray removeAllObjects];
    [weakSelf.albumListImageArray removeAllObjects];

    for (NSInteger i = 0; i <weakSelf.focusListArray.count ; i++) {
        GSFocusListModel *model = self.focusListArray[i];
        [weakSelf.focusListImageArray addObject:model.PhotoURL];
    }
    for (NSInteger i = 0; i < weakSelf.albumListArray.count; i++) {
        GSCouerseModel *model  = self.albumListArray[i];
        [weakSelf.albumListImageArray addObject:model.PhotoURL];
    }
//    NSLog(@"%@",weakSelf.albumListImageArray);
    [weakSelf.contentTableView reloadData];
    [weakSelf.contentTableView.mj_header endRefreshing];
} fail:^(NSString *error) {
    [weakSelf.contentTableView.mj_header endRefreshing];
}];
    
}



#pragma mark - 事件点击方法
-(void)leftButtonClick{
    NSLog(@"左侧按钮点击");

}
-(void)rightButtonClick{
    NSLog(@"搜索加载中。。。");

}
-(void)segmentedControlClick:(UISegmentedControl *)sender{
    NSInteger type = sender.selectedSegmentIndex;
    if (type == 0) {
        self.type = 0;
    }else{
        self.type = 1;
    }
    [self.contentTableView reloadData];
}


#pragma mark -UITableViewDelegate , UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.type == 0) {
       return self.courseListArray.count + 2;
    }else if (self.type == 1){
    
        return self.classCategoryArray.count;
    }
    
return self.courseListArray.count + 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.type == 0) {
        if (indexPath.row == 0) {
            return 155;
        }else if(indexPath.row == 1){
            
            return 86;
        }else{
            return 80;
            
        }
    }else{
        return 60;
    
    }

    

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.type == 0) {
        if (indexPath.row == 0) {
            GSImageScrollViewCell *cell = [GSImageScrollViewCell GSImageScrollViewCellWithTableView:tableView cellForIndexPath:indexPath imageArr:self.focusListImageArray];
            cell.imageScrollView.delegate = self;
            cell.imageArray = self.focusListImageArray;
            return cell;
        }else if(indexPath.row == 1){
            GSCollectionViewCell *cell = [GSCollectionViewCell GSCollectionViewCellWithTableView:tableView cellForIndexPath:indexPath imagearrayModel:self.albumListImageArray];
            cell.delegate = self;
            cell.imageArray = self.albumListImageArray;
            return cell;
        }else{
            GSCommonlyCell *cell = [GSCommonlyCell  GSCommonlyCellWhithTableView:tableView cellForIndexPath:indexPath courseModelArray:self.courseListArray];
            
            return cell;
            
        }
 
    }else{

        GSClassCategoryModel *classModel = self.classCategoryArray[indexPath.row];
        static NSString *identifier = @"classCategorycell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(8, 10, 40, 40)];
        imageView.clipsToBounds = YES;
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) + 20, 40 - 25, 100, 30)];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            [cell addSubview:imageView];
            [cell addSubview:lable];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        imageView.image = [UIImage imageNamed:classModel.image];
        lable.text = classModel.title;
    
    
    
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.contentTableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.type == 0) {
        if (indexPath.row > 1) {
            GSFocusListModel *model = self.focusListArray[indexPath.row];
            GSCourseDetailViewController *detailVc = [[GSCourseDetailViewController alloc]init];
            detailVc.SID = model.SID;
            detailVc.courseId = model.CourseID;
            [self.navigationController pushViewController:detailVc animated:YES];
        }
    }


}



#pragma mark -GSImageScrolleViewDelegate , GSCollectionViewCellDelegate
-(void)didSelectImageAtIndex:(NSInteger)index{
    GSFocusListModel *model = self.focusListArray[index];
    GSCourseDetailViewController *detailVc = [[GSCourseDetailViewController alloc]init];
    detailVc.SID = model.SID;
    detailVc.courseId = model.CourseID;
    [self.navigationController pushViewController:detailVc animated:YES];

}
-(void)selectcollectionImageAtIndex:(int)index{
    NSLog(@"您选中第%d张图片",index);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
