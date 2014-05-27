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

#pragma mark - Outlets -
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (weak, nonatomic) IBOutlet UIImageView *watchHandSmall;
@property (weak, nonatomic) IBOutlet UIImageView *watchHandBig;


#pragma mark - Properties -
@property (nonatomic, assign) BOOL timerRunning;
@property (nonatomic, strong) NSTimer *currentTimer;
@property (nonatomic, assign) NSInteger minutes;
@property (nonatomic, assign) NSInteger seconds;
@property (nonatomic, assign) NSInteger milliseconds;


#pragma mark - Actions -
- (IBAction)startAction:(id)sender;

@end

@implementation AGWatchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.timerRunning = NO;
        self.minutes = 0;
        self.seconds = 0;
        self.milliseconds = 0;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Setup.
    [self setupSecondsTimer];
    [self setupMinutesTimer];
    [self.startButton setTitle:NSLocalizedString(@"start", nil) forState:UIControlStateNormal];

    // Set Countdown.
    self.minutes = 1;
    self.seconds = 10;
    self.milliseconds = 0;
    [self displayMinutes:self.minutes seconds:self.seconds milliseconds:self.milliseconds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark Actions -
- (IBAction)startAction:(id)sender {
    if (!self.timerRunning) {
        self.timerRunning = YES;
        self.currentTimer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(countDown:) userInfo:nil repeats:YES];
        [self.startButton setTitle:NSLocalizedString(@"stop", nil) forState:UIControlStateNormal];
    } else {
        self.timerRunning = NO;
        [self.currentTimer invalidate];
        [self.startButton setTitle:NSLocalizedString(@"start", nil) forState:UIControlStateNormal];
    }
}


#pragma mark -
#pragma mark Timer -
- (void)countDown:(NSTimer *)timer {
    if (self.seconds == 0 && self.minutes == 0) {
        [timer invalidate];
        self.timerRunning = NO;
        return;
    }

    if (self.milliseconds > 0) {
        self.milliseconds--;
    } else {
        self.milliseconds = 999;
        if (self.seconds > 0) {
            self.seconds--;
        } else {
            self.seconds = 59;
            self.minutes--;
        }
    }

    [self displayMinutes:self.minutes seconds:self.seconds milliseconds:self.milliseconds];
}

- (void)countUp:(NSTimer *)timer {
    if (self.seconds < 60) {
        self.seconds++;
    } else {
        self.seconds = 1;
        self.minutes++;
    }

    [self displayMinutes:self.minutes seconds:self.seconds milliseconds:self.milliseconds];
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

- (void)displayMinutes:(NSInteger)minutes seconds:(NSInteger)seconds milliseconds:(NSInteger)milliseconds {
    [self displaySeconds:seconds - (60 * minutes) milliseconds:milliseconds];
    [self displayMinutes:minutes];

    NSString *hoursStr = [NSString stringWithFormat:@"00"];
    NSString *minutesStr = [NSString stringWithFormat:@"%02zd", minutes];
    NSString *secondsStr = [NSString stringWithFormat:@"%02zd", seconds];
    NSString *millisecondsStr = [NSString stringWithFormat:@"%03zd", milliseconds];
    NSString *fullStr = [NSString stringWithFormat:@"%@:%@:%@.%@", hoursStr, minutesStr, secondsStr, millisecondsStr];
    self.timeLabel.text = fullStr;
}

- (void)displaySeconds:(NSInteger)seconds milliseconds:(NSInteger)milliseconds {
    NSInteger radian = (360.0f / 60.0f) * seconds + (((360.0f / 60.0f) / 1000.0f) * milliseconds);
    self.watchHandBig.transform = CGAffineTransformMakeRotation(RADIANS(radian));
}

- (void)displayMinutes:(NSInteger)minutes {
    self.watchHandSmall.transform = CGAffineTransformMakeRotation(RADIANS((360.0f / 30.0f) * minutes));
}
@end
