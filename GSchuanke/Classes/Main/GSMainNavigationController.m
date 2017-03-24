//
//  GSMainNavigationController.m
//  GSchuanke
//
//  Created by 刘高升 on 16/11/18.
//  Copyright © 2016年 刘高升. All rights reserved.
//

#import "GSMainNavigationController.h"

@interface GSMainNavigationController ()

@end

@implementation GSMainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+(void)initialize{
    //设置导航栏颜色
    UINavigationBar *navBar = [UINavigationBar appearance];
    //导航栏背景颜色
    navBar.barTintColor = navigationBarColor;
    //导航栏文字颜色
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:17]}];


}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
        back.frame = CGRectMake(0, 0, 70, 30);
        [back setImage:[UIImage imageNamed:@"file_tital_back_but"] forState:UIControlStateNormal];
        back.imageEdgeInsets = UIEdgeInsetsMake(0, -16, 0, 0);
//        back.contentEdgeInsets = UIEdgeInsetsMake(0, -13, 0, 0);
        [back addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
        // 让按钮内部的所有内容左对齐
        back.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //将leftItem设置为自定义按钮
        UIBarButtonItem  *leftItem =[[UIBarButtonItem alloc]initWithCustomView: back];
        viewController.navigationItem.leftBarButtonItem = leftItem;
        //解决自定义了leftBarbuttonItem左滑返回手势失效了的问题
        self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
        viewController.hidesBottomBarWhenPushed = YES;
    }

    [super pushViewController:viewController animated:animated];
}


-(void)backAction:(UIButton *)sender{

    [self popViewControllerAnimated:YES];
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
