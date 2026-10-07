//
//  LEANAppDelegate.h
//  LeanIOS
//
//  Created by Weiyin He on 2/10/14.
// Copyright (c) 2014 GoNative.io LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "GNRegistrationManager.h"
#import <GoNativeCore/GNBridge.h>
#import <GoNativeCore/GoNativeAppConfig.h>

@interface LEANAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) GNRegistrationManager *registration;
@property Reachability *internetReachability;
@property BOOL isFirstLaunch;
@property NSString *previousInitialUrl;
@property NSString *apnsToken;
@property (strong, nonatomic) GNBridge *bridge;

- (void)configureApplication;
- (void)application:(UIApplication *)application willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions;
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options;
- (BOOL)application:(UIApplication *)app openURLContext:(UIOpenURLContext *)context;
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> *))restorationHandler;
- (void)applicationDidBecomeActive:(UIApplication *)application;
- (void)applicationWillResignActive:(UIApplication *)application;
- (void)applicationDidEnterBackground:(UIApplication *)application;
- (void)applicationWillEnterForeground:(UIApplication *)application;

@end
