//
//  RFNoneXibCell.m
//  RFAnimationPackageDemo
//
//  Created by 王若风 on 3/16/17.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFNoneXibCell.h"

@implementation RFNoneXibCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTitle:(NSString *)title {
    if (_title != title) {
        _title  = title;
        
        self.textLabel.text = title;
    }
}

@end
