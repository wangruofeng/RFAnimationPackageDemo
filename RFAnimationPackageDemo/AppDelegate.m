//
//  AppDelegate.m
//  RFAnimationPackageDemo
//
//  Created by 王若风 on 3/16/17.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "AppDelegate.h"
#import "RFConfigUtils.h"
#import "CAKeyframeAnimation+Extensions.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self addTwitterLoadingAnimation];
    
    return YES;
}

- (void)addTwitterLoadingAnimation {
    
    self.window.backgroundColor = [UIColor TwitterColor];
    
    UIView *view = self.window.rootViewController.view;
    
    CALayer *logoLayer = [CALayer new];
    logoLayer.bounds = CGRectMake(0, 0, 100, 100);
    logoLayer.position = view.center;
    logoLayer.contents = (id)[UIImage imageNamed:@"logo"].CGImage;
    view.layer.mask = logoLayer;
    
    UIView *shelterView = [[UIView alloc] initWithFrame:view.bounds];
    shelterView.backgroundColor = [UIColor whiteColor];
    
    [view addSubview:shelterView];
    
    CAKeyframeAnimation *zoomAnimation = [CAKeyframeAnimation zoomAnimation];
    CAKeyframeAnimation *transformAnimation = [CAKeyframeAnimation transformAnimation];
    
    [logoLayer addAnimation:zoomAnimation forKey:@"zoomAnimation"];
    [view.layer addAnimation:transformAnimation forKey:@"transformAnimation"];
    
    /// reset transform
    view.layer.transform = CATransform3DIdentity;
    
    /// remove shelterView
    [UIView animateWithDuration:0.3 delay:1.4 options:UIViewAnimationOptionCurveLinear animations:^{
        shelterView.alpha = 0;
    } completion:^(BOOL finished) {
        [shelterView removeFromSuperview];
        view.layer.mask = nil;
    }];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
