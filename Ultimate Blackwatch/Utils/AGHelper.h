//
//  AGHelper.h
//  Ultimate Blackwatch
//
//  Created by Arvid Gerstmann on 25/05/14.
//  Copyright (c) 2014 Arvid Gerstmann. All rights reserved.
//

#import <Foundation/Foundation.h>

#define RADIANS(x) (M_PI * (x) / 180.0)

@interface AGHelper : NSObject

#pragma mark - Colors -
+ (UIColor *)darkColor;
+ (UIColor *)brightColor;

@end
