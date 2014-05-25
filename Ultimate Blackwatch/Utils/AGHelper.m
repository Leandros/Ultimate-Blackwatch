//
//  AGHelper.m
//  Ultimate Blackwatch
//
//  Created by Arvid Gerstmann on 25/05/14.
//  Copyright (c) 2014 Arvid Gerstmann. All rights reserved.
//

#import "AGHelper.h"
#import "UIColor+Stuff.h"

@implementation AGHelper

+ (UIColor *)darkColor {
    static UIColor *darkColor = nil;
    static dispatch_once_t onceTokenDarkColor;
    dispatch_once(&onceTokenDarkColor, ^{
        darkColor = [UIColor colorWithHexString:@"1c1c1c"];
    });

    return darkColor;
}

+ (UIColor *)brightColor {
    static UIColor *brightColor = nil;
    static dispatch_once_t onceTokenBrightColor;
    dispatch_once(&onceTokenBrightColor, ^{
        brightColor = [UIColor colorWithHexString:@"e6e6e6"];
    });

    return brightColor;
}

@end
