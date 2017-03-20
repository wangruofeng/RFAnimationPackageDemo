//
//  CAKeyframeAnimation+Extensions.m
//  RFAnimationPackageDemo
//
//  Created by 王若风 on 20/03/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "CAKeyframeAnimation+Extensions.h"
#import <UIKit/UIKit.h>

@implementation CAKeyframeAnimation (Extensions)

+ (CAKeyframeAnimation *)zoomAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"bounds"];
    animation.beginTime = CACurrentMediaTime() + 1;
    animation.duration = 1;
    animation.keyTimes = @[@0,@0.4, @1];
    animation.values = @[
                             [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)],
                             [NSValue valueWithCGRect:CGRectMake(0, 0, 85, 85)],
                             [NSValue valueWithCGRect:CGRectMake(0, 0, 4500, 4500)]
                             ];
    animation.timingFunctions = @[
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault],
                                      ];
    animation.removedOnCompletion = false;
    animation.fillMode = kCAFillModeForwards;
    
    return animation;
}

+ (CAKeyframeAnimation *)transformAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"animation"];
    animation.beginTime = CACurrentMediaTime() + 1.1;
    animation.duration = 0.6;
    animation.keyTimes = @[@0, @0.5, @1];
    animation.values = @[
                         [NSValue valueWithCATransform3D:CATransform3DIdentity],
                         [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1.1, 1.1, 1)],
                         [NSValue valueWithCATransform3D:CATransform3DIdentity]
                         ];

    return animation;
}

@end
