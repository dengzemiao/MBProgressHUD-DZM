//
//  ViewController.m
//  MBProgressHUD+DZM
//
//  Created by 邓泽淼 on 2018/5/2.
//  Copyright © 2018年 邓泽淼. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD+DZM.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (IBAction)success:(UIButton *)sender {
   
    [MBProgressHUD showSuccess:@"Success"];
}

- (IBAction)error:(UIButton *)sender {
    
    [MBProgressHUD showError:@"Error"];
}

- (IBAction)message:(UIButton *)sender {
    
    [MBProgressHUD showMessage:@"Message"];
}

- (IBAction)loading:(UIButton *)sender {
    
    [MBProgressHUD showLoading:@"Loading"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [MBProgressHUD hide];
    });
}

@end
