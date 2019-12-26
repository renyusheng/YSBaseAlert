//
//  YSAlertView.m
//  LogisticHelper
//
//  Created by 任雨生 on 2018/1/16.
//  Copyright © 2018年 任雨生. All rights reserved.
//

#import "YSAlertView.h"
#import "UIView+YSView.h"
#import "UILabel+YSLabel.h"
#define MAIN_WINDOW [UIApplication sharedApplication].keyWindow
#define StrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))


static YSAlertView *defaultAlert = nil;

@implementation YSAlertView
+ (YSAlertView *)shareAlert{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultAlert = [[YSAlertView alloc] init];
    });
    return defaultAlert;
}
/**
 *  加载等待
 *
 *  @param title   标题
 *  @param message 子标题
 *  @param view    所在视图
 */
- (void)showLodingWithTitle:(NSString*)title message:(NSString*)message withView:(UIView *)view{
    // 主线程执行：
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!view) {
            HUD = [[MBProgressHUD alloc] initWithView:MAIN_WINDOW];
            [MAIN_WINDOW addSubview:HUD];
        }else{
            if (HUD) {
                [HUD hideAnimated:YES];
            }
            HUD = [[MBProgressHUD alloc] initWithView:view];
            [view addSubview:HUD];
        }
        HUD.delegate = self;
        HUD.label.text = title;
        HUD.detailsLabel.text = message;
        HUD.square = YES;
        [HUD showAnimated:YES];
    });
}
/**
 *  加载等待
 *
 *  @param title 标题
 *  @param view  所在视图
 */
-(void)showLoadingWithTitle:(NSString*)title withView:(UIView*)view{
    [self showLodingWithTitle:title message:nil withView:view];
}

/**
 *  加载等待
 *
 *  @param view <#view description#>
 */
-(void)showLoadingWithView:(UIView*)view{
    [self showLodingWithTitle:nil message:nil withView:view];
}

- (void)hiddenHUD{
    // 主线程执行：
    dispatch_async(dispatch_get_main_queue(), ^{
        if (HUD) {
            [HUD hideAnimated:YES];
        }
    });
}

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    [HUD removeFromSuperview];
    HUD = nil;
}

- (void)showMessage:(NSString*)message{
    if (message == nil||message.length == 0) {
        return;
    }
    [self showMessage:message time:1];
}

- (void)showMessageInView:(UIView *)view message:(NSString*)message {
    if (view == nil) {
        return;
    }
    [self showMessageInView:view message:message time:1];
}

- (void)showMessage:(NSString*)message time:(NSInteger)time{
    
    [self showMessageInView:MAIN_WINDOW message:message time:time];
}

- (void)showMessageInView:(UIView *)view message:(NSString*)message time:(NSInteger)time {
    if (StrEmpty(message)) {
        return;
    }
    //移除上次的
    for (UIView *subview in [view subviews]) {
        if (subview.tag == 10000) {
            [subview removeFromSuperview];
        }
    }
    // 主线程执行：
    dispatch_async(dispatch_get_main_queue(), ^{
        UIView *mianView = [[UIView alloc] initWithFrame:view.bounds];
        [mianView setTag:10000];
        UIView *contentView = [[UIView alloc] init];
        [contentView.layer setMasksToBounds:YES];
        [contentView.layer setCornerRadius:5.0];
        [contentView setBackgroundColor:[UIColor clearColor]];
        [mianView addSubview:contentView];
        
        UIView *blackBackView = [[UIView alloc] init];
        [blackBackView setBackgroundColor:[UIColor blackColor]];
        [blackBackView setAlpha:0.7];
        [contentView addSubview:blackBackView];
        
        UILabel *messageLabel = [[UILabel alloc] init];
        [messageLabel setTextColor:[UIColor whiteColor]];
        [messageLabel setBackgroundColor:[UIColor clearColor]];
        [messageLabel setTextAlignment:NSTextAlignmentCenter];
        [messageLabel setFont:[UIFont systemFontOfSize:14]];
        [messageLabel setNumberOfLines:0];
        [messageLabel setText:message];
        [contentView addSubview:messageLabel];
        
        [messageLabel setWidth:messageLabel.textWidth];
        [messageLabel setHeight:messageLabel.textHeight];
        
        [contentView setWidth:messageLabel.width+25];
        [contentView setHeight:messageLabel.height+15];
        [contentView setCenter:CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2)];
        [blackBackView setFrame:contentView.bounds];
        [messageLabel setCenter:CGPointMake(contentView.frame.size.width/2, contentView.frame.size.height/2)];
        
        [view addSubview:mianView];
        
        [UIView animateWithDuration:0.2 animations:^{
            CGAffineTransform transform = CGAffineTransformMakeScale(1.1, 1.1);
            [contentView setTransform:transform];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                CGAffineTransform transform = CGAffineTransformMakeScale(1.0, 1.0);
                [contentView setTransform:transform];
            } completion:^(BOOL finished) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [UIView animateWithDuration:0.2 animations:^{
                        CGAffineTransform transform = CGAffineTransformMakeScale(0.5, 0.5);
                        [contentView setTransform:transform];
                        [contentView setAlpha:0];
                    } completion:^(BOOL finished) {
                        [mianView removeFromSuperview];
                    }];
                });
            }];
        }];
    });
    
}


/**
 计算文字宽度

 @param text <#text description#>
 @param font <#font description#>
 @param height <#height description#>
 @return <#return value description#>
 */
+(CGFloat)textWidth:(NSString*)text font:(UIFont*)font height:(CGFloat)height{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    return [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:
            NSStringDrawingTruncatesLastVisibleLine |
            NSStringDrawingUsesLineFragmentOrigin |
            NSStringDrawingUsesFontLeading attributes:attribute
                                   context:nil].size.width;
}

@end
