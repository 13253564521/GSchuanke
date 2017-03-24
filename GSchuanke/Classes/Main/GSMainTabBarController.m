//
//  GSMainTabBarController.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/18.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import "GSMainTabBarController.h"
#import "GSMainNavigationController.h"
#import "GSCourseViewController.h"
#import "GSMyClassViewController.h"
#import "GSOffineDownLoadViewController.h"

@interface GSMainTabBarController ()

@end

@implementation GSMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //添加子类控制器
    [self addChildrenController];
    
    
    
}
//添加子类控制器
-(void)addChildrenController{
    //课程推荐
    [self addChildrenController:[[GSCourseViewController alloc]init] title:@"课程推荐" image:@"bottom_tab1_unpre" selectImage:@"bottom_tab1_pre"];
    //我的传课
    [self addChildrenController:[[GSMyClassViewController alloc]init] title:@"我的传课" image:@"bottom_tab2_unpre" selectImage:@"bottom_tab3_pre"];
    
    //离线下载
    [self addChildrenController:[[GSOffineDownLoadViewController alloc] init] title:@"离线下载" image:@"bottom_tab3_unpre" selectImage:@"bottom_tab3_pre"];



}

-(void)addChildrenController:(UIViewController *)childrenContrller title:(NSString *)title image:(NSString *)imageName selectImage:(NSString *)selectImageName{
    UITabBar *tababr = self.tabBar;
    tababr.tintColor = navigationBarColor;
    childrenContrller.title = title;
    childrenContrller.tabBarItem.image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childrenContrller.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //添加 导航控制器
    GSMainNavigationController *nav = [[GSMainNavigationController alloc]initWithRootViewController:childrenContrller];

    [self addChildViewController:nav];
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
