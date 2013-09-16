//
//  AppDelegate.h
//  Montage
//
//  Created by Michael Timbrook on 8/9/13.
//  Copyright (c) 2013 Michael Timbrook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 * Used to change the center view controller without transition.
 */
- (void)switchCenterViewController:(UIViewController *)viewController andClose:(BOOL)close;

/**
 * Removes layered view controllers with animation
 */
- (void)popViewControllerOnCenter;

@end
