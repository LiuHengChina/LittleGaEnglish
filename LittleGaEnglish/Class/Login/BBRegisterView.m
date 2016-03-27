//
//  BBRegisterView.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/17.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BBRegisterView.h"
#import "MyApiLogin.h"
#import "AppDelegate.h"
#import "ReactiveCocoa.h"


@interface BBRegisterView ()

@property (nonatomic, strong)UITextField *phoneText;
@property (nonatomic, strong)UITextField *codeText;
@property (nonatomic, strong)UITextField *pwdText;
@property (nonatomic, assign) BOOL isAccept;    // 是否同意
@property (nonatomic, strong) UIImageView *image;

@end

@implementation BBRegisterView

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
    self.isAccept = YES;
    self.backgroundColor = [UIColor clearColor];
    UIImageView *defaultImage = [UIImageView new];
    defaultImage.userInteractionEnabled = YES;
    [self addSubview:defaultImage];
    defaultImage.image = [UIImage imageNamed:@"register_defaut"];
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
    _phoneText.font = [UIFont systemFontOfSize:11];
    _phoneText.keyboardType = UIKeyboardTypeNumberPad;
    
    [_phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(scales(84)));
        make.centerX.equalTo(defaultImage.mas_centerX);
        make.width.equalTo(@(scales(671)));
        make.height.equalTo(@(scales(66)));
    }];
    
    
    UIButton *codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [defaultImage addSubview:codeBtn];
    [codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_phoneText.mas_right);
        make.top.equalTo(_phoneText.mas_bottom).offset(scales(18));
        make.height.equalTo(@(scales(66)));
        make.width.equalTo(@(scales(198)));
    }];
    [codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [codeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [codeBtn addTarget:self action:@selector(getCodeBtn:) forControlEvents:UIControlEventTouchUpInside];
    codeBtn.backgroundColor = [UIColor grayColor];
    codeBtn.titleLabel.font = [UIFont systemFontOfSize:kFontSize_ConstSmall];

    
    
    
    self.codeText = [UITextField new];
    [defaultImage addSubview:_codeText];
    UIImageView *codeImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iconfont-yanzhengma"]];
    codeImage.frame = CGRectMake(0, 0, 20, 20);
    _codeText.leftView = codeImage;
    _codeText.borderStyle = UITextBorderStyleLine;
    _codeText.leftViewMode = UITextFieldViewModeAlways;
    _codeText.placeholder = @"请输入验证码";
    _codeText.font = [UIFont systemFontOfSize:11];
    _codeText.keyboardType = UIKeyboardTypeNumberPad;
    [_codeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneText.mas_bottom).offset(scales(18));
        make.left.equalTo(_phoneText.mas_left);
        make.right.equalTo(codeBtn.mas_left).offset(-scales(24));
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
    _pwdText.font = [UIFont systemFontOfSize:11];
    [_pwdText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_codeText.mas_bottom).offset(scales(18));
        make.centerX.equalTo(defaultImage.mas_centerX);
        make.width.equalTo(_phoneText.mas_width);
        make.height.equalTo(_phoneText.mas_height);
    }];
    
    
    self.image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"check"]];
    [defaultImage addSubview:_image];
    _image.userInteractionEnabled = YES;
    [_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_pwdText.mas_left);
        make.top.equalTo(_pwdText.mas_bottom).offset(scales(36));
    }];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(checkBtnAction)];
    [_image addGestureRecognizer:tap];
    
    
    UILabel *lab = [UILabel new];
    [defaultImage addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_image.mas_right).offset(10);
        make.centerY.equalTo(_image.mas_centerY);
    }];
    lab.text = @"同意";
    lab.font = [UIFont systemFontOfSize:kFontSize_ConstSmall];
    
    UIButton *deleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [defaultImage addSubview:deleBtn];
    [deleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lab.mas_right).offset(10);
        make.centerY.equalTo(_image.mas_centerY);
    }];
    [deleBtn setTitle:@"《服务使用协议》" forState:UIControlStateNormal];
    [deleBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [deleBtn addTarget:self action:@selector(delegateBtn) forControlEvents:UIControlEventTouchUpInside];
    deleBtn.titleLabel.font = [UIFont systemFontOfSize:kFontSize_ConstSmall];
    

    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [defaultImage addSubview:registerBtn];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(defaultImage.mas_centerX);
        make.top.equalTo(deleBtn.mas_bottom).offset(scales(50));
        make.width.equalTo(@(scales(630)));
    }];
    [registerBtn setTitle:@"登录" forState:UIControlStateNormal];
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(registerBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [registerBtn setBackgroundColor:RGBA(54, 171, 241, 1)];
    registerBtn.layer.cornerRadius = 5;
    registerBtn.layer.masksToBounds = YES;

}


- (void)getCodeBtn:(UIButton *)sender
{
    [self buttonTime:sender];
    [[MyApiLogin share] sendCodeByPhone:self.phoneText.text sendType:@"1" Success:^(MyApiLogin *request) {
        [WDTipsView showTipsViewWithString:@"发送成功"];
    } Failure:^(MyApiLogin *request, NSError *requestError) {
        [WDTipsView showTipsViewWithString:requestError.domain];
    }];
}


-(void)buttonTime:(UIButton *)sender
{

    //多线程控制按钮倒计时
    @weakify(self)
    __block int timeout=60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                sender.enabled = NO;
                sender.userInteractionEnabled = YES;
                [sender setTitle:@"获取验证码" forState:UIControlStateNormal];
                dispatch_suspend(_timer);
            });
        }else{
            int seconds = timeout % 120;
            NSString *strTime = [NSString stringWithFormat:@"%.1d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                sender.enabled = YES;
                sender.userInteractionEnabled = NO;
                [sender setTitle:[NSString stringWithFormat:@"%d秒后发送", timeout]forState:UIControlStateNormal];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}



- (void)checkBtnAction
{
    if (self.isAccept) {
        self.image.image = [UIImage imageNamed:@"check_select"];
    } else {
        self.image.image = [UIImage imageNamed:@"check"];
    }
    self.isAccept = !_isAccept;
}

- (void)delegateBtn{
    
}

- (void)registerBtnAction
{
    [[MyApiLogin share] registerWithPhone:_phoneText.text pwd:_pwdText.text code:_codeText.text Success:^(MyApiLogin *request, LoginModel *model) {
        NSLog(@"%@",model.token);
        AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
        [app changeTabBar];
    } Failure:^(MyApiLogin *request, NSError *requestError) {
        NSLog(@"%@", requestError);
    }];
    
}

@end
