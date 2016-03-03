//
//  HomeViewController.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/18.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "HomeViewController.h"
#import "MyUITableView.h"
#import "HomeTableViewCell.h"
#import "ImagePlayerView.h"



@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,ImagePlayerViewDelegate>

@property (nonatomic, strong) MyUITableView *tableView;

@property (nonatomic, strong) NSArray *imageURLs;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    
    self.tableView = [[MyUITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(@0);
    }];
    
    
    self.imageURLs = @[[NSURL URLWithString:@"http://www.ghzw.cn/wzsq/UploadFiles_9194/201109/20110915154150869.bmp"],
                       [NSURL URLWithString:@"http://sudasuta.com/wp-content/uploads/2013/10/10143181686_375e063f2c_z.jpg"],
                       [NSURL URLWithString:@"http://www.yancheng.gov.cn/ztzl/zgycddhsdgy/xwdt/201109/W020110902584601289616.jpg"],
                       [NSURL URLWithString:@"http://fzone.oushinet.com/bbs/data/attachment/forum/201208/15/074140zsb6ko6hfhzrb40q.jpg"]];
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 115)];
    ImagePlayerView *imagePlayerView = [[ImagePlayerView alloc]initWithFrame:headerView.bounds];
    [headerView addSubview:imagePlayerView];
    [imagePlayerView initWithCount:self.imageURLs.count delegate:self];
    imagePlayerView.scrollInterval = 5.0f;
    
    // adjust pageControl position
    imagePlayerView.pageControlPosition = ICPageControlPosition_BottomLeft;
    
    // hide pageControl or not
    imagePlayerView.hidePageControl = NO;
    
    self.tableView.tableHeaderView = headerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"IdentifierCell";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"HomeTableViewCell" owner:nil options:nil];
        cell= nibs.firstObject;
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}


#pragma mark - ImagePlayerViewDelegate
- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index
{

    [imageView sd_setImageWithURL:[self.imageURLs objectAtIndex:index] placeholderImage:nil completed:nil];
}

- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView didTapAtIndex:(NSInteger)index
{
    NSLog(@"did tap index = %d", (int)index);
}




- (BOOL)hidesBottomBarWhenPushed {
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
