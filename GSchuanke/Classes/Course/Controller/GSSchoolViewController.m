//
//  GSSchoolViewController.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/28.
//  Copyright © 2016年 刘高升. All rights reserved.
//学校

#import "GSSchoolViewController.h"
#import "GSSchoolHeadView.h"
#import "GSSchoolModel.h"
@interface GSSchoolViewController ()<UITableViewDelegate , UITableViewDataSource>

/**
 学校模型
 */
@property(nonatomic,strong) GSSchoolModel *schoolmodel;

/**
 headerView
 */
@property(nonatomic,strong) GSSchoolHeadView *schoolHeadView;
@end

@implementation GSSchoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.schoolName;
    [self initContentView];
}

#pragma mark - 初始化
-(void)initContentView{
    self.contentTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    self.contentTableView.backgroundColor = [UIColor whiteColor];
    GSSchoolHeadView *header = [[NSBundle mainBundle]loadNibNamed:@"GSSchoolHeadView" owner:nil options:nil].lastObject;
    header.superVc = self;
    header.frame = CGRectMake(0, 0,SCREEN_WIDTH, 265);
    self.contentTableView.tableHeaderView = header;
    self.schoolHeadView = header;

    
    
    [self.view addSubview:self.contentTableView];
    [self setUpRefresh];

}
-(void)setUpRefresh{
    self.contentTableView.mj_header = [GSAnimationRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadSchoolData)];
    //立即刷新
    [self.contentTableView.mj_header beginRefreshing];

}

#pragma mark- 事件操作
-(void)loadSchoolData{
    __weak typeof(self) weakself = self;
    NSString *urlStr = [NSString stringWithFormat:@"http://pop.client.chuanke.com/?mod=school&act=info&mode=&sid=%ld&uid=%@",self.SID,UID];
    [GSNetWorkTools getCourseWithUrl:urlStr parameters:nil isHud:YES succeses:^(id responseBody) {
        weakself.schoolmodel = [GSSchoolModel mj_objectWithKeyValues:responseBody];
        weakself.schoolHeadView.model = weakself.schoolmodel;
        [weakself.contentTableView reloadData];
        [weakself.contentTableView.mj_header endRefreshing];
    } fail:^(NSString *error) {
        NSLog(@"学校数据加载失败");
        [weakself.contentTableView.mj_header endRefreshing];
    }];

}



#pragma mark - UITableViewDelegate , UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_schoolmodel != nil) {
        return 3;
    }
    return 0;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    }else if (section == 1){
        if (self.schoolmodel.TeacherList.count > 3) {
            return 5;
        }else{
        
            return 1 + self.schoolmodel.TeacherList.count;
        }
    
    
    }else{
        return 1;
    
    }
    
    return self.schoolmodel.TeacherList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UILabel *lable = [[UILabel alloc]init];
        static NSString *identifier = @"schoolcell0";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.backgroundColor = [UIColor orangeColor];
            lable.frame = CGRectMake(8, 8, SCREEN_WIDTH - 8 - 8, cell.bounds.size.height -8 - 8);
            lable.numberOfLines = 0;
            lable.textColor = [UIColor blackColor];
            lable.textAlignment = NSTextAlignmentLeft;
            lable.font = [UIFont systemFontOfSize:13.0];
            [cell addSubview:lable];
        }
        lable.text = self.schoolmodel.Notice;
    }
    return [[UITableViewCell alloc]init];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        CGSize size = CGSizeMake(SCREEN_WIDTH - 16 , CGFLOAT_MAX);
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13.0]};
        CGSize lableSize = [self.schoolmodel.Notice boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
        return lableSize.height + 8 + 8 ;
    }else{
    
        return 44;
    
    }



}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

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
