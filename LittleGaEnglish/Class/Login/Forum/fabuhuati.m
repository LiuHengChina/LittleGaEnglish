//
//  fabuhuati.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/18.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "fabuhuati.h"
#import "GCPlaceholderTextView.h"
#import "xuanzeimage.h"
#import "luyinjiemian.h"
#import "MyApiLunTan.h"
#import "huati.h"

@interface fabuhuati ()
@property (strong, nonatomic) IBOutlet GCPlaceholderTextView *shuodinshenme;
@property (strong, nonatomic) IBOutlet UITextField *huatititle;
@property (strong, nonatomic) IBOutlet UILabel *di25tiandaka;
@property (nonatomic, copy) NSString *urlStr; // 图片url
@property (nonatomic, copy) NSString *voice_id; // 语音文件id

@end

@implementation fabuhuati

- (void)viewDidLoad {
    [super viewDidLoad];
    self.shuodinshenme.placeholderColor = [UIColor colorWithRed:187.0/255.0f green:187.0/255.0f blue:187.0/255.0f alpha:1];
    self.shuodinshenme.placeholder = NSLocalizedString(@"说点什么...",);
    // Do any additional setup after loading the view.
}
- (IBAction)xuanzehuati:(id)sender {
    NSLog(@"选择话题");
    
    huati *huatiVC = [[UIStoryboard storyboardWithName:@"luntan" bundle:nil]instantiateViewControllerWithIdentifier:@"huati"];
    WS(wself);
    huatiVC.selectBlock = ^(HotTopicModel *model){
        wself.huatititle.text = model.topic_name;
        [self.navigationController popViewControllerAnimated:YES];
    };
    [self.navigationController pushViewController:huatiVC animated:YES];

    
}
- (IBAction)luyin:(id)sender {
    [self performSegueWithIdentifier:@"luyinaaaaaaa" sender:self];
}
- (IBAction)tupin:(id)sender {
    [self performSegueWithIdentifier:@"tupiantwo" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WS(wself);
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:@"tupiantwo"]) {
        ((xuanzeimage *)segue.destinationViewController).callback = ^(UIImage *image) {
            NSLog(@"imageaaaaaaaa在这里%@",image);
            [SVProgressHUD show];
            [[MyApiLunTan share] sendRequestOpenNewShopOnlineWithPicture:image Success:^(MyApiLunTan *request, ImageModel *model) {
                wself.urlStr = model.url;
                [SVProgressHUD showSuccessWithStatus:@"上传成功"];
            } Failure:^(MyApiLunTan *request, NSError *error) {
                [WDTipsView showTipsViewWithString:error.domain];
                [SVProgressHUD showErrorWithStatus:error.domain];
            }];
        };
    } else if([segue.identifier isEqualToString:@"luyinaaaaaaa"]){
        ((luyinjiemian *)segue.destinationViewController).dataBlock = ^(VoiceModel *model){
            wself.voice_id = model.voice_id;
        };
    }
}

- (IBAction)fabuBtnAction:(id)sender {
    [SVProgressHUD show];
    [[MyApiLunTan share] upTopicWithTitle:self.huatititle.text content:self.shuodinshenme.text urlStr:self.urlStr vocie_id:self.voice_id flash_url:nil Success:^(MyApiLunTan *request) {
        [SVProgressHUD showSuccessWithStatus:@"发布成功"];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } Failure:^(MyApiLunTan *request, NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.domain];
    }];
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
