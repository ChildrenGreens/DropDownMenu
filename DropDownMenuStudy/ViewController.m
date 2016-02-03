//
//  ViewController.m
//  DropDownMenuStudy
//
//  Created by caiqiujun on 16/2/2.
//  Copyright © 2016年 caiqiujun. All rights reserved.
//

#import "ViewController.h"
#import "DropDownMenuView.h"


@interface ViewController ()
@property (nonatomic, strong)DropDownMenuView *dropDownMenuView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏标题
    self.navigationItem.title = @"商家";
    // 适配
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 背景色
    self.view.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    
    
    self.dropDownMenuView = [[DropDownMenuView alloc] init];
    [self.view addSubview:self.dropDownMenuView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
