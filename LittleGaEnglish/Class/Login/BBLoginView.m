//
//  BBLoginView.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/17.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BBLoginView.h"
#import "MyApiLogin.h"
#import "AppDelegate.h"
@interface BBLoginView ()

@property (nonatomic, strong) UITextField *phoneText;
@property (nonatomic, strong) UITextField *pwdText;

@end

@implementation BBLoginView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addAllViews];
    }
    return self;
}


- (void)addAllViews
{
    self.backgroundColor = [UIColor clearColor];
    UIImageView *defaultImage = [UIImageView new];
    defaultImage.userInteractionEnabled = YES;
    [self addSubview:defaultImage];
    defaultImage.image = [UIImage imageNamed:@"login_default"];
    [defaultImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(@0);
        make.top.equalTo(@0);
    }];
    
    self.phoneText = [UITextField new];
    [defaultImage addSubview:_phoneText];
    UIImageView *phoneImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iconfont-iconfontshouji"]];
    phoneImage.frame = CGRectMake(0, 0, 20, 20);
    _phoneText.leftView = phoneImage;
    _phoneText.borderStyle = UITextBorderStyleLine;
    _phoneText.leftViewMode = UITextFieldViewModeAlways;
    _phoneText.placeholder = @"请输入手机号";
    _phoneText.keyboardType = UIKeyboardTypeNumberPad;
    
    [_phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(scales(56)));
        make.centerX.equalTo(defaultImage.mas_centerX);
        make.width.equalTo(@(scales(671)));
        make.height.equalTo(@(scales(66)));
    }];
    
    self.pwdText = [UITextField new];
    [defaultImage addSubview:_pwdText];
    UIImageView *pwdImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iconfont-mima"]];
    pwdImage.frame = CGRectMake(0, 0, 20, 20);
    _pwdText.leftView = pwdImage;
    _pwdText.borderStyle = UITextBorderStyleLine;
    _pwdText.leftViewMode = UITextFieldViewModeAlways;
    _pwdText.placeholder = @"请输入6-20位密码";
    [_pwdText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneText.mas_bottom).offset(scales(20));
        make.centerX.equalTo(defaultImage.mas_centerX);
        make.width.equalTo(_phoneText.mas_width);
        make.height.equalTo(_phoneText.mas_height);
    }];
    
    UIButton *forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [defaultImage addSubview:forgetBtn];
    [forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_pwdText.mas_right);
        make.top.equalTo(_pwdText.mas_bottom).offset(scales(28));
    }];
    [forgetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:RGBA(88, 88, 88, 1) forState:UIControlStateNormal];
    [forgetBtn addTarget:self action:@selector(forgetBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:kFontSize_ConstSmall];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [defaultImage addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(defaultImage.mas_centerX);
        make.top.equalTo(forgetBtn.mas_bottom).offset(scales(20));
        make.width.equalTo(@(scales(630)));
    }];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setBackgroundColor:RGBA(54, 171, 241, 1)];
    loginBtn.layer.cornerRadius = 5;
    loginBtn.layer.masksToBounds = YES;
    
    
    UILabel *thirdLab = [UILabel new];
    [defaultImage addSubview:thirdLab];
    [thirdLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(defaultImage.mas_centerX);
        make.top.equalTo(loginBtn.mas_bottom).offset(scales(52));
    }];
    thirdLab.text = @"使用第三方登录";
    thirdLab.textColor = RGBA(181, 181, 181, 1);
//    
    UIView *line1 = [UIView new];
    [defaultImage addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(thirdLab.mas_left).offset(-1);
        make.centerY.equalTo(thirdLab.mas_centerY);
        make.width.equalTo(@(scales(149)));
        make.height.equalTo(@1);
    }];
    line1.backgroundColor = RGBA(181, 181, 181, 1);
    
    UIView *line2 = [UIView new];
    [defaultImage addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(thirdLab.mas_right).offset(1);
        make.centerY.equalTo(thirdLab.mas_centerY);
        make.width.equalTo(@(scales(149)));
        make.height.equalTo(@1);
    }];
    line2.backgroundColor = RGBA(181, 181, 181, 1);
    
    UIButton *weixinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [defaultImage addSubview:weixinBtn];
    [weixinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(thirdLab.mas_bottom).offset(scales(30));
        make.centerX.equalTo(defaultImage.mas_centerX);
    }];
    [weixinBtn setBackgroundImage:[UIImage imageNamed:@"weixin"] forState:UIControlStateNormal];
    
    UIButton *qqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [defaultImage addSubview:qqBtn];
    [qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(thirdLab.mas_bottom).offset(scales(30));
        make.right.equalTo(weixinBtn.mas_left).offset(scales(-40));
    }];
    [qqBtn setBackgroundImage:[UIImage imageNamed:@"qq"] forState:UIControlStateNormal];
    
    UIButton *sinaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [defaultImage addSubview:sinaBtn];
    [sinaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(thirdLab.mas_bottom).offset(scales(30));
        make.left.equalTo(weixinBtn.mas_right).offset(scales(40));
    }];
    [sinaBtn setBackgroundImage:[UIImage imageNamed:@"weibo"] forState:UIControlStateNormal];
    
    //TODO 缺少第三方登录绑定方法
}


- (void)forgetBtnAction:(UIButton *)sender
{
    
}

- (void)loginBtnAction:(UIButton *)sender
{
    [[MyApiLogin share] sendRequestWithPhone:_phoneText.text pwd:_pwdText.text Success:^(MyApiLogin *request, LoginModel *model) {
        NSLog(@"%@",model.token);
        AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [app changeTabBar];
    } Failure:^(MyApiLogin *request, NSError *requestError) {
        NSLog(@"%@",requestError);
    }];
}


@end
