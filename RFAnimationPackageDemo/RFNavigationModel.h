//
//  RFNavigationModel.h
//  RFAnimationPackageDemo
//
//  Created by 王若风 on 20/03/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RFNavigationModel : NSObject

@property (nonatomic, copy) NSString *appName;
@property (nonatomic, copy) NSString *featureName;
@property (nonatomic, copy) NSString *targetClassName;

+ (instancetype)modelWithAppName:(NSString *)appName
                     featureName:(NSString *)featureName
                 targetClassName:(NSString *)targetClassName;

@end
