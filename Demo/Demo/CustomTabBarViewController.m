//
//  CustomTabBarViewController.m
//  Demo
//
//  Created by zhangming on 17/7/25.
//  Copyright © 2017年 youjiesi. All rights reserved.
//

#import "CustomTabBarViewController.h"
#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"

@interface CustomTabBarViewController ()<UITabBarControllerDelegate>

@property (nonatomic,assign) NSInteger  indexFlag;

@end

@implementation CustomTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    nav1.tabBarItem.title = @"推荐";
    nav1.tabBarItem.image = [[UIImage imageNamed:@"icon_tab1_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav1.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tab1_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:[[ViewController1 alloc] init]];
    nav2.tabBarItem.title = @"演出";
    nav2.tabBarItem.image = [[UIImage imageNamed:@"icon_tab2_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav2.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tab2_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:[[ViewController2 alloc] init]];
    nav3.tabBarItem.title = @"发现";
    nav3.tabBarItem.image = [[UIImage imageNamed:@"icon_tab3_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav3.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tab3_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:[[ViewController3 alloc] init]];
    nav4.tabBarItem.title = @"我";
    nav4.tabBarItem.image = [[UIImage imageNamed:@"icon_tab4_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav4.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tab4_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    self.viewControllers = @[nav1,nav2,nav3,nav4];
    
    
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSInteger index = [self.tabBar.items indexOfObject:item];
    if (index != self.indexFlag) {
        //执行动画
        NSMutableArray *arry = [NSMutableArray array];
        for (UIView *btn in self.tabBar.subviews) {
            if ([btn isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
                [arry addObject:btn];
            }
        }
        //添加动画
        //---将下面的代码块直接拷贝到此即可---
        [self animationWithIndex:index];
        self.indexFlag = index;
    }
}

// 动画
- (void)animationWithIndex:(NSInteger) index {
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    //放大效果，并回到原位
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //速度控制函数，控制动画运行的节奏
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 0.2;       //执行时间
    animation.repeatCount = 1;      //执行次数
    animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
    animation.fromValue = [NSNumber numberWithFloat:0.7];   //初始伸缩倍数
    animation.toValue = [NSNumber numberWithFloat:1.3];     //结束伸缩倍数
    [[tabbarbuttonArray[index] layer]
     addAnimation:animation forKey:nil];
    
    self.indexFlag = index;
    
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
