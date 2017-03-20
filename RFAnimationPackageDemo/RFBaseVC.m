//
//  RFBaseVC.m
//  RFAnimationPackageDemo
//
//  Created by 王若风 on 3/16/17.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFBaseVC.h"

@interface RFBaseVC ()

@end

@implementation RFBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUp];
}

- (void)setUp {
    self.view.backgroundColor = [UIColor RFViewBgColor];
}

@end
