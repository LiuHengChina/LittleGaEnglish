//
//  BBCourseBobyViewController.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/27.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BBCourseBobyViewController.h"
#import "BBCouresesTabView.h"
#import "MYApiCourese.h"
#import "CoursesDetailViewController.h"

#import "StudentsList.h"
#import "ClassPackage.h"
@interface BBCourseBobyViewController ()<UISearchBarDelegate,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) IBOutlet BBCouresesTabView *tabView;

@property (nonatomic, assign) int page;

@property (nonatomic, assign) int pageSize;

@property (nonatomic, copy) NSString *searckKey;

@end

@implementation BBCourseBobyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searckKey = @"";
    self.page = 0;
    self.pageSize = 10;
    
    self.searchBar.delegate = self;
    self.tabView.delegate = self;
    self.tabView.canRefreshFooter = YES;
//    WS(wself);
//    self.tabView.footerRefreshingBlock = ^(){
//        [wself updateData];
//    };
    [self updateData];
    
    self.tabView.delegate = self;
    self.tabView.tableHeaderView = [UIView new];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    self.searckKey = searchBar.text;
    [self updateData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)updateData
{
    [self searchUrl:self.url key:self.searckKey page:self.page pageSize:self.pageSize];
}

- (void)searchUrl:(NSString *)url key:(NSString *)key page:(int)page pageSize:(int)pageSize
{
    [[MYApiCourese share]sendRequestWithUrl:url searchKey:key page:page pageSize:pageSize Success:^(MYApiCourese *request, NSMutableArray *arr) {
        if (arr && arr.count >= self.pageSize) {
            self.page++;
        }
        self.tabView.dataArr = arr;
        [self.tabView reloadData];
    } Failure:^(MYApiCourese *request, NSError *requestError) {
        
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 87;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    CoureseModel *model = self.tabView.dataArr[indexPath.row];
//    CoursesDetailViewController *detailVC = [CoursesDetailViewController new];
//    detailVC.courseID = model.id;
//    detailVC.title = model.name;
//    [self.VC.navigationController pushViewController:detailVC animated:YES];
    
//    StudentsList *studentlist = [StudentsList new];
//    studentlist.hidesBottomBarWhenPushed = YES;
//    [self.VC.navigationController pushViewController:studentlist animated:YES];
    
    ClassPackage *studentlist = [ClassPackage new];
    studentlist.hidesBottomBarWhenPushed = YES;
    [self.VC.navigationController pushViewController:studentlist animated:YES];
    
} 



@end
