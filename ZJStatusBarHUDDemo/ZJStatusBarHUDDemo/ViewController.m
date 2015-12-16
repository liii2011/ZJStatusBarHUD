//
//  ViewController.m
//  ZJStatusBarHUDDemo
//
//  Created by liii on 15/12/16.
//  Copyright © 2015年 liii. All rights reserved.
//

#import "ViewController.h"
#import "ZJStatusBarHUD.h"

@interface ViewController ()

/**
 *  点击"图片保存成功"按钮
 */
- (IBAction)successButton;

/**
 *  点击"图片保存失败"按钮
 */
- (IBAction)failureButton;

/**
 *  图片正在下载
 */
- (IBAction)loading;

/**
 *  隐藏正在下载
 */
- (IBAction)hidden;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)successButton {
    [ZJStatusBarHUD showSuccess:@"图片保存成功!!!"];
}

- (IBAction)failureButton {
    [ZJStatusBarHUD showError:@"图片保存失败!!!"];
}

- (IBAction)loading {
    [ZJStatusBarHUD showLoading:@"图片正在下载..."];
}

- (IBAction)hidden {
    [ZJStatusBarHUD hiddenLoading];
}

@end
