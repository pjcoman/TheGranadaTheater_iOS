//
//  AppDelegate.m
//  TheGranada†heaterDallas
//
//  Created by me on 12/23/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "AppDelegate.h"
#import "DetailViewController.h"
#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    // Override point for customization after application launch.
    
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:@"ujM99YsHel147d1ild1IxK4O0J0tvVsUimRABzPK"
                  clientKey:@"uQTgiIJYnzS9UnSnIIxZTErj7xiZNOMEUtppbRXl"];
    
    
    
    
    
    // Register for Push Notitications
    UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
                                                    UIUserNotificationTypeBadge |
                                                    UIUserNotificationTypeSound);
    
    if ([application respondsToSelector:@selector(isRegisteredForRemoteNotifications)]) {
    
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes categories:nil];
    [application registerUserNotificationSettings:settings];
    [application registerForRemoteNotifications];
        
    } else {
        
        [application registerForRemoteNotificationTypes:(UIUserNotificationTypeAlert |
                                                         UIUserNotificationTypeBadge |
                                                         UIUserNotificationTypeSound)];
        
        
    }
    
    if (application.applicationState != UIApplicationStateBackground)  {
        BOOL preBackgroundPush = ![application respondsToSelector:@selector(backgroundRefreshStatus)];
        BOOL oldPushHandlerOnly = ![self respondsToSelector:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)];
        bool noPushPayLoad = ![launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        if (preBackgroundPush || oldPushHandlerOnly || noPushPayLoad) {
            [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
        }
        
    }
    
    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    return YES;
}




- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];

    
    
    [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"a"];    
        NSLog(@"AM or PM?: %@", [formatter stringFromDate:[NSDate date]]);
        
      
        
                NSLog(@"User is currently at %f, %f", geoPoint.latitude, geoPoint.longitude);
        
                currentInstallation[@"userLocation"] = geoPoint;
                
                double granadaLat = 32.830849;
                double granadaLong = -96.7698177;
                
                PFGeoPoint *granadaGeoPoint = [PFGeoPoint geoPointWithLatitude:granadaLat longitude:granadaLong];
                
                CLLocationDistance distance = [geoPoint distanceInMilesTo:granadaGeoPoint];
                
                int distanceInt = (int)distance + 1;
                
                NSNumber *distanceInteger = [NSNumber numberWithInt:distanceInt];
                
                NSString *distanceToTheater = [NSString stringWithFormat:@"distance to theater is %f", distance];
                
                NSLog(@"User is currently %f miles from The Granada", distance);
                NSLog(@"User is less than %@ mile(s) from The Granada", distanceInteger);
                
                currentInstallation[@"lessThanNumberOfMilesFromTheater"] = distanceInteger;
                currentInstallation[@"actualDistanceInMilesFromTheater"] = distanceToTheater;
                
                
                


    
    }];
    
    
 
    [currentInstallation setDeviceTokenFromData:deviceToken];
      [currentInstallation saveInBackground];
    
  

}





- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    if (application.applicationState == UIApplicationStateInactive)  {
        
        [PFAnalytics trackAppOpenedWithRemoteNotificationPayload:userInfo];
    }
    [PFPush handlePush:userInfo];
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
