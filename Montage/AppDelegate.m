//
//  AppDelegate.m
//  Montage
//
//  Created by Michael Timbrook on 8/9/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import "AppDelegate.h"
#import "IIViewDeckController.h"
#import "MainViewController.h"
#import "ImagePickerAlbumViewController.h"

@implementation AppDelegate
{
    NSMutableArray *_lastViewControllers;
    IIViewDeckController *_rootViewDeck;
}

- (void)switchCenterViewController:(UIViewController *)viewController andClose:(BOOL)close
{
    if (_rootViewDeck) {
        [_lastViewControllers addObject:_rootViewDeck.centerController];
        [_rootViewDeck setCenterController:viewController];
        if (close) {
            [_rootViewDeck closeRightView];
        }
    } else abort(); // Just die if nil, remove in production
}

- (void)popViewControllerOnCenter
{
    if (_lastViewControllers.count > 0) {
        // Will animate
        UIViewController *last = _lastViewControllers.lastObject;
        [self switchCenterViewController:last andClose:YES];
        [_lastViewControllers removeLastObject];
    }
}

#pragma mark - System Calls

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    _lastViewControllers = [NSMutableArray new];
    
    // Load root
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    MainViewController *mainView = [storyboard instantiateViewControllerWithIdentifier:MainViewControllerSBID];
    ImagePickerAlbumViewController *imagePick = [storyboard instantiateViewControllerWithIdentifier:ImagePickerAlbumViewControllerSBID];

    imagePick.delegate = mainView;
    
    _rootViewDeck = [[IIViewDeckController alloc] initWithCenterViewController:mainView rightViewController:imagePick];
    
    self.window.rootViewController = _rootViewDeck;
    
    return YES;
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
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
