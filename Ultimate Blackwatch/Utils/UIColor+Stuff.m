//
//  UIColor+Stuff.m
//  Ultimate Blackwatch
//
//  Created by Arvid Gerstmann on 07/04/14.
//  Copyright (c) 2014 Arvid Gerstmann. All rights reserved.
//

#import "UIColor+Stuff.h"

@implementation UIColor (Stuff)

+ (UIColor *)colorWithHexString:(NSString *)colorString {
    NSString *string = colorString;
    if ([string hasPrefix:@"#"]) {
        string = [string substringFromIndex:1];
    }

    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:string];
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:(CGFloat) (((rgbValue & 0xFF0000) >> 16) / 255.0)
                           green:(CGFloat) (((rgbValue & 0xFF00) >> 8) / 255.0)
                            blue:(CGFloat) ((rgbValue & 0xFF) / 255.0) alpha:1.0];
}

- (NSString *)hexString {
    CGFloat red, green, blue, alpha;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];

    int r = (int) (255.0f * red);
    int g = (int) (255.0f * green);
    int b = (int) (255.0f * blue);

    return [NSString stringWithFormat:@"%02x%02x%02x", r, g, b];
}

@end
