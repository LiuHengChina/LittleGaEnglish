//
//  zhifushibai.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/4/2.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "zhifushibai.h"

@interface zhifushibai ()

@end

@implementation zhifushibai

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"支付失败";

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)zaicizhifu:(id)sender {
    NSLog(@"再次支付");
}
- (IBAction)zhifushibai:(id)sender {
    NSLog(@"取消支付");
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
