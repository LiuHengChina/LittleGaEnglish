//
//  comentpost.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/4/3.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "comentpost.h"
#import <UAProgressView/UAProgressView.h>

@interface comentpost ()
@property (strong, nonatomic) IBOutlet UAProgressView *proess;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *jianpangaodu;
@property (assign,nonatomic) BOOL jindubool;
@property (assign,nonatomic) NSInteger datatime;


@property (strong, nonatomic) IBOutlet NSLayoutConstraint *kuandu;
@property (strong, nonatomic) IBOutlet UIScrollView *scroller;
@property (strong, nonatomic) IBOutlet UITextField *pingluntext;
@end

@implementation comentpost
- (IBAction)dianjiluzhidaanniu:(id)sender {
    NSLog(@"录制开始");
    self.jindubool = false;

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.pingluntext becomeFirstResponder];// 2
}
- (IBAction)fabuanniu:(id)sender {
    NSLog(@"fabu");
}
- (IBAction)luyinanniu:(id)sender {
    [self.pingluntext resignFirstResponder];
}

- (IBAction)dianjiluzhi:(id)sender {
    NSLog(@"点击录制");
}
- (IBAction)chongxinluzhi:(id)sender {
    NSLog(@"重新录制");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jindubool = true;

    self.kuandu.constant = self.view.frame.size.width*2;
    [self ttttt];
    self.proess.progress = 0;
    self.proess = 0;
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
    self.proess.didSelectBlock = ^(UAProgressView *progressView){
        _jindubool = !_jindubool;
    };
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self
                    selector:@selector(keyboardWasShown:)
     
                                                 name:UIKeyboardDidShowNotification object:nil];
}
-(void)ttttt
{
    self.proess.tintColor = [UIColor grayColor];
    self.proess.borderWidth = 0;
    self.proess.lineWidth = 2;
}
- (void)updateProgress:(NSTimer *)timer {
    if (self.jindubool || self.datatime > 180) {
        return;
    }
    self.datatime++;
    NSLog(@"总时长180秒 %ld",(long)self.datatime);
    [self.proess setProgress:(float)self.datatime/180];
    
}
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    //kbSize即為鍵盤尺寸 (有width, height)
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到鍵盤的高度
    NSLog(@"hight_hitht:%f",kbSize.height);
    self.jianpangaodu.constant = self.view.frame.size.height - kbSize.height - 20;
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
