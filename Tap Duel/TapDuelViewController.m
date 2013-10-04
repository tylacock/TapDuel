//
//  TapDuelViewController.m
//  Tap Duel
//
//  Created by Ty Lacock on 7/21/13.
//  Copyright (c) 2013 Ty Lacock. All rights reserved.
//

#import "TapDuelViewController.h"

@interface TapDuelViewController ()

@end

@implementation TapDuelViewController

// Synthesize
@synthesize playerOneScore;
@synthesize playerTwoScore;

@synthesize timeLabel;

@synthesize p1RoundScoreLabel;
@synthesize p2RoundScoreLabel;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Rotates label 180 degrees
    //playerTwoScore.transform = CGAffineTransformMakeRotation (3.14/1);
    //p2ScoreLabel.transform = CGAffineTransformMakeRotation (3.14/1);
    
    // Sets up a new game on load
    [self setupGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupGame
{
    // Resets score, time and labels
    p1Score = 0;
    p2Score = 0;
    seconds = 11;
    countDownSeconds = 4;
    
    playerOneScore.text = [NSString stringWithFormat:@"%d", p1Score];
    playerTwoScore.text = [NSString stringWithFormat:@"%d", p2Score];
    
    timeLabel.text = [NSString stringWithFormat:@"%d", seconds - 1];
    
    
}




// ---- Method for player one ----- //
- (IBAction)playerOnePress:(id)sender
{
    if (timer) {
        p1Score++;
        playerOneScore.text = [NSString stringWithFormat:@"%d", p1Score];
    }
}

// ---- Method for player two ----- //
- (IBAction)playerTwoPress:(id)sender
{
    if (timer) {
        p2Score++;
        playerTwoScore.text = [NSString stringWithFormat:@"%d", p2Score];
    }
    
}


// ----  Starts the round ---- //
- (IBAction)startRound:(id)sender {
    if (countDownTimer == nil) {
        // Creates a timer
        countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                 target:self
                                               selector:@selector(countDownStart)
                                               userInfo:nil
                                                repeats:YES];
    }
}

- (IBAction)clear:(id)sender
{
    p1RoundScore = 0;
    p1RoundScoreLabel.text = [NSString stringWithFormat:@"%i", p1RoundScore];
    
    p2RoundScore = 0;
    p2RoundScoreLabel.text = [NSString stringWithFormat:@"%i", p2RoundScore];
}


// ---- Subtracts time and alerts when over ---- //
-(void)subtractTime
{
    seconds--;
    timeLabel.text = [NSString stringWithFormat:@"%d", seconds];
    
    if (seconds == 0) {
        [timer invalidate];
        timer = nil;
        
        
        if (p1Score > p2Score) {
            winner = @"Player One Wins!!!";
            p1RoundScore++;
            p1RoundScoreLabel.text = [NSString stringWithFormat:@"%i", p1RoundScore];
            
        } else if (p2Score > p1Score) {
            winner = @"Player Two Wins!!!";
            p2RoundScore++;
            p2RoundScoreLabel.text = [NSString stringWithFormat:@"%i", p2RoundScore];
            
        } else {
            winner = @"IT WAS A TIE!!!";
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Round Over"
                                                        message:[NSString stringWithFormat:@"Player 1 scored %i times.\nPlayer 2 scored %i times\n%@", p1Score, p2Score, winner]
                                                       delegate:self
                                              cancelButtonTitle:@"Play Again"
                                              otherButtonTitles: nil];
        [alert show];
    }
}


// ---- Starts the initial countdown and calls the roundStart ---- //
- (void)countDownStart
{
    countDownSeconds--;
    timeLabel.text = [NSString stringWithFormat:@"%d", countDownSeconds];
    
    if (countDownSeconds == 1) {
        [countDownTimer invalidate];
        countDownTimer = nil;
        
        if (timer == nil) {
            // Creates a timer
            timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                     target:self
                                                   selector:@selector(subtractTime)
                                                   userInfo:nil
                                                    repeats:YES];
        }

    }
    
    
}

// Alert delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self setupGame];
}


@end
