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
@interface fabuhuati ()
@property (strong, nonatomic) IBOutlet GCPlaceholderTextView *shuodinshenme;
@property (strong, nonatomic) IBOutlet UITextField *huatititle;
@property (strong, nonatomic) IBOutlet UILabel *di25tiandaka;

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
}
- (IBAction)luyin:(id)sender {
    [self performSegueWithIdentifier:@"luyinaaaaaaa" sender:self];
}
- (IBAction)tupin:(id)sender {
    [self performSegueWithIdentifier:@"tupiantwo" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:@"tupiantwo"]) {
        ((xuanzeimage *)segue.destinationViewController).callback = ^(UIImage *image) {
            NSLog(@"imageaaaaaaaa在这里%@",image);
        };
    }
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
