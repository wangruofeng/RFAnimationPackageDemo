//
//  RFArrayDataSource.m
//  RFAnimationPackageDemo
//
//  Created by 王若风 on 3/16/17.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFArrayDataSource.h"

@interface RFArrayDataSource ()

@property (nonatomic, strong) NSArray  *items;
@property (nonatomic, copy  ) NSString *cellClassName;
@property (nonatomic, copy  ) NSString *cellNibName;
@property (nonatomic, copy  ) RFConfigureCellBlock configureCellBlock;

@end

@implementation RFArrayDataSource

- (NSArray *)items
{
    if (!_items) {
        _items = @[];
    }
    return _items;
}

- (NSInteger)count
{
    return self.items.count;
}

#pragma mark UITableViewDataSource

- (instancetype)initWithItems:(NSArray *)items
                cellClassName:(NSString *)cellClassName
           configureCellBlock:(RFConfigureCellBlock)configureCellBlock
{
    if (!(self = [super init])) {
        return nil;
    }
    
    _items              = items;
    _cellClassName      = [cellClassName copy];
    _configureCellBlock = [configureCellBlock copy];
    
    return self;
}

- (instancetype)initWithItems:(NSArray *)items
                  cellNibName:(NSString *)cellNibName
           configureCellBlock:(RFConfigureCellBlock)configureCellBlock
{
    if (!(self = [super init])) {
        return nil;
    }
    
    _items              = items;
    _cellNibName        = [cellNibName copy];
    _configureCellBlock = [configureCellBlock copy];
    
    return self;
}


- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSUInteger) indexPath.row];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellNibName != nil) {
        // register nib for xib based table view cell
        [tableView registerNib:[UINib nibWithNibName:self.cellNibName bundle:nil] forCellReuseIdentifier:self.cellNibName];
    }
    
    if (self.cellClassName != nil) {
        // register class for class based table view cell
        [tableView registerClass:NSClassFromString(self.cellClassName) forCellReuseIdentifier:self.cellClassName];
    }
    
    // Plan A
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellClassName ?: self.cellNibName
                                                            forIndexPath:indexPath];

    // Plan B
    /**
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (!cell) {
        cell = [[NSClassFromString(self.cellClassName) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellIdentifier];
    }
     */
    
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    
    return cell;
}

@end
