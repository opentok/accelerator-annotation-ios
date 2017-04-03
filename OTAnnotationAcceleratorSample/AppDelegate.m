//
//  AppDelegate.m
//  AnnotationAccPackKit
//
//  Created by Xi Huang on 6/28/16.
//  Copyright © 2016 Tokbox, Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "OTAcceleratorSession.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

static OTAcceleratorSession *sharedSession;

- (OTAcceleratorSession *)getSharedAcceleratorSession {
    return sharedSession;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
#warning - replace your OpenTok credentials here
    sharedSession = [[OTAcceleratorSession alloc] initWithOpenTokApiKey:@"100" sessionId:@"1_MX4xMDB-fjE0OTEyNTU1NzIyODR-cTcwaEM4MzZZeUJoLzRHUS9PL29yMVVDfn4" token:@"T1==cGFydG5lcl9pZD0xMDAmc2RrX3ZlcnNpb249dGJwaHAtdjAuOTEuMjAxMS0wNy0wNSZzaWc9NGM3MGJlN2YyMmZmOTk3NDI3NTRjZjVmZWI1OWM1ODNkNDg1NWJlNjpzZXNzaW9uX2lkPTFfTVg0eE1EQi1makUwT1RFeU5UVTFOekl5T0RSLWNUY3dhRU00TXpaWmVVSm9MelJIVVM5UEwyOXlNVlZEZm40JmNyZWF0ZV90aW1lPTE0OTEyNTU1NzImcm9sZT1tb2RlcmF0b3Imbm9uY2U9MTQ5MTI1NTU3Mi40Njk4MTI3NTUzMjM3MSZleHBpcmVfdGltZT0xNDkzODQ3NTcy"];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
