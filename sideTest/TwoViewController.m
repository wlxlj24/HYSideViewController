//
//  TwoViewController.m
//  sideTest
//
//  Created by Sekorm on 16/8/15.
//  Copyright © 2016年 HelloYeah. All rights reserved.
//

#import "TwoViewController.h"
#import "LeftSideVC.h"
#import "RightSideVC.h"

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"向左侧滑" style:UIBarButtonItemStylePlain target:self action:@selector(leftSide)];
    //创建侧滑出来的控制器
    RightSideVC * vc = [[RightSideVC alloc]init];
    //设置侧滑出来的View的宽度,小于屏幕宽度
    vc.view.frame = CGRectMake(0, 0, 150, 0);
    //设置左侧的控制器
    [self setRightSideVC:vc];
    //侧滑控制器 - 退出侧滑状态的代码块
    __weak typeof(self) weakSelf = self;
    vc.exitRightSideblock = ^{
        [weakSelf leftSide];
    };
}

- (void)leftSide{
    
    [self sideAnimateDuration:0.25 SideDirection:HYSideDirectionLeft];
}

@end
