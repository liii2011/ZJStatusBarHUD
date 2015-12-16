//
//  ZJStatusBarHUD.h
//  状态栏蒙版
//
//  Created by ZJ on 14/12/16.
//  Copyright © 2014年 ZJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJStatusBarHUD : NSObject

/**
 *  显示信息
 *
 *  @param msg   要显示的文字
 *  @param image 要显示的图片(UIImage)
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 *  显示信息
 *
 *  @param message   要显示的文字
 *  @param imageName 要显示的图片(高度最好20以内, 仅限本地图片)
 */
+ (void)showMessage:(NSString *)msg imageName:(NSString *)imageName;

/**
 *  显示成功信息(此方法已过期, 请使用 showMessage: imageName: 方法)
 *
 *  @param msg 要显示的文字(使用默认值图片)
 */
+ (void)showSuccess:(NSString *)msg NS_DEPRECATED_IOS(6_0, 7_0, "请使用 showMessage: imageName: 方法");

/**
 *  显示失败信息
 *
 *  @param msg 要显示的文字(使用默认值图片)
 */
+ (void)showError:(NSString *)msg;

/**
 *  显示加载信息
 *
 *  @param msg 要显示的文字
 */
+ (void)showLoading:(NSString *)msg;

/**
 *  隐藏加载窗口
 */
+ (void)hiddenLoading;

@end
