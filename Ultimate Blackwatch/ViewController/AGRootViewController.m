//
//  AGViewController.m
//  Ultimate Blackwatch
//
//  Created by Arvid Gerstmann on 25/05/14.
//  Copyright (c) 2014 Arvid Gerstmann. All rights reserved.
//

#import "AGRootViewController.h"
#import "UIColor+Stuff.h"
#import "AGNavigationBar.h"

@interface AGRootViewController ()

#pragma mark - Views -
@property (nonatomic, strong) UIView *controllerView;

#pragma mark - Re-Declared Properties -
@property (nonatomic, strong) AGNavigationBar *navigationBar;
@property (nonatomic, strong) UIViewController *topViewController;

@end

@implementation AGRootViewController

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    self = [self initWithNibName:nil bundle:nil];
    if (self) {
        self.topViewController = rootViewController;
    }

    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationBar = [[AGNavigationBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 64.0f)];
        self.controllerView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 64.0f, 320.0f, 504.0f)];
        _statusBarStyle = UIStatusBarStyleLightContent;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Attach subviews.
    [self.view addSubview:self.navigationBar];
    [self.view addSubview:self.controllerView];

    // Attach childViewController.
    [self addContainedChildViewController:self.topViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark Styling -
- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.statusBarStyle;
}


#pragma mark -
#pragma mark Controller Containment Helper -
- (void)addContainedChildViewController:(UIViewController *)childController {
    [self addChildViewController:childController];
    [self.controllerView addSubview:childController.view];
    [childController didMoveToParentViewController:self];
}

- (void)removeContainedChildViewController:(UIViewController *)childController {
    [childController willMoveToParentViewController:nil];
    [childController.view removeFromSuperview];
    [childController removeFromParentViewController];
}

@end
