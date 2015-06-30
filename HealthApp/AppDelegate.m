//
//  AppDelegate.m
//  HealthApp
//
//  Created by Filipe da Silva Oliveira on 08/06/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UITabBar appearance] setTintColor:[Color tabSelectColor]];
    [[UITabBar appearance] setBarTintColor:[Color verde]];
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UITabBar *tabBar = tabBarController.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    //UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
    
    tabBarItem1 =[tabBarItem1 initWithTitle:nil image:[UIImage imageNamed:@"dicionario"] selectedImage:[UIImage imageNamed:@"dicionario-s.png"]];
    tabBarItem2 =[tabBarItem2 initWithTitle:nil image:[UIImage imageNamed:@"busca.png"] selectedImage:[UIImage imageNamed:@"busca-s.png"]];
    tabBarItem3 =[tabBarItem3 initWithTitle:nil image:[UIImage imageNamed:@"calculo.png"] selectedImage:[UIImage imageNamed:@"calculo-s.png"]];
    //tabBarItem4 =[tabBarItem4 initWithTitle:nil image:[UIImage imageNamed:@"recentes.png"] selectedImage:[UIImage imageNamed:@"recentes-s.png"]];
    
    [[UINavigationBar appearance] setBarTintColor:[Color verde]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];

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
