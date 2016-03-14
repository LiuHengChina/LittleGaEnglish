//
//  zhifujiemian.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/9.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "zhifujiemian.h"

@interface zhifujiemian ()
@property (strong, nonatomic) IBOutlet UILabel *dingdanjine;
@property (strong, nonatomic) IBOutlet UILabel *dingdangbianhao;
@property (strong, nonatomic) IBOutlet UILabel *zhifuzhuangtai;
@property (strong, nonatomic) IBOutlet UILabel *goumaishijian;
@property (strong, nonatomic) IBOutlet UILabel *shangpinjiage;
@property (strong, nonatomic) IBOutlet UILabel *shangpinmingcheng;
@property (strong, nonatomic) IBOutlet UILabel *youhuijuandikou;
@property (strong, nonatomic) IBOutlet UILabel *kafeidoudikou;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *widht;

@end

@implementation zhifujiemian

- (void)viewDidLoad {
    [super viewDidLoad];
    self.widht.constant = self.view.frame.size.width/2;
    self.title = @"订单详情";
    NSLog(@"商品id ：%ld",self.orderid);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)quxiaodingdan:(id)sender {
    
    
}
- (IBAction)jixuzhifu:(id)sender {
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
