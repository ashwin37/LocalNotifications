//
//  AppDelegate.m
//  LocalNotifications
//
//  Created by Rakesh Viparla on 12/9/16.
//  Copyright © 2016 adroit37. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeBadge categories:nil]];
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
   
    NSDate *alaramTime  = [[NSDate date] dateByAddingTimeInterval:5];
    UIApplication *app = [UIApplication sharedApplication];
    UILocalNotification *localNotify = [[UILocalNotification alloc]init];
    
    if (localNotify) {
        localNotify.fireDate = alaramTime;
        localNotify.timeZone = [NSTimeZone defaultTimeZone];
        localNotify.repeatInterval = 0;
        localNotify.soundName = UILocalNotificationDefaultSoundName;
        localNotify.alertBody = @"Notification";
        [app scheduleLocalNotification:localNotify];
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    UIApplication *app = [UIApplication sharedApplication];
    NSArray *oldNotarray = [app scheduledLocalNotifications];
    
    if ([oldNotarray count] > 0) {
        [app cancelAllLocalNotifications];
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
