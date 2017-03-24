//
//  GSCourseEvaluationViewController.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/24.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import "GSCourseEvaluationViewController.h"
#import "GSDataListModel.h"
#import "GSCourseEvaluationCell.h"
@interface GSCourseEvaluationViewController ()<UITableViewDelegate , UITableViewDataSource>
/**
 pageLimit
 */
@property (nonatomic,assign) NSInteger pageLimit;
/**
 page
 */
@property (nonatomic,assign) NSInteger page;


/**
 请求数据内容
 */
@property(nonatomic,strong) NSMutableArray *datalistArray;

@end

@implementation GSCourseEvaluationViewController
#pragma mark - 懒加载
-(NSMutableArray *)datalistArray{
    if (_datalistArray == nil) {
        _datalistArray = [[NSMutableArray alloc]init];
    }
    return _datalistArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTableview];
}
//初始化、tabbleView
-(void)initTableview{
    self.title = @"评价详情";
    self.contentTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT ) style:UITableViewStylePlain];
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    self.contentTableView.backgroundColor = RGB(230, 230, 230);
    
    [self.view addSubview:self.contentTableView];
    //刷新
    [self reFreshTableView];


}
-(void)reFreshTableView{
    self.contentTableView.mj_header = [GSAnimationRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    //立即刷新
    [self.contentTableView.mj_header beginRefreshing];


}
-(void)loadNewData{
    self.pageLimit = 10;
    self.page = 1;
    __weak typeof(self)  weakSelf = self;
NSString *urlStr = [NSString stringWithFormat:@"http://pop.client.chuanke.com/?mod=course&act=vote&do=list&uid=%@&courseid=%ld&sid=%ld&limit=%ld&page=%ld",UID,self.courseId,self.SID,self.pageLimit,self.page];
    [GSNetWorkTools getCourseWithUrl:urlStr parameters:nil isHud:YES succeses:^(id responseBody) {
//        NSLog(@"%@",responseBody);
        weakSelf.datalistArray = [GSDataListModel mj_objectArrayWithKeyValuesArray:responseBody[@"DataList"]];
        [weakSelf.contentTableView reloadData];
        [weakSelf.contentTableView.mj_header endRefreshing];
    } fail:^(NSString *error) {
        NSLog(@"评论加载失败%@",error);
        [weakSelf.contentTableView.mj_header endRefreshing];
    }];
}
#pragma mark - UITableViewDelegate , UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datalistArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    GSDataListModel *model = self.datalistArray[indexPath.row];
    return model.cellHeight + 5;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    GSCourseEvaluationCell *cell = [GSCourseEvaluationCell GSCourseEvaluationCellWithTableView:tableView cellForindexPath:indexPath dataListArray:self.datalistArray];
    return cell;
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//动画效果
    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation  = CATransform3DMakeRotation((90.0 * M_PI) / 180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0 / -600;
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0.0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
    
    


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
