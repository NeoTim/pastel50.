//
//  Main_Menu_Launchpad.m
//  pastel50.
//
//  Created by Sean Lim on 12/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "Main_Menu_Launchpad.h"
#import <UIKit/UIKit.h>
#import "AVFoundation/AVAudioPlayer.h"
#import <AudioToolbox/AudioToolbox.h>
@interface Main_Menu_Launchpad ()

@end

@implementation Main_Menu_Launchpad
int x_high, y_high, height_high, width_high;
- (void)viewDidLoad {
    //init with highscore view
    x_high = self.highscore_view.frame.origin.x;
    y_high = self.highscore_view.frame.origin.y;
    height_high = self.highscore_view.frame.size.height;
    width_high = self.highscore_view.frame.size.width;
    self.highscore_view.layer.cornerRadius = 15.0f;
    [_highscore_view clipsToBounds];
    CALayer *card_layer_ = self.highscore_view.layer;
    card_layer_.shadowOffset  = CGSizeMake(1, 1);
    card_layer_.shadowColor   = [[UIColor grayColor] CGColor];
    card_layer_.shadowRadius  = 10.0f;
    card_layer_.shadowOpacity = 0.60f;
    card_layer_.shadowPath    = [[UIBezierPath bezierPathWithRect:_highscore_view.bounds] CGPath];
    _highscore_view.frame = CGRectMake(x_high, -height_high -10, width_high, height_high);
    //
    CALayer *main = self.main_view.layer;
    main.shadowOffset  = CGSizeMake(1, 1);
    main.shadowColor   = [[UIColor grayColor] CGColor];
    main.shadowRadius  = 10.0f;
    main.shadowOpacity = 0.60f;
    main.shadowPath    = [[UIBezierPath bezierPathWithRect:_main_view.bounds] CGPath];
    //
    _level_3.enabled = NO;
    [super viewDidLoad];
    //init buttons
    _level_2.alpha = 0;
    _level_3.alpha = 0;
    _level_4.alpha = 0;
    _highscore_button.alpha = 0;
    [UIView animateWithDuration:0.4 animations:^{
        _highscore_button.alpha = 1;
    }];
    //fetch completion ints
    int  lvl_2, lvl_3, lvl_4, lvl_5;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    lvl_2 = [defaults integerForKey :@"level_2"];
    lvl_3 = [defaults integerForKey :@"level_3"];
    lvl_4 = [defaults integerForKey :@"level_4"];
    lvl_5 = [defaults integerForKey :@"level_5"];
    //run integer thorugh sockets to check for completion
    if (lvl_2 == 1) {
        _level_2.enabled = YES;
    }
    else{
        _level_2.enabled = YES;
    }
    //
    if (lvl_3 == 1) {
        ///**** TEMP  NO *****///
        _level_3.enabled = NO;
        
    }
    else{
        _level_3.enabled = NO;
    }
}
-(void)viewDidAppear:(BOOL)animated{
    //init with uibutton transition
    //button 2 level 2
    [UIView transitionWithView:_level_2 duration:0.2 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        _level_2.alpha = 1;
    }completion:nil];
    //button 3 level 3
    [UIView transitionWithView:_level_3 duration:0.3 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        _level_3.alpha = 1;
    }completion:nil];
    //button 4 level 4
    [UIView transitionWithView:_level_4 duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        _level_4.alpha = 1;
    }completion:nil];
    
}
- (IBAction)level_1:(id)sender {
    //play UISound
    NSString *click = [[NSBundle mainBundle]pathForResource:@"click" ofType:@"mp3"];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:click] error:NULL];
    //play sounds
    audioPlayer.numberOfLoops = 1;
    [audioPlayer play];
    //segue to level 1
    //done on storyboard
}
- (IBAction)level2:(id)sender {
    //play UISound
    NSString *click = [[NSBundle mainBundle]pathForResource:@"click" ofType:@"mp3"];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:click] error:NULL];
    //play sounds
    audioPlayer.numberOfLoops = 1;
    [audioPlayer play];
    //segue to level 2
    //done on storyboard
}
- (IBAction)settings_button:(id)sender {
    //play UISound
    NSString *click = [[NSBundle mainBundle]pathForResource:@"click" ofType:@"mp3"];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:click] error:NULL];
    //play sounds
    audioPlayer.numberOfLoops = 1;
    [audioPlayer play];
    //segue to settings view
}
- (IBAction)level_4:(id)sender {
    //play UISound
    NSString *click = [[NSBundle mainBundle]pathForResource:@"click" ofType:@"mp3"];
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:click] error:NULL];
    //play sounds
    audioPlayer.numberOfLoops = 1;
    [audioPlayer play];
    //segue to settings view
}
- (IBAction)highscore_button:(id)sender {
    //init with highscore views
    //did animate highscore view
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _highscore_view.frame = CGRectMake(x_high, y_high, width_high, height_high);
    }completion:nil];
    
    //push highscre values
    //colorblind
   [_colorblind_sc setText:[NSString stringWithFormat:@"%ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"game4_highscore"]]];
    //sg50
    [_SG50_sc setText:[NSString stringWithFormat:@"%0.1f", [[NSUserDefaults standardUserDefaults] floatForKey:@"1_fast_tim"]]];
    //changi
    [_changi_sc setText:[NSString stringWithFormat:@"%0.1f", [[NSUserDefaults standardUserDefaults]floatForKey:@"2_fast_tim"]]];
    
}

- (IBAction)back:(id)sender {
    //return to main view
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _highscore_view.frame = CGRectMake(x_high, -height_high - 10, width_high, height_high);
    }completion:nil];
}
@end
