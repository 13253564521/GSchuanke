//
//  GSCourseDetailViewController.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/22.
//  Copyright © 2016年 刘高升. All rights reserved.
//
#import <UMSocialCore/UMSocialCore.h>
#import <UShareUI/UShareUI.h>
#import "GSCourseDetailViewController.h"
#import "GSCourseDetailHeadView.h"
#import "GSDetailHeadModel.h"
#import "GSCourseClassCell.h"
#import "GSStepListModel.h"
@interface GSCourseDetailViewController ()<UITableViewDelegate , UITableViewDataSource>

/**
 头部视图
 */
@property(nonatomic,strong) GSCourseDetailHeadView *headView;
/**
 detailModel
 */
@property(nonatomic,strong) GSDetailHeadModel *detailModel;


/**
 章节列表
 */
@property(nonatomic,strong) NSMutableArray *stepListArray;
/**
 课程列表
 */
@property(nonatomic,strong) NSMutableArray *classListDataArray;
@end

@implementation GSCourseDetailViewController
#pragma mark  - 懒加载
-(NSMutableArray *)classListDataArray{
    if (_classListDataArray == nil) {
        _classListDataArray = [[NSMutableArray alloc]init];
    }
    return _classListDataArray;
}
-(NSMutableArray *)stepListArray{
    if (_stepListArray == nil) {
        _stepListArray = [[NSMutableArray alloc]init];
    }
    return _stepListArray;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNav];
    [self initcontentTableView];
    //设置用户自定义的平台
    [UMSocialUIManager setPreDefinePlatforms:@[@(UMSocialPlatformType_WechatSession),
                                               @(UMSocialPlatformType_WechatTimeLine),
                                               @(UMSocialPlatformType_WechatFavorite),
                                               @(UMSocialPlatformType_QQ),
                                               @(UMSocialPlatformType_Qzone),
                                               @(UMSocialPlatformType_Sina),
                                               @(UMSocialPlatformType_TencentWb),
                                               @(UMSocialPlatformType_AlipaySession),
                                               @(UMSocialPlatformType_Renren),
                                               @(UMSocialPlatformType_Douban),
                                               @(UMSocialPlatformType_Sms),
                                               @(UMSocialPlatformType_Email),
                                               @(UMSocialPlatformType_Facebook),
                                               @(UMSocialPlatformType_Twitter),
                                               @(UMSocialPlatformType_LaiWangSession),
                                               @(UMSocialPlatformType_LaiWangTimeLine),
                                               @(UMSocialPlatformType_YixinSession),
                                               @(UMSocialPlatformType_YixinTimeLine),
                                               @(UMSocialPlatformType_YixinFavorite),
                                               @(UMSocialPlatformType_Instagram),
                                               @(UMSocialPlatformType_Line),
                                               @(UMSocialPlatformType_Whatsapp),
                                               @(UMSocialPlatformType_Linkedin),
                                               @(UMSocialPlatformType_Flickr),
                                               @(UMSocialPlatformType_KakaoTalk),
                                               @(UMSocialPlatformType_Pinterest),
                                               @(UMSocialPlatformType_Tumblr),
                                               @(UMSocialPlatformType_UserDefine_Begin+1),
                                               ]];
}

#pragma mark  - 初始化控件
//初始化导航栏
-(void)initNav{
//导航栏右侧收藏按钮
    self.title = @"课程详情";
    UIButton *right = [UIButton buttonWithType:UIButtonTypeCustom];
    right.frame = CGRectMake(0, 0, 40, 40);
    [right setImage:[UIImage imageNamed:@"course_info_bg_collect"] forState:UIControlStateNormal];
    [right setImage:[UIImage imageNamed:@"course_info_bg_collected"] forState:UIControlStateSelected];
    [right addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:right];
    self.navigationItem.rightBarButtonItem = rightItem;

}
//初始化tabbleView
-(void)initcontentTableView{
    self.contentTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    [self.view addSubview:self.contentTableView];
    //头部视图加载
    GSCourseDetailHeadView *headView = [[NSBundle mainBundle]loadNibNamed:@"GSCourseDetailHeadView" owner:nil options:nil].lastObject;
    headView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 180);
    headView.backgroundColor = navigationBarColor;
    headView.superVc = self;
    self.headView = headView;
    self.contentTableView.tableHeaderView = headView;
    [self tableViewRefresh];
    

}
//初始化刷新控件
-(void)tableViewRefresh{
    self.contentTableView.mj_header = [GSAnimationRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadDatas)];
    //立即刷新
    [self.contentTableView.mj_header beginRefreshing];
}
//请求数据
-(void)loadDatas{
    __weak typeof(self) weakSelf = self;
    NSString *urlStr = [NSString stringWithFormat:@"http://pop.client.chuanke.com/?mod=course&act=info&do=getClassList&sid=%ld&courseid=%ld&version=%@&uid=%@",self.SID,self.courseId,VERSION,UID];
    [GSNetWorkTools getCourseWithUrl:urlStr parameters:nil isHud:YES succeses:^(id responseBody) {
//        NSLog(@"%@",responseBody);
        weakSelf.detailModel = [GSDetailHeadModel mj_objectWithKeyValues:responseBody];
        //章数组
        weakSelf.stepListArray = [GSStepListModel mj_objectArrayWithKeyValuesArray:weakSelf.detailModel.StepList];
        //节课程数组
        [weakSelf.classListDataArray removeAllObjects];
        for (NSInteger i = 0 ; i < weakSelf.stepListArray.count ; i++) {
            GSStepListModel *model = weakSelf.stepListArray[i];
            NSArray *tempArray= [GSClassListModel mj_objectArrayWithKeyValuesArray:model.ClassList];
            [weakSelf.classListDataArray addObject:tempArray];
        }
        [weakSelf.contentTableView reloadData];
        weakSelf.headView.model = weakSelf.detailModel;
    
        [weakSelf.contentTableView.mj_header endRefreshing];
    } fail:^(NSString *error) {
       [weakSelf.contentTableView.mj_header endRefreshing];
    }];


}

#pragma mark - UITableViewDelegate , UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.stepListArray.count;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *temp = self.classListDataArray[section];
    return temp.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 68;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 55;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    GSStepListModel *model = self.stepListArray[section];
    return [NSString stringWithFormat:@"第%ld章:%@",model.StepIndex,model.StepName];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GSCourseClassCell *cell = [GSCourseClassCell GSCourseClassCellWithTableView:tableView cellForindexPath:indexPath classModelArray:self.classListDataArray[indexPath.section]];
//    NSLog(@"%@",self.classListDataArray);
    return cell;
}
#pragma mark  - 事件点击方法
-(void)rightButtonClick:(UIButton *)sender{

    NSLog(@"收藏");
    [UMSocialShareUIConfig shareInstance].sharePageGroupViewConfig.sharePageGroupViewPostionType = UMSocialSharePageGroupViewPositionType_Bottom;
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageItemStyleType = UMSocialPlatformItemViewBackgroudType_None;
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
    }];

}

#pragma mark - UM分享
- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:self completion:^(id result, NSError *error) {
        UMSocialUserInfoResponse *userinfo =result;
        NSString *message = [NSString stringWithFormat:@"name: %@\n icon: %@\n gender: %@\n",userinfo.name,userinfo.iconurl,userinfo.gender];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UserInfo"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                              otherButtonTitles:nil];
        [alert show];
    }];
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
