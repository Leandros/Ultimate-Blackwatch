//
//  AGViewController.h
//  Ultimate Blackwatch
//
//  Created by Arvid Gerstmann on 25/05/14.
//  Copyright (c) 2014 Arvid Gerstmann. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AGNavigationBar;
@interface AGRootViewController : UIViewController

#pragma mark - Properties -
@property (nonatomic, strong, readonly) AGNavigationBar *navigationBar;
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;
@property (nonatomic, strong, readonly) UIViewController *topViewController;


#pragma mark - Methods -
- (id)initWithRootViewController:(UIViewController *)rootViewController;

@end
