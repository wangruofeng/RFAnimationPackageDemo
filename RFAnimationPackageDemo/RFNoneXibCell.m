//
//  RFNoneXibCell.m
//  RFAnimationPackageDemo
//
//  Created by 王若风 on 3/16/17.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFNoneXibCell.h"
#import "RFNavigationModel.h"

@implementation RFNoneXibCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setModel:(id)model {
    if (_model != model) {
        _model = model;
        
        if ([model isKindOfClass:[RFNavigationModel class]]) {
            RFNavigationModel *naviModel = (RFNavigationModel *)model;
            self.textLabel.text = [NSString stringWithFormat:@"%@ - %@",naviModel.appName, naviModel.featureName];
        } else {
            self.textLabel.text = @"doesn't supported model!";
        }
    }
}

@end
