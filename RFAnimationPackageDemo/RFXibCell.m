//
//  RFXibCell.m
//  RFAnimationPackageDemo
//
//  Created by 王若风 on 3/16/17.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFXibCell.h"

@interface RFXibCell ()

@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation RFXibCell

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
        
        [self commonInit];
        
        if ([model isKindOfClass:[NSString class]]) {
            self.leftLabel.text = model;
        } else if ([model isKindOfClass:[UIImage class]]) {
            self.imgView.image = model;
        }
    }
}

- (void)commonInit
{
    self.leftLabel.text = nil;
    self.imgView.image = nil;
}

@end
