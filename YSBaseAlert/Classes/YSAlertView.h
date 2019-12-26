//
//  YSAlertView.h
//  LogisticHelper
//
//  Created by 任雨生 on 2018/1/16.
//  Copyright © 2018年 任雨生. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
#define ALERT [YSAlertView shareAlert]
@interface YSAlertView : NSObject<MBProgressHUDDelegate>{
    MBProgressHUD *HUD;
}
+ (YSAlertView *)shareAlert;
/**
 *  加载等待
 *
 *  @param title   标题
 *  @param message 子标题
 *  @param view    所在视图
 */
- (void)showLodingWithTitle:(NSString*)title message:(NSString*)message withView:(UIView *)view;
/**
 *  加载等待
 *
 *  @param title 标题
 *  @param view  所在视图
 */
-(void)showLoadingWithTitle:(NSString*)title withView:(UIView*)view;
/**
 *  加载等待
 *
 *  @param view view description
 */
-(void)showLoadingWithView:(UIView*)view;

- (void)hiddenHUD;

- (void)showMessage:(NSString*)message;
- (void)showMessageInView:(UIView *)view message:(NSString*)message;
- (void)showMessage:(NSString*)message time:(NSInteger)time;
@end
