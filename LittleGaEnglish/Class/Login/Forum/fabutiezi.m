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
@interface fabutiezi ()
@property (strong, nonatomic) IBOutlet UILabel *tiezititle;
@property (strong, nonatomic) IBOutlet GCPlaceholderTextView *neirong;
@property (strong, nonatomic) IBOutlet UITextField *zaixiandizhitext;
@property (assign, nonatomic) BOOL shipinbool;
@property (strong, nonatomic) IBOutlet UIView *viewshipin;
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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:@"imageaaa"]) {
        ((xuanzeimage *)segue.destinationViewController).callback = ^(UIImage *image) {
            NSLog(@"image在这里%@",image);
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
