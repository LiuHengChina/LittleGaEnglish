//
//  CoursesEvalViewController.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/29.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "CoursesEvalViewController.h"
#import "BBStarView.h"
#import "MyUITableView.h"
#import "CoureseEvalTableViewCell.h"
#import "MYApiCourese.h"

@interface CoursesEvalViewController ()<UITableViewDelegate,UITableViewDataSource,StarViewDelegate>

@property (strong, nonatomic) IBOutlet BBStarView *allEvalView;

@property (strong, nonatomic) IBOutlet BBStarView *MyEvalView;

@property (strong, nonatomic) IBOutlet UILabel *allEvalLabel;

@property (strong, nonatomic) IBOutlet MyUITableView *tableView;

@property (nonatomic, strong) UITextView *text;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) UIImageView *defaultImage;

@end

@implementation CoursesEvalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.allEvalView.canEdit = NO;
    self.MyEvalView.delegate = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.model.list.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"eval";
    CoureseEvalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"CoureseEvalTableViewCell" owner:nil options:nil];
        cell= nibs.firstObject;
    }
    CourseEvalModel *model = self.model.list[indexPath.row];
    cell.model = model;
    return cell;
}

- (void)starViewChangeCount:(NSInteger)count
{
    self.count = count;
    [self addElvaView];
}


- (void)addElvaView
{
    UIImageView *defaultImage = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [[UIApplication sharedApplication].keyWindow addSubview:defaultImage];

    self.defaultImage = defaultImage;
    defaultImage.image = [UIImage imageNamed:@"default"];
//
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [defaultImage addGestureRecognizer:tap];
    defaultImage.userInteractionEnabled = YES;

    UIView *footerView = [UIView new];
    footerView.backgroundColor = [UIColor whiteColor];
    [defaultImage addSubview:footerView];
    [footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(@0);
        make.height.equalTo(@261);
    }];
//    footerView.backgroundColor = [UIColor redColor];

    UILabel *titleLab = [UILabel new];
    [footerView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.top.equalTo(@10);
    }];
    titleLab.text = @"课程评价";
    titleLab.font = [UIFont systemFontOfSize:13];

    UITextView *text = [UITextView new];
    [footerView addSubview:text];
    [text mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@5);
        make.right.equalTo(footerView.mas_right).offset(-5);
        make.top.equalTo(titleLab.mas_bottom).offset(10);
        make.height.equalTo(@148);
    }];
    self.text = text;
    text.font = [UIFont systemFontOfSize:13];
    text.layer.borderWidth = 1;
    text.layer.borderColor = [UIColor grayColor].CGColor;

    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerView addSubview:addBtn];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(footerView.mas_bottom).offset(-12);
        make.centerX.equalTo(footerView.mas_centerX);
        make.height.equalTo(@44.5);
        make.width.equalTo(@(630 / 2.0 * kSYSTEM_SCREEN_HEIGHT / 667.0));
    }];
    [addBtn setTitle:@"提交" forState:UIControlStateNormal];
    [addBtn setBackgroundColor:[UIColor customColorWithString:k_Color_navigation]];
    [addBtn addTarget:self action:@selector(addBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)tapAction:(UITapGestureRecognizer *)sender
{
    [sender.view removeFromSuperview];
}

- (void)addBtnAction
{
    [[MYApiCourese share]sendCommentWithClassID:self.courseID star:[NSString stringWithFormat:@"%ld",(long)self.count] content:self.text.text Success:^(MYApiCourese *request, BaseModel *model) {
        
        [self.defaultImage removeFromSuperview];
        
    } Failure:^(MYApiCourese *request, NSError *requestError) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setDetailModel:(CourseDetailModel *)detailModel
{
    _detailModel = detailModel;
    self.model = _detailModel.mycomment;
}

- (void)setModel:(CourseCommentModel *)model
{
    _model = model;
    self.allEvalLabel.text = [NSString stringWithFormat:@"%@人评价",model.count];
    self.allEvalView.count = model.avg_star.intValue;
    [self.tableView reloadData];
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
