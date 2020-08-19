//
//  AppDelegate.m
//  EasyIOS
//
//  Created by 赖盛源 on 2019/9/18.
//  Copyright © 2019 dnake_ay. All rights reserved.
//

#import "AppDelegate.h"
#import "Action.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Action actionConfigScheme:@"http" host:@"www.huilink.com.cn" client:@"" codeKey:@"" rightCode:200 msgKey:@""];
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    
    [RACObserve(manager, networkReachabilityStatus) subscribeNext:^(NSNumber *status) {
        AFNetworkReachabilityStatus networkStatus = [status intValue];
        switch (networkStatus) {
            case AFNetworkReachabilityStatusUnknown:
                break;
            case AFNetworkReachabilityStatusNotReachable:
                EZLog(@"没网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                EZLog(@"数据流量");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                EZLog(@"Wifi");
                break;
        }
    }];
    
    return YES;
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
