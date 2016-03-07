//
//  BBLoginViewController.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/16.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BBLoginViewController.h"
#import "BBLoginView.h"
#import "BBRegisterView.h"

@interface BBLoginViewController ()

@property (strong, nonatomic) IBOutlet UIView *defaultView;

@property (strong, nonatomic) IBOutlet UISegmentedControl *changeSegment;

@property (nonatomic, strong) BBLoginView *loginView;

@property (nonatomic, strong) BBRegisterView *registerView;

@end

@implementation BBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.changeSegment setTintColor:[UIColor clearColor]];
    [self.changeSegment setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    self.loginView = [BBLoginView new];
    [self.defaultView addSubview:_loginView];
    [_loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(@0);
    }];
    
    self.registerView = [BBRegisterView new];
    [self.defaultView addSubview:_registerView];
    [_registerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(@0);

    }];
    _loginView.hidden = YES;
    _registerView.hidden = YES;
    _loginView.VC = self;
    _registerView.VC = self;
    self.selectIndex = self.selectIndex;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)closeBtnAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)changeAction:(UISegmentedControl *)sender {
    self.selectIndex = sender.selectedSegmentIndex;
}

- (void)setSelectIndex:(NSInteger)selectIndex
{
    _selectIndex = selectIndex;
    switch (selectIndex) {
        case 0:
        {
            _loginView.hidden = YES;
            _registerView.hidden = NO;
        }
            break;
        case 1:
        {
            _loginView.hidden = NO;
            _registerView.hidden = YES;
        }
            break;
        default:
            break;
    }
}




@end
