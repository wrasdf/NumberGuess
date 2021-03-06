//
//  NGAppDelegate.m
//  NumberGuess
//
//  Created by twer on 1/11/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import "NGAppDelegate.h"
#import "NGGameViewController.h"
#import "NGSettingsHomeController.h"

@implementation NGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    // add by jacky to connect UI & controller

    NGGameViewController *gameViewController = [[NGGameViewController alloc] init];
    UITabBarItem *gameTab = [[UITabBarItem alloc] initWithTitle:@"Games" image:[UIImage imageNamed:@"11.png"] tag:1];
    [gameViewController setTabBarItem:gameTab];

    UINavigationController *settingsNavigationController = [[UINavigationController alloc] initWithRootViewController:[[NGSettingsHomeController alloc] init]];
    UITabBarItem *settingsTab = [[UITabBarItem alloc] initWithTitle:@"Settings" image:[UIImage imageNamed:@"12.png"] tag:2];
    [settingsNavigationController setTabBarItem:settingsTab];


    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[gameViewController, settingsNavigationController];

    [self customizeInterface];

    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    [self setNGConfig];
    return YES;
}


- (void)customizeInterface
{
    UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"selection-tab.png"]];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) setNGConfig{
    NSUserDefaults *config = [NSUserDefaults standardUserDefaults];
    NSString *gameLevel = [config stringForKey:@"Level"];
    if (!gameLevel){
        [config setObject:@"Easy" forKey:@"Level"];
        [config setInteger:8 forKey:@"GuessTimes"];
    }
}

@end
