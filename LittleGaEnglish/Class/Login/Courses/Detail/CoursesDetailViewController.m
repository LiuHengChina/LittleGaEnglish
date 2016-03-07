//
//  CoursesDetailViewController.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/27.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "CoursesDetailViewController.h"
#import "CoursesDetailView.h"
#import "CoursesDetailBobyiewController.h"
#import "MYApiCourese.h"
#import "BBLoginViewController.h"
#import "BuyViewController.h"

@interface CoursesDetailViewController ()

@property (nonatomic, strong) CoursesDetailView *rootView;
@property (nonatomic, strong) CoursesDetailBobyiewController *bobyVC;
@property (nonatomic, strong) CourseDetailModel *model;

@end

@implementation CoursesDetailViewController

- (void)loadView
{
    self.rootView = [[CoursesDetailView alloc]init];;
    self.view = _rootView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    [self setCustomNavLeftBarButton:nil responderBlcok:nil];
    [self getData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpView
{
    self.bobyVC = [CoursesDetailBobyiewController new];
    _bobyVC.classId = self.courseID;
    [self addChildViewController:_bobyVC];
    [_rootView.defaultView addSubview:_bobyVC.view];
    
    [_rootView.loveBtn addTarget:self action:@selector(loveBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [_rootView.favouruteBtn addTarget:self action:@selector(favouriteBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [_rootView.buyBtn addTarget:self action:@selector(buyBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)loveBtnAction
{
    if (![self isLogin]) {
        return;
    }
    if ([self.model.courseClass.is_can_like isEqualToString:@"1"]) {
        [[MYApiCourese share]sendRequestLikeClassWithClassID:self.courseID Success:^(MYApiCourese *request, BaseModel *model) {
            
            [WDTipsView showTipsViewWithString:@"收藏成功"];
        } Failure:^(MYApiCourese *request, NSError *requestError) {
            
        }];
    } else {
        [WDTipsView showTipsViewWithString:@"请勿重复点赞！"];
    }
}

- (void)favouriteBtnAction
{
    if (![self isLogin]) {
        return;
    }
    if ([self.model.courseClass.is_can_favorite isEqualToString:@"1"]) {
        [[MYApiCourese share]sendRequestFavouriteClassWithClassID:self.courseID Success:^(MYApiCourese *request, BaseModel *model) {
            
            [WDTipsView showTipsViewWithString:@"收藏成功"];
        } Failure:^(MYApiCourese *request, NSError *requestError) {
       
        }];
    } else {
        [WDTipsView showTipsViewWithString:@"您已经收藏！"];
    }
}

- (void)buyBtnAction
{
    if (![self isLogin]) {
        return;
    }
    if ([self.model.courseClass.is_can_order isEqualToString:@"1"]) {
        BuyViewController *buyVC = [BuyViewController new];
        buyVC.classID = self.courseID;
        [self.navigationController pushViewController:buyVC animated:YES];
    }
}

- (BOOL)isLogin
{
    if ([UserDao share].isLogin) {
        return YES;
    } else {
        BBLoginViewController *loginVC = [BBLoginViewController new];
        loginVC.selectIndex = 1;
        [self presentViewController:loginVC animated:YES completion:nil];
    }
    return NO;
}

- (void)getData
{
    [[MYApiCourese share]sendRequestWithClassID:self.courseID Success:^(MYApiCourese *request, CourseDetailModel *model) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [_rootView.titleImageView sd_setImageWithURL:[NSURL URLWithString:model.courseClass.cover_url] placeholderImage:nil completed:nil];
            _bobyVC.model = model;
            self.model = model;
        });
    } Failure:^(MYApiCourese *request, NSError *requestError) {
        
    }];
}

@end
