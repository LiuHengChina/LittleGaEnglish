//
//  BBCouresesTabView.m
//  LittleGaEnglish
//
//  Created by Jed on 16/2/27.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BBCouresesTabView.h"
#import "BBCoureseTableViewCell.h"

@interface BBCouresesTabView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation BBCouresesTabView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegate = self;
    }
    return self;
}

-(void)awakeFromNib
{
    self.dataSource = self;
}


- (NSInteger)numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataArr != nil) {
        return self.dataArr.count;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"IdentifierCell1";
    BBCoureseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"BBCoureseTableViewCell" owner:nil options:nil];
        cell= nibs.firstObject;
    }
    cell.model = self.dataArr[indexPath.row];
    return cell;
}


@end
