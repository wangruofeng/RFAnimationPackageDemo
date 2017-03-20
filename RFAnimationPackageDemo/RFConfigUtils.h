//
//  RFConfigUtils.h
//  RFAnimationPackageDemo
//
//  Created by 王若风 on 20/03/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kScreenWidth CGRectGetWidth([UIScreen mainScreen].bounds)
#define kScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)

#define RGBa(r,g,b,a) [UIColor colorWithRed:r/255.0f \
                                      green:g/255.0f \
                                       blue:b/255.0f \
                                      alpha:a]
#define RGB(r,g,b)    RGBa(r,g,b,1.0)

// UIColorFromRGB(0xBC1128)
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                                                 green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
                                                  blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
                                                 alpha:1.0]

@interface RFConfigUtils : NSObject

@end


@interface UIColor(RFExtension)

+ (UIColor *)RFViewBgColor;

@end
