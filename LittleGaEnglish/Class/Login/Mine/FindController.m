//
//  FindController.m
//  LittleGaEnglish
//
//  Created by  mac on 16/3/29.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "FindController.h"
#import "Masonry.h"
#import "ShopeController.h"
@interface FindController ()

@end

@implementation FindController
- (void)viewWillAppear:(BOOL)animated{
    self.edgesForExtendedLayout = UIRectEdgeNone;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //界面配置
    [self initializeFace];
}
- (void)initializeFace{
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.title = @"发现";
    //添加商场图片
    UIImageView *shopeImage = [[UIImageView alloc] init];
    shopeImage.userInteractionEnabled = YES;
    [self.view addSubview:shopeImage];
    shopeImage.image = [UIImage imageNamed:@"图层-2"];
    
    //点击商城事件
    UITapGestureRecognizer *tapShop = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickShop:)];
    [shopeImage addGestureRecognizer:tapShop];
    
    //添加自媒体图片
    UIImageView *mediaImage = [[UIImageView alloc] init];
    mediaImage.userInteractionEnabled = YES;
    [self.view addSubview:mediaImage];
    mediaImage.image = [UIImage imageNamed:@"图层-2_67"];
    
    //点击自媒体事件
    UITapGestureRecognizer *tapMedia = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickMedia:)];
    [mediaImage addGestureRecognizer:tapMedia];
    
    WS(weakS);
    [shopeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakS.view);
        make.bottom.equalTo(mediaImage.mas_top);
        
    }];
    [mediaImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(weakS.view);
        make.height.equalTo(shopeImage);
    }];

}
#pragma 点击商场
- (void)clickShop:(UITapGestureRecognizer *)sdeer{
    NSLog(@"商城");
    ShopeController *shope = [[ShopeController alloc] init];
    [self.navigationController pushViewController:shope animated:YES];
    

}
#pragma 点击自媒体
- (void)clickMedia:(UITapGestureRecognizer *)sdeer{
    NSLog(@"自媒体");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
