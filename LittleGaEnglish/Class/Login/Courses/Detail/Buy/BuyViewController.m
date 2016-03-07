
//
//  BuyViewController.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/2.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BuyViewController.h"
#import "MyUITableView.h"
#import "MyApiBuy.h"
#import "BuyHeaderTableViewCell.h"
#import "BuyMealTableViewCell.h"
#import "BuyPreTableViewCell.h"

@interface BuyViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *priceLab;
@property (strong, nonatomic) IBOutlet MyUITableView *tableView;
@property (nonatomic, strong) BuyModel *model;

@end

@implementation BuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setCustomNavigationTitle:@"购物车"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self getData];
    [self setLeftBarButtonWithString:@"" responderBlcok:nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString *)productId
{
    if (!_productId) {
        _productId = @"";
    }
    return _productId;
}

- (NSString *)classID
{
    if (!_classID) {
        _classID = @"";
    }
    return _classID;
}

- (NSString *)setMealId
{
    if (!_setMealId) {
        _setMealId = @"";
    }
    return _setMealId;
}

- (IBAction)nextBtnAction:(UIButton *)sender {
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!self.model) {
        return 0;
    }
    if (section == 1) {
        if (self.model.recommend_set_meal.class_list.count > 0) {
            return 1;
        }
    }else if (section ==2){
        if (self.model.product.is_can_use_coupon) {
            return 1;
        }
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"IdentifierCell1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    switch (indexPath.section) {
        case 0:{
            static NSString *identifier1 = @"header";
            BuyHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier1];
            if (!cell) {
                NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"BuyHeaderTableViewCell" owner:nil options:nil];
                cell= nibs.firstObject;
            }
            cell.model = self.model.product;
            return cell;
        }
            break;
        case 1:{
            static NSString *identifier2 = @"meal";
            BuyMealTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier2];
            if (!cell) {
                NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"BuyMealTableViewCell" owner:nil options:nil];
                cell= nibs.firstObject;
            }
            cell.model = self.model.recommend_set_meal;
            return cell;
        }
            break;
        
        case 2:{
            static NSString *identifier3 = @"prd";
            BuyPreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier3];
            if (!cell) {
                NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"BuyPreTableViewCell" owner:nil options:nil];
                cell= nibs.firstObject;
            }
            cell.model = self.model;
            return cell;
        }
            
        default:
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            return 80;
        }
            break;
        case 1:
        {
            return 170;
        }
            break;
        case 2:{
            return 160;
            break;
        }
        default:
            break;
    }
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}

- (void)getData
{
    [[MyApiBuy share] sendRequestWithclassID:self.classID mealid:self.setMealId productId:self.productId Success:^(MyApiBuy *request, BuyModel *model) {
        self.model = model;
        [self.tableView reloadData];
        self.priceLab.text = [NSString stringWithFormat:@"￥ %@",self.model.product.price];
    } Failure:^(MyApiBuy *request, NSError *requestError) {
        
    }];
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
