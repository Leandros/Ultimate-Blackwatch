//
//  AGNavigationBar.m
//  Ultimate Blackwatch
//
//  Created by Arvid Gerstmann on 25/05/14.
//  Copyright (c) 2014 Arvid Gerstmann. All rights reserved.
//

#import "AGNavigationBar.h"

@interface AGNavigationBar ()

@property (nonatomic, strong) UIView *statusBarBackground;
@property (nonatomic, strong) UILabel *label;

@end

@implementation AGNavigationBar

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Setup defaults.
        self.tintColor = [UIColor whiteColor];
        self.attributedText = nil;
        self.statusBarColor = [UIColor blackColor];

        // Setup subviews.
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(95.0f, 31.0f, 130.0f, 21.0f)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.text = @"";
        [self addSubview:self.label];

        self.statusBarBackground = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 20.0f)];
        self.statusBarBackground.backgroundColor = self.statusBarColor;
        [self addSubview:self.statusBarBackground];
    }

    return self;
}


#pragma mark -
#pragma mark Styling -

- (void)setTintColor:(UIColor *)color {
    if (self.backgroundColor != color) {
        _tintColor = color;
        self.backgroundColor = color;
    }
}

- (void)setAttributedText:(NSAttributedString *)navigationBarAttributedText {
    if (self.label.attributedText != navigationBarAttributedText) {
        _attributedText = navigationBarAttributedText;
        self.label.attributedText = navigationBarAttributedText;
    }
}

- (void)setStatusBarColor:(UIColor *)statusBarColor {
    if (self.statusBarBackground.backgroundColor != statusBarColor) {
        _statusBarColor = statusBarColor;
        self.statusBarBackground.backgroundColor = statusBarColor;
    }
}

@end
