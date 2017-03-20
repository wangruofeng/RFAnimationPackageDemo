//
//  CAKeyframeAnimation+Extensions.h
//  RFAnimationPackageDemo
//
//  Created by 王若风 on 20/03/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAKeyframeAnimation (Extensions)

+ (CAKeyframeAnimation *)zoomAnimation;
+ (CAKeyframeAnimation *)transformAnimation;

@end
