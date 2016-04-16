//
//  AppDelegate.m
//  MonkeyNews
//
//  Created by training on 3/12/16.
//  Copyright © 2016 training. All rights reserved.
//

#import "AppDelegate.h"
#import "MonkeyNews-Swift.h"
@import FBSDKCoreKit; // librarie

@interface AppDelegate ()

@end

@implementation AppDelegate

// push notification se primeste in doua locuri in functie de starea aplicatiei
// aici, daca aplicatia nu este deschisa
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[FBSDKApplicationDelegate sharedInstance] application:application                           didFinishLaunchingWithOptions:launchOptions];
    
    // [[NSUserDefaults standardUserDefaults] integerForKey
    [self askForPush:application];
    
    
    NSDictionary* push = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    
    NSLog(@"%@", push);
    // Override point for customization after application launch.
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
                                                                  openURL:url
                                                        sourceApplication:sourceApplication
                                                               annotation:annotation
                    ];
    // Add any custom logic here.
    return handled;
}

// push notification
// daca aplicatia ruleaza
- (void) application: (UIApplication *) app didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo {
    // cheie apns in userinfo
    NSLog(@"%@", userInfo);
}
//
// withActionHandler -> push notification with deep linking
//


- (void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSLog(@"%@", deviceToken);
    
    NSString* token = deviceToken.description;
    token = [token stringByReplacingOccurrencesOfString:@"<" withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@">" withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSLog(@"%@", token);
    
    [PushComm addToken:token];
    
    
}

- (void)application: (UIApplication*)app didFailToRegisterForRemoteNotificationsWithError:(nonnull NSError *)error{
    NSLog(@"%@", error);
}

- (void) application: (UIApplication*) app didRegisterUserNotificationSettings:(nonnull UIUserNotificationSettings *)notificationSettings {
    
    if (notificationSettings != UIUserNotificationTypeNone) {
        [app registerForRemoteNotifications];
    }
}
//
- (void) askForPush:(UIApplication*) app {
    UIUserNotificationSettings* settings = [UIUserNotificationSettings
                                            settingsForTypes:UIUserNotificationTypeAlert|
                                                            UIUserNotificationTypeBadge|
                                                             UIUserNotificationTypeSound
                                            
                                                categories:nil]; // actiune swipe left/right pe push notification la categorii pentru o identificare mai buna
    [app registerUserNotificationSettings:settings];
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
