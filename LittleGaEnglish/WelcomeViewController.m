//
//  WelcomeViewController.m
//  LittleGaEnglish
//
//  Created by mac on 16/3/30.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "WelcomeViewController.h"
#import "ViewController.h"
#import "BBLoginViewController.h"
#import "AppDelegate.h"

@interface WelcomeViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic)UIScrollView *scrollView;
@property(nonatomic,strong)NSArray *imageNames;
@property(nonatomic,strong)UIButton *registerButton;
@property(nonatomic,strong)UIButton *loginButton;

@end

@implementation WelcomeViewController
-(UIButton *)registerButton{
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerButton.frame = CGRectMake(0, self.view.bounds.size.height-100, self.view.frame.size.width/2, 100);
//        _registerButton.backgroundColor = [UIColor whiteColor];
//        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
//        [_registerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }
    return _registerButton;
}
-(UIButton *)loginButton{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.frame = CGRectMake(self.view.frame.size.width/2, self.view.bounds.size.height-100, self.view.frame.size.width/2, 100);
//        _loginButton.backgroundColor = [UIColor whiteColor];
//        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
//        [_loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    }
    return _loginButton;
}

-(NSArray *)imageNames{
    if (!_imageNames) {
        _imageNames = @[@"start_1",@"start_2",@"start_3"];
    }
    return _imageNames;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-100)];
    self.scrollView.backgroundColor = [UIColor redColor];
    for (int i = 0; i < self.imageNames.count; i ++) {
        UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.imageNames[i]]];
        CGRect rect = self.view.bounds;
        rect.origin.x = i * rect.size.width;
        imageV.frame = rect;
        [self.scrollView addSubview:imageV];
        
        if (i == self.imageNames.count - 1) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = rect;
            [self.scrollView addSubview:button];
            [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        }
        self.scrollView.contentSize = CGSizeMake(self.imageNames.count * self.view.frame.size.width, 0);
        self.scrollView.pagingEnabled = YES;
    }
    [self.view addSubview:_scrollView];
    
    UIPageControl *pageControl = [UIPageControl new];
    pageControl.numberOfPages = self.imageNames.count;
    pageControl.center = CGPointMake(self.view.center.x, self.view.frame.size.height - 168);
    self.scrollView.delegate = self;
    pageControl.pageIndicatorTintColor = [UIColor darkGrayColor];
    pageControl.currentPageIndicatorTintColor=[UIColor blackColor];
    pageControl.tag = 100;
    [self.view addSubview:pageControl];
    
    self.registerButton.backgroundColor = [UIColor whiteColor];
    [self.registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.registerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.registerButton addTarget:self action:@selector(pushRegister:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];
    
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.loginButton.backgroundColor = [UIColor whiteColor];
    [self.loginButton addTarget:self action:@selector(pushLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offSet = scrollView.contentOffset;
    NSInteger index = round(offSet.x/scrollView.frame.size.width);
    UIPageControl *page = (UIPageControl*)[self.view viewWithTag:100];
    page.currentPage = index;
}
- (void)click:(id)sender{//切换根试图控制器
    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    app.window.rootViewController = [[ViewController alloc]init];
}
- (void)pushRegister:(id)sender {//跳转注册页面
    BBLoginViewController *loginVC = [BBLoginViewController new];
    loginVC.selectIndex = 0;
    [self presentViewController:loginVC animated:NO completion:nil];
}
- (void)pushLogin:(id)sender {//跳转登录页面
    BBLoginViewController *loginVC = [BBLoginViewController new];
    loginVC.selectIndex = 1;
    [self presentViewController:loginVC animated:NO completion:nil];
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
