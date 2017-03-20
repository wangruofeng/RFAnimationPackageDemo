//
//  ViewController.m
//  RFAnimationPackageDemo
//
//  Created by 王若风 on 3/16/17.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "ViewController.h"
#import "RFArrayDataSource.h"
#import "RFNoneXibCell.h"
#import "RFXibCell.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) RFArrayDataSource *dataSource;

@property (nonatomic, assign) BOOL xibDataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
	
    [self setUpTableView];
	
	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(loadRadomData) userInfo:nil repeats:YES];
}

- (void)loadRadomData
{
	if (self.xibDataSource) {
		[self loadXibNoneDataSource];
	} else {
		[self loadXibDataSource];
	}
	
	self.xibDataSource = !self.xibDataSource;
}

- (void)setUpTableView;
{
	
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)
                                                  style:UITableViewStylePlain];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 20;

    [self.view addSubview:self.tableView];
}

- (void)loadXibNoneDataSource {
	
	NSArray *items = @[
					   @"Twitter Loading Animation",
					   @"Facebook Pop Animation"
					   ];
	self.dataSource = [[RFArrayDataSource alloc]initWithItems:items
												cellClassName:@"RFNoneXibCell"
										   configureCellBlock:^(RFNoneXibCell *cell, id model) {
											   cell.model = model;
										   }];
	self.tableView.dataSource = self.dataSource;
	[self.tableView reloadData];
}

- (void)loadXibDataSource {
	NSArray *items = @[
					   @"Twitter Loading Animation",
					   @"Facebook Pop Animation",
					   [UIImage imageNamed:@"baby01.jpg"],
					   [UIImage imageNamed:@"baby02.jpg"],
					   [UIImage imageNamed:@"baby03.jpg"],
					   [UIImage imageNamed:@"baby04.jpg"],
					   [UIImage imageNamed:@"baby05.jpg"],
					   @"Twitter Loading Animation Twitter Loading Animation ",
					   @"Facebook Pop Animation Facebook Pop Animation",
					   ];
	self.dataSource = [[RFArrayDataSource alloc] initWithItems:items
												   cellNibName:@"RFXibCell"
											configureCellBlock:^(RFXibCell *cell, id model) {
												cell.model = model;
											}];
	self.tableView.dataSource = self.dataSource;
	[self.tableView reloadData];
}

@end
