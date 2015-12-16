//
//  ZJStatusBarHUD.m
//  状态栏蒙版
//
//  Created by ZJ on 14/12/16.
//  Copyright © 2014年 ZJ. All rights reserved.
//

#import "ZJStatusBarHUD.h"

// 全局变量
static UIWindow *_window;
// 窗口高度
static const CGFloat ZJWindowHeight = 20;
// 动画播放时间
static const CGFloat ZJDuration = 1.0;
// HUD的停留时间
static const CGFloat ZJDelay = 0.5;
// 字体大小
#define ZJFont [UIFont systemFontOfSize:15]
// 屏幕宽度
#define ZJScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation ZJStatusBarHUD

+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    // 防止频繁调用
    if (_window) return;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = ZJFont;
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    
    // 设置数据
    [btn setTitle:msg forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    
    // 获取主窗口
    _window = [[UIWindow alloc] init];
    _window.backgroundColor = [UIColor blackColor];
    _window.windowLevel = UIWindowLevelAlert;
    _window.frame = CGRectMake(0, -ZJWindowHeight, ZJScreenWidth, ZJWindowHeight);
    btn.frame = _window.bounds;
    [_window addSubview:btn];
    
    // 显示主窗口
    _window.hidden = NO;
    
    // 动画
    [UIView animateWithDuration:ZJDuration animations:^{
        // 从屏幕顶部移动到屏幕正上方
        CGRect frame = _window.frame;
        frame.origin.y = 0;
        _window.frame = frame;
    } completion:^(BOOL finished) {
        // 停留一秒
        [UIView animateWithDuration:ZJDuration delay:ZJDelay options:kNilOptions animations:^{
            // 移出屏幕
            CGRect frame = _window.frame;
            frame.origin.y = -ZJWindowHeight;
            _window.frame = frame;
        } completion:^(BOOL finished) {
            // 移除窗口
            _window = nil;
        }];
    }];
}

+ (void)showMessage:(NSString *)msg imageName:(NSString *)imageName
{
    [self showMessage:msg image:[UIImage imageNamed:imageName]];
}

+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg imageName:@"ZJStatusBarHUD.bundle/success"];
}

+ (void)showError:(NSString *)msg
{
    [self showMessage:msg imageName:@"ZJStatusBarHUD.bundle/error"];
}

+ (void)showLoading:(NSString *)msg
{
    // 防止频繁调用
    if (_window) return;
    
    // 创建窗口
    _window = [[UIWindow alloc] init];
    
    // 设置窗口
    _window.frame = CGRectMake(0, -ZJWindowHeight, ZJScreenWidth, ZJWindowHeight);
    _window.backgroundColor = [UIColor blackColor];
    _window.windowLevel = UIWindowLevelAlert;
    _window.hidden = NO;
    
    // 显示文字
    UILabel *label = [[UILabel alloc] init];
    label.frame = _window.bounds;
    label.text = msg;
    label.font = ZJFont;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [_window addSubview:label];
    
    // 指示器
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    indicatorView.frame = CGRectMake(100, 0, ZJWindowHeight, ZJWindowHeight);
    [_window addSubview:indicatorView];
    [indicatorView startAnimating];
    
    // 动画
    [UIView animateWithDuration:ZJDuration animations:^{
        // 下移到(0,0)点
        CGRect frame = _window.frame;
        frame.origin.y = 0;
        _window.frame = frame;
    }];
}

+ (void)hiddenLoading
{
    // 防止重复调用
    if (_window == nil) return;
    
    // 动画
    [UIView animateWithDuration:ZJDuration animations:^{
        // 移出屏幕
        CGRect frame = _window.frame;
        frame.origin.y = -ZJWindowHeight;
        _window.frame = frame;
    } completion:^(BOOL finished) {
        // 移除控件
        _window = nil;
    }];
}

@end
