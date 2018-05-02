//
//  MBProgressHUD+DZM.m
//  MBProgressHUD+DZM
//
//  Created by 邓泽淼 on 2018/5/2.
//  Copyright © 2018年 邓泽淼. All rights reserved.
//

/// 图片地址
#define HUD_ICON_PATH(icon) [NSString stringWithFormat:@"MBProgressHUD.bundle/%@",icon]

/// 隐藏延迟
#define HUD_HIDE_AFTERDELAY 0.7

/// 默认现实目标视图
#define HUD_TO_VIEW [UIApplication sharedApplication].keyWindow.rootViewController.view

#import "MBProgressHUD+DZM.h"

@implementation MBProgressHUD (DZM)

#pragma MARK 公用HUD对象

/// HUD
+ (nonnull MBProgressHUD *)HUD:(UIView * _Nonnull)view {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.contentColor = [UIColor whiteColor];
    
    hud.bezelView.color = [UIColor blackColor];
    
    return hud;
}

/// HUD - 可附带:自定义View
+ (nonnull MBProgressHUD *)HUD:(UIView * _Nonnull)view customView:(UIView * _Nonnull)customView {
    
    MBProgressHUD *hud = [MBProgressHUD HUD:view];
    
    hud.mode = MBProgressHUDModeCustomView;
    
    hud.customView = customView;
    
    return hud;
}

/// HUD (自动隐藏) - 可附带:文字+图片
+ (nonnull MBProgressHUD *)HUD:(UIView * _Nonnull)view text:(NSString * _Nullable)text icon:(NSString * _Nullable)icon {

    MBProgressHUD *hud = [MBProgressHUD HUD:view customView:[MBProgressHUD Custom_ImageView:icon]];
    
    hud.label.text = text;
    
    [hud hideAnimated:YES afterDelay:HUD_HIDE_AFTERDELAY];
    
    return hud;
}

#pragma MARK CustomView

/// CustomView - ImageView
+ (nonnull UIImageView *)Custom_ImageView:(NSString *)icon {
    
    UIImage *image = [[UIImage imageNamed:icon] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    return imageView;
}

/// CustomView - Right
+ (nonnull UIView *)Custom_Right {
    
    return [MBProgressHUD Custom_ImageView:HUD_ICON_PATH(@"right")];
}

/// CustomView - Error
+ (nonnull UIView *)Custom_Error {
    
    return [MBProgressHUD Custom_ImageView:HUD_ICON_PATH(@"error")];
}

#pragma MARK Success

/// Success
+ (nonnull MBProgressHUD *)showSuccess:(NSString * _Nullable )message {
    
    return [MBProgressHUD showSuccess:message toView:HUD_TO_VIEW];
}

/// Success - 可附带:文字
+ (nonnull MBProgressHUD *)showSuccess:(NSString * _Nullable)message toView:(UIView * _Nonnull)view {
    
    return [MBProgressHUD HUD:view text:message icon:HUD_ICON_PATH(@"right")];
}

#pragma MARK Error

/// Error
+ (nonnull MBProgressHUD *)showError:(NSString * _Nullable)message {
    
    return [MBProgressHUD showError:message toView:HUD_TO_VIEW];
}

/// Error - 可附带:文字
+ (nonnull MBProgressHUD *)showError:(NSString * _Nullable)message toView:(UIView * _Nonnull)view {
    
    return [MBProgressHUD HUD:view text:message icon:HUD_ICON_PATH(@"error")];
}

#pragma MARK Message

/// Message - 可附带:文字
+ (nonnull MBProgressHUD *)showMessage:(NSString * _Nullable)message {
    
    return [MBProgressHUD showMessage:message toView:HUD_TO_VIEW];
}

/// Message - 可附带:文字
+ (nonnull MBProgressHUD *)showMessage:(NSString * _Nullable)message toView:(UIView * _Nonnull)view {
    
    return [MBProgressHUD showMessage:message offset:CGPointZero toView:view];
}

/// Message - 可附带:文字+偏移调整
+ (nonnull MBProgressHUD *)showMessage:(NSString * _Nullable)message offset:(CGPoint)offset toView:(UIView * _Nonnull)view {
    
    MBProgressHUD *hud = [MBProgressHUD HUD:view];
    
    hud.mode = MBProgressHUDModeText;
    
    hud.label.text = message;
   
    hud.offset = offset; // 例子: CGPointMake(0.f, MBProgressMaxOffset)
    
    [hud hideAnimated:YES afterDelay:HUD_HIDE_AFTERDELAY];
    
    return hud;
}

#pragma MARK Loading

/// Loading (MBProgressHUDModeIndeterminate) - 可附带:文字
+ (nonnull MBProgressHUD *)showLoading:(NSString * _Nullable)message {
    
    return [MBProgressHUD showLoading:message toView:HUD_TO_VIEW];
}

/// Loading (MBProgressHUDModeIndeterminate) - 可附带:文字
+ (nonnull MBProgressHUD *)showLoading:(NSString * _Nullable)message toView:(UIView * _Nonnull)view {
    
    MBProgressHUD *tempHUD = [MBProgressHUD HUD:view];;
    
    tempHUD.label.text = message;
    
    return tempHUD;
}

#pragma MARK Hide

/// Hide
+ (void)hide {
    
    [MBProgressHUD hide:HUD_TO_VIEW];
}

/// Hide
+ (void)hide:(UIView * _Nonnull)view {
    
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
