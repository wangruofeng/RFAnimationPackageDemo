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
#import "RFNavigationModel.h"

@interface RFAnimationVC ()<UITableViewDelegate>

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
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)
                                                  style:UITableViewStylePlain];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.tableHeaderView = [UIView new];
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor RFViewBgColor];
    
    [self.view addSubview:self.tableView];
}

- (void)loadXibNoneDataSource {
    
    RFNavigationModel *model1 = [RFNavigationModel modelWithAppName:@"即刻" featureName:@"内容切换动画" targetClassName:@"RFJikeAnimationVC"];
    RFNavigationModel *model2 = [RFNavigationModel modelWithAppName:@"YouTube" featureName:@"Loading" targetClassName:@"RFYouTubeAnimationVC"];
    
    
    self.dataSource = [[RFArrayDataSource alloc]initWithItems:@[model1, model2]
                                                cellClassName:@"RFNoneXibCell"
                                           configureCellBlock:^(RFNoneXibCell *cell, RFNavigationModel *model) {
                                               cell.model = model;
                                           }];
    self.tableView.dataSource = self.dataSource;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    RFNavigationModel *model = [self.dataSource itemAtIndexPath:indexPath];
    Class targetClass = NSClassFromString(model.targetClassName);
    UIViewController *targetController = [targetClass new];
    
    NSAssert(targetController, @"targetController does not exist!");

    [self.navigationController pushViewController:targetController animated:YES];

}

@end
