//
//  fabutiezi.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/18.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "fabutiezi.h"
#import "GCPlaceholderTextView.h"
#import "xuanzeimage.h"
#import "MyApiLunTan.h"
#import "luyinjiemian.h"
#import "weiba.h"
@interface fabutiezi ()

@property (strong, nonatomic) IBOutlet UITextField *tizitext;
@property (strong, nonatomic) IBOutlet GCPlaceholderTextView *neirong;
@property (strong, nonatomic) IBOutlet UITextField *zaixiandizhitext;
@property (assign, nonatomic) BOOL shipinbool;
@property (strong, nonatomic) IBOutlet UIView *viewshipin;

@property (nonatomic, copy) NSString *urlStr; // 图片url
@property (nonatomic, copy) NSString *voice_id; // 语音文件id
@property (nonatomic, copy) NSString *flash_url; // 视频文件的url地址
@property (nonatomic, copy) NSString *weiba_id; // 所属微吧id
@property (strong, nonatomic) IBOutlet UILabel *weiba_name;

@end

@implementation fabutiezi

- (void)viewDidLoad {
    [super viewDidLoad];
    self.neirong.placeholderColor = [UIColor colorWithRed:187.0/255.0f green:187.0/255.0f blue:187.0/255.0f alpha:1];
    self.shipinbool = true;
    self.viewshipin.hidden = YES;
    self.neirong.placeholder = NSLocalizedString(@"说点什么...",);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)luyinaaa:(id)sender {
    [self performSegueWithIdentifier:@"luyinaaa" sender:self];
}
- (IBAction)fabu:(id)sender {
    NSLog(@"fabu");
    [SVProgressHUD show];
    [[MyApiLunTan share]upThreadWithTitle:self.tizitext.text content:self.neirong.text weiba_id:self.weiba_id urlStr:self.urlStr vocie_id:self.voice_id flash_url:self.zaixiandizhitext.text Success:^(MyApiLunTan *request) {
        [SVProgressHUD showSuccessWithStatus:@"发布成功"];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } Failure:^(MyApiLunTan *request, NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
    
}
- (IBAction)tupian:(id)sender {
    [self performSegueWithIdentifier:@"imageaaa" sender:self];
}
- (IBAction)shipin:(id)sender {
    if (self.shipinbool) {
        self.shipinbool = false;
        self.viewshipin.hidden = false;
    } else {
        self.shipinbool = true;
        self.viewshipin.hidden = YES;
    }
}
- (IBAction)chooseWeiBaAction:(id)sender {
    weiba *weibaVC = [[UIStoryboard storyboardWithName:@"luntan" bundle:nil]instantiateViewControllerWithIdentifier:@"weiba"];
    WS(wself);
    weibaVC.selectBlock = ^(HotWeibaModel *model){
        wself.weiba_id = model.weiba_id;
        wself.weiba_name.text = model.weiba_name;
        [self.navigationController popViewControllerAnimated:YES];
    };
    [self.navigationController pushViewController:weibaVC animated:YES];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WS(wself);
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:@"imageaaa"]) {
        ((xuanzeimage *)segue.destinationViewController).callback = ^(UIImage *image) {
            NSLog(@"image在这里%@",image);
            [SVProgressHUD show];
            [[MyApiLunTan share] sendRequestOpenNewShopOnlineWithPicture:image Success:^(MyApiLunTan *request, ImageModel *model) {
                wself.urlStr = model.url;
                [SVProgressHUD showSuccessWithStatus:@"上传成功"];
            } Failure:^(MyApiLunTan *request, NSError *error) {
                [WDTipsView showTipsViewWithString:error.domain];
                [SVProgressHUD showErrorWithStatus:error.domain];
            }];
        };
    } else if([segue.identifier isEqualToString:@"luyinaaa"]){
        ((luyinjiemian *)segue.destinationViewController).dataBlock = ^(VoiceModel *model){
            wself.voice_id = model.voice_id;
        };
    }
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
