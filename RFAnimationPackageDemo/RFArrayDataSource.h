//
//  RFArrayDataSource.h
//  RFAnimationPackageDemo
//
//  Created by 王若风 on 3/16/17.
//  Copyright © 2017 王若风. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^RFConfigureCellBlock)(id cell ,id item);

/**
 for UITableViewDataSource
 */
@interface RFArrayDataSource : NSObject<UITableViewDataSource>

///=============================================================================
///   without xib
///=============================================================================

- (instancetype)initWithItems:(NSArray *)items
                cellClassName:(NSString *)cellClassName
           configureCellBlock:(RFConfigureCellBlock)configureCellBlock;


///=============================================================================
///   with xib
///=============================================================================

- (instancetype)initWithItems:(NSArray *)items
                  cellNibName:(NSString *)cellNibName
           configureCellBlock:(RFConfigureCellBlock)configureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)count;

@end
