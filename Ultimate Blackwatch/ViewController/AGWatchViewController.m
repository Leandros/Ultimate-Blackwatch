//
//  AGWatchViewController.m
//  Ultimate Blackwatch
//
//  Created by Arvid Gerstmann on 25/05/14.
//  Copyright (c) 2014 Arvid Gerstmann. All rights reserved.
//

#import "AGWatchViewController.h"
#import "AGHelper.h"

@interface AGWatchViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *watchHandSmall;
@property (weak, nonatomic) IBOutlet UIImageView *watchHandBig;

@property (nonatomic, assign) NSInteger seconds;
@property (nonatomic, assign) NSInteger minutes;
@end

@implementation AGWatchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.seconds = 0;
        self.minutes = 0;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupSecondsTimer];
    [self setupMinutesTimer];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)timerFired:(NSTimer *)timer {
    if (self.seconds < 60) {
        self.seconds++;
    } else {
        self.seconds = 1;
        self.minutes++;
    }

    [self displaySeconds:self.seconds - (60 * self.minutes)];
    if (self.minutes != 0) {
        [self displayMinutes:self.minutes];
    }
}


#pragma mark -
#pragma mark Watch Helper -
- (void)setupSecondsTimer {
    CGRect originalFrame = self.watchHandBig.frame;
    CGPoint anchorInSuperview = CGPointMake(160.0f, 264.0f);
    CGPoint anchor = [self.watchHandBig convertPoint:anchorInSuperview fromView:self.view];
    CGPoint anchorInView = CGPointMake(anchor.x / originalFrame.size.width, anchor.y / originalFrame.size.height);

    self.watchHandBig.layer.anchorPoint = anchorInView;
    self.watchHandBig.frame = originalFrame;
}

- (void)setupMinutesTimer {
    CGRect originalFrame = self.watchHandSmall.frame;
    CGPoint anchorInSuperview = CGPointMake(160.0f, 205.0f);
    CGPoint anchor = [self.watchHandSmall convertPoint:anchorInSuperview fromView:self.view];
    CGPoint anchorInView = CGPointMake(anchor.x / originalFrame.size.width, anchor.y / originalFrame.size.height);

    self.watchHandSmall.layer.anchorPoint = anchorInView;
    self.watchHandSmall.frame = originalFrame;
}

- (void)displaySeconds:(NSInteger)seconds {
    self.watchHandBig.transform = CGAffineTransformMakeRotation(RADIANS((360.0f / 60.0f) * seconds));
}

- (void)displayMinutes:(NSInteger)minutes {
    self.watchHandSmall.transform = CGAffineTransformMakeRotation(RADIANS((360.0f / 30.0f) * minutes));
}
@end
