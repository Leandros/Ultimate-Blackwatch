//
//  AGNavigationBar.h
//  Ultimate Blackwatch
//
//  Created by Arvid Gerstmann on 25/05/14.
//  Copyright (c) 2014 Arvid Gerstmann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGNavigationBar : UIView

#pragma mark - Styling -
/**
 *  The tintColor. Defaults to: White.
 */
@property (nonatomic, strong) UIColor *tintColor;

/**
 * The text. Defaults to: nil.
 */
@property (nonatomic, strong) NSAttributedString *attributedText;

/**
 * The StatusBar background color. Defaults to: Black.
 */
@property (nonatomic, strong) UIColor *statusBarColor;

@end
