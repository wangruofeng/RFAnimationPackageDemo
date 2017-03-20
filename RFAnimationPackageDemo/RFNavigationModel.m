//
//  RFNavigationModel.m
//  RFAnimationPackageDemo
//
//  Created by 王若风 on 20/03/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFNavigationModel.h"

@implementation RFNavigationModel

+ (instancetype)modelWithAppName:(NSString *)appName
                     featureName:(NSString *)featureName
                 targetClassName:(NSString *)targetClassName
{
    RFNavigationModel *model = [RFNavigationModel new];
    model.appName = appName;
    model.featureName  =featureName;
    model.targetClassName = targetClassName;
    
    return model;
}

@end
