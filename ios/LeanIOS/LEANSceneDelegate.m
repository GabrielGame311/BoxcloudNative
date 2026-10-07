//
//  LEANSceneDelegate.h
//  MedianIOS
//
//  Created by Kevin Mercado on 10/1/26.
//  Copyright © 2026 GoNative.io. All rights reserved.
//

#import "LEANSceneDelegate.h"

@interface LEANSceneDelegate()
@property BOOL willEnterForegroundCalled;
@end

@implementation LEANSceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.appDelegate = (LEANAppDelegate *)UIApplication.sharedApplication.delegate;
    
    if (![scene isKindOfClass:[UIWindowScene class]]) {
        return;
    }

    UIWindowScene *windowScene = (UIWindowScene *)scene;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *rvc = [storyboard instantiateInitialViewController];
    UIWindow *window = [[UIWindow alloc] initWithWindowScene:windowScene];

    window.rootViewController = rvc;
    self.window = window;
    [window makeKeyAndVisible];
    self.appDelegate.window = window;
    
    [self.appDelegate application:UIApplication.sharedApplication willConnectToSession:session options:connectionOptions];
}

- (void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts {
    UIOpenURLContext *context = URLContexts.anyObject;
    if (!context) {
        return;
    }
    [self.appDelegate application:UIApplication.sharedApplication openURLContext:context];
}

- (void)scene:(UIScene *)scene continueUserActivity:(NSUserActivity *)userActivity {
    [self.appDelegate application:UIApplication.sharedApplication continueUserActivity:userActivity restorationHandler:nil];
}

- (void)sceneDidBecomeActive:(UIScene *)scene {
    [self.appDelegate applicationDidBecomeActive:UIApplication.sharedApplication];
}

- (void)sceneWillResignActive:(UIScene *)scene {
    [self.appDelegate applicationWillResignActive:UIApplication.sharedApplication];
}

- (void)sceneDidEnterBackground:(UIScene *)scene {
    [self.appDelegate applicationDidEnterBackground:UIApplication.sharedApplication];
}

- (void)sceneWillEnterForeground:(UIScene *)scene {
    if (!self.willEnterForegroundCalled) {
        self.willEnterForegroundCalled = YES;
        return;
    }
    [self.appDelegate applicationWillEnterForeground:UIApplication.sharedApplication];
}

@end
