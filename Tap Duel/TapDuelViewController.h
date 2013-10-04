//
//  TapDuelViewController.h
//  Tap Duel
//
//  Created by Ty Lacock on 7/21/13.
//  Copyright (c) 2013 Ty Lacock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TapDuelViewController : UIViewController <UIAlertViewDelegate>
{
    int p1Score;
    int p2Score;
    int seconds;
    int countDownSeconds;
    
    int p1RoundScore;
    int p2RoundScore;
    
    NSTimer *countDownTimer;
    NSTimer *timer;
    
    NSString *winner;
}

-(IBAction)playerOnePress:(id)sender;
-(IBAction)playerTwoPress:(id)sender;
-(IBAction)startRound:(id)sender;
-(IBAction)clear:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *playerOneScore;
@property (weak, nonatomic) IBOutlet UILabel *playerTwoScore;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *p1RoundScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *p2RoundScoreLabel;

@end
