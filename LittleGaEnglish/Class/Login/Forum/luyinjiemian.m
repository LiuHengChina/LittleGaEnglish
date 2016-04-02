//
//  luyinjiemian.m
//  LittleGaEnglish
//
//  Created by 刘璞峰 on 16/3/27.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "luyinjiemian.h"
#import <UAProgressView/UAProgressView.h>
@interface luyinjiemian ()
@property (strong, nonatomic) IBOutlet UAProgressView *previews;
//@property (nonatomic, assign) CGFloat localProgress;
@property (assign,nonatomic) BOOL jindubool;
@property (assign,nonatomic) NSInteger datatime;
@end

@implementation luyinjiemian
- (IBAction)dismissview:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)luyinkaishi:(id)sender {
    self.jindubool = false;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.jindubool = true;
    [self ttttt];
    self.previews.progress = 0;
    self.datatime = 0;
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
    self.previews.didSelectBlock = ^(UAProgressView *progressView){
        _jindubool = !_jindubool;
    };
    // Do any additional setup after loading the view.
}
-(void)ttttt
{
    self.previews.tintColor = [UIColor grayColor];
    self.previews.borderWidth = 0;
    self.previews.lineWidth = 2;
}
- (void)updateProgress:(NSTimer *)timer {
    if (self.jindubool || self.datatime > 180) {
        return;
    }
    self.datatime++;
    NSLog(@"总时长180秒 %ld",(long)self.datatime);
    [self.previews setProgress:(float)self.datatime/180];

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
