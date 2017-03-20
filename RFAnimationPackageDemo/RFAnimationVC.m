//
//  RFAnimationVC.m
//  RFAnimationPackageDemo
//
//  Created by 王若风 on 20/03/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFAnimationVC.h"
#import "RFArrayDataSource.h"
#import "RFNoneXibCell.h"

@interface RFAnimationVC ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RFArrayDataSource *dataSource;

@end

@implementation RFAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpTableView];
    [self loadXibNoneDataSource];
}

- (void)setUpTableView;
{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight - 20)
                                                  style:UITableViewStylePlain];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 20;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.tableHeaderView = [UIView new];
    
    [self.view addSubview:self.tableView];
}

- (void)loadXibNoneDataSource {
    
    NSArray *items = @[
                       @"Twitter Loading Animation",
                       @"Facebook Pop Animation"
                       ];
    self.dataSource = [[RFArrayDataSource alloc]initWithItems:items
                                                cellClassName:@"RFNoneXibCell"
                                           configureCellBlock:^(RFNoneXibCell *cell, NSString *item) {
                                               cell.title = item;
                                           }];
    self.tableView.dataSource = self.dataSource;
    [self.tableView reloadData];
}

@end
