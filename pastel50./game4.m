//
//  game4.m
//  pastel50.
//
//  Created by Sean Lim on 18/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "game4.h"
#import <Parse/Parse.h>

//
//  game3.m
//  pastel50.
//
//  Created by Sean Lim on 10/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "game4.h"

@interface game4 ()

@end
@implementation game4
//initwith array state
int gamestate_game4 [4][4];
//
//game level count
int game4_level_count;
//
//timer
NSTimer *timer_game4;
//
//bool
bool didwin_game4;
//
//time values
double time_left_game4  = 35;
//
int button_wanted;
//values for headsup
int x_headsup_game4,y_headsup_game4,width_headsup_game4,height_headsup_game4;
//highscore
int highscore;
///////////////////////ALL THE CHRONOS STUFF
//countdown start timer
-(void) gamestart_countdown{
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //this will be executed after 1 seconds
        [_tut_ setText:@"Look Closely"];
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [_countdown_label setText:@"2"];
            _blurview.alpha        = 0.8;
            _countdown_label.alpha = 0.8;
        }completion:nil];
        double delayInSeconds = 1.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            //this will be executed after 2 seconds
            [_tut_ setText:@"Follow the colors"];
            [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [_countdown_label setText:@"1"];
                _blurview.alpha        = 0.7;
                _countdown_label.alpha = 0.7;
            }completion:nil];
            double delayInSeconds = 1.0;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                //this will be executed after 3 seconds
                [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    _blurview.alpha        = 0;
                    _countdown_label.alpha = 0;
                }completion:nil];
                [self timer_start];
            });
        });
    });
}
//game timer
-(void) timer_start{
    //start main timer
    timer_game4 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timercount) userInfo:nil repeats:YES];
    }
-(void)timercount{
    //runs every 0.1 seconds
    time_left_game4 = time_left_game4 - 0.1;
    [_progress_view_time setProgress: (time_left_game4 / 35) animated:YES];
    [_time_dis setText:[NSString stringWithFormat:@"%0.1f", time_left_game4]];
    //timer did end
    if (time_left_game4 == 0 | time_left_game4 < 0) {
        //timeout
        [audioPlayer stop];
        //run lose sequence
        NSLog(@"main timer did end");
        [_time_dis setText:@"0.0"];
        //kill main timer    ///
        [timer_game4 invalidate];
        timer_game4 = nil;
        ///
        //game is over
        //LOST
        //shake animation
        CAKeyframeAnimation *shake_animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
        shake_animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        shake_animation.duration = 0.6;
        shake_animation.values = @[ @(-20), @(20), @(-20), @(20), @(-10), @(10), @(-5), @(5), @(0) ];
        [_time_dis.layer addAnimation:shake_animation forKey:@"shake"];
        [_usertap_view.layer addAnimation:shake_animation forKey:@"shake"];
        //
        NSLog(@"lost the game");
        //kill timer
        [_time_dis setText:@"0.0"];
        time_left_game4  = 35;
        //erase time carried forward because user has lost
        int a = 0;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:a forKey:@"time_carried_forward"];
        //lockdown
        _R1_C1.enabled = NO;
        _R1_C2.enabled = NO;
        _R1_C3.enabled = NO;
        _R1_C4.enabled = NO;
        _R2_C1.enabled = NO;
        _R2_C2.enabled = NO;
        _R2_C3.enabled = NO;
        _R2_C4.enabled = NO;
        _R3_C1.enabled = NO;
        _R3_C2.enabled = NO;
        _R3_C3.enabled = NO;
        _R3_C4.enabled = NO;
        _R4_C1.enabled = NO;
        _R4_C2.enabled = NO;
        _R4_C3.enabled = NO;
        _R4_C4.enabled = NO;
        [UIView animateWithDuration:0.8 animations:^{
        }];
        //get usertap point
        float x, y , width, height;
        x      = _usertap_view.frame.origin.x;
        y      = _usertap_view.frame.origin.y;
        width  = _usertap_view.frame.size.width;
        height = _usertap_view.frame.size.height;
        [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _usertap_view.frame = CGRectMake(x, y + 800, width, height);
            _time_dis.alpha = 0;
            _seconds_unit.alpha = 0;
        }completion:nil];
        //check for highscore
        if (score > [[NSUserDefaults standardUserDefaults] integerForKey:@"game4_highscore"]) {
            NSLog(@"did highscore");
            [[NSUserDefaults standardUserDefaults]setInteger:score forKey:@"game4_highscore"];
        }
        score = 0;
        //segue to achv view
        [self performSegueWithIdentifier:@"next" sender:self];
    }

}
//
//score for game
int score = 0;
///////////////////VDL
- (void)viewDidLoad {
    [super viewDidLoad];
    //play music
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"sound_setting"] == YES) {
        NSString *music = [[NSBundle mainBundle]pathForResource:@"Music" ofType:@"mp3"];
        audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:music] error:NULL];
        //play sounds
        audioPlayer.numberOfLoops = -1;
        [audioPlayer play];
    }

    //init pause view
    _pauseview_container.alpha = 0;
    //init highscore
    highscore = [[NSUserDefaults standardUserDefaults] integerForKey:@"game4_highscore"];
    //headsup
    //get inital position
    x_headsup_game4 = self.headsup_view_container.frame.origin.x;
    y_headsup_game4 = self.headsup_view_container.frame.origin.y;
    width_headsup_game4 = self.headsup_view_container.frame.size.width;
    height_headsup_game4 = self.headsup_view_container.frame.size.height;
    //animate view to move up
    _headsup_view_container.frame = CGRectMake(x_headsup_game4, -height_headsup_game4 -10, width_headsup_game4, height_headsup_game4);
    //set timecount
    time_left_game4 = 35;
    [_time_dis setTextColor:[UIColor blackColor]];
    //init with countdown
    [self gamestart_countdown];
    //
    //timer init
    [_time_dis setText:[NSString stringWithFormat:@"%0.1f", time_left_game4]];
    //init with drawings
    //
    //mainview
    CALayer *layer = self.usertap_view.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor grayColor] CGColor];
    layer.shadowRadius = 10.0f;
    layer.shadowOpacity = 0.60f;
    layer.shadowOffset = CGSizeMake(0, 1);
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
    // set R1C1 enabled
    _R1_C1.enabled = YES;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    //
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    //
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    //
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;
    //
    [self randomise_images];

}
//socket delegating
-(void)randomise_images{
    ////////////////////////////////////////////////////////////////////////////////
    //RANDOM FOR GAME STATE
    //rand for row 1
    gamestate_game4[0][0] = arc4random()%3; gamestate_game4[0][1] = arc4random()%3; gamestate_game4[0][2] = arc4random()%3; gamestate_game4[0][3] = arc4random()%3;
    //rand for row 2
    gamestate_game4[1][0] = arc4random()%3; gamestate_game4[1][1] = arc4random()%3; gamestate_game4[1][2] = arc4random()%3; gamestate_game4[1][3] = arc4random()%3;
    //rand for row 3
    gamestate_game4[2][0] = arc4random()%3; gamestate_game4[2][1] = arc4random()%3; gamestate_game4[2][2] = arc4random()%3; gamestate_game4[2][3] = arc4random()%3;
    //rand for row 4
    gamestate_game4[3][0] = arc4random()%3; gamestate_game4[3][1] = arc4random()%3; gamestate_game4[3][2] = arc4random()%3; gamestate_game4[3][3] = arc4random()%3;
    
    //set MAIN PLAYER VIEW
    //////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW1
    if (gamestate_game4[0][0] == 1) {
        [_R1_C1 setBackgroundImage:[UIImage imageNamed:@"ellow"] forState:UIControlStateNormal];
    }
    else if (gamestate_game4[0][0] == 2) {
        [_R1_C1 setBackgroundImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R1_C1 setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game4[0][1] == 1) {
        [_R1_C2 setBackgroundImage:[UIImage imageNamed:@"ellow"] forState:UIControlStateNormal];
    }
    else if (gamestate_game4[0][1] == 2) {
        [_R1_C2 setBackgroundImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R1_C2 setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game4[0][2] == 1) {
        [_R1_C3 setBackgroundImage:[UIImage imageNamed:@"ellow"] forState:UIControlStateNormal];
    }
    else if (gamestate_game4[0][2] == 2) {
        [_R1_C3 setBackgroundImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R1_C3 setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game4[0][3] == 1) {
        [_R1_C4 setBackgroundImage:[UIImage imageNamed:@"ellow"]  forState:UIControlStateNormal];
    }
    else if (gamestate_game4[0][3] == 2) {
        [_R1_C4 setBackgroundImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R1_C4 setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW2
    if (gamestate_game4[1][0] == 1) {
        [_R2_C1 setBackgroundImage:[UIImage imageNamed:@"ellow"] forState:UIControlStateNormal];
    }
    else if (gamestate_game4[1][0] == 2) {
        [_R2_C1 setBackgroundImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R2_C1 setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game4[1][1] == 1) {
        [_R2_C2 setBackgroundImage:[UIImage imageNamed:@"ellow"] forState:UIControlStateNormal];
    }
    else if (gamestate_game4[1][1] == 2) {
        [_R2_C2 setBackgroundImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R2_C2 setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game4[1][2] == 1) {
        [_R2_C3 setBackgroundImage:[UIImage imageNamed:@"ellow"] forState:UIControlStateNormal];
    }
    else if (gamestate_game4[1][2] == 2) {
        [_R2_C3 setBackgroundImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R2_C3 setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game4[1][3] == 1) {
        [_R2_C4 setBackgroundImage:[UIImage imageNamed:@"ellow"] forState:UIControlStateNormal];
    }
    else if (gamestate_game4[1][3] == 2) {
        [_R2_C4 setBackgroundImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R2_C4 setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW3
    if (gamestate_game4[2][0] == 1) {
        [_R3_C1 setBackgroundImage:[UIImage imageNamed:@"ellow"] forState:UIControlStateNormal];
    }
    else if (gamestate_game4[2][0] == 2) {
        [_R3_C1 setBackgroundImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R3_C1 setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game4[2][1] == 1) {
        [_R3_C2 setBackgroundImage:[UIImage imageNamed:@"ellow"] forState:UIControlStateNormal];
    }
    else if (gamestate_game4[2][1] == 2) {
        [_R3_C2 setBackgroundImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R3_C2 setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game4[2][2] == 1) {
        [_R3_C3 setBackgroundImage:[UIImage imageNamed:@"ellow"] forState:UIControlStateNormal];
    }
    else if (gamestate_game4[2][2] == 2) {
        [_R3_C3 setBackgroundImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R3_C3 setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game4[2][3] == 1) {
        [_R3_C4 setBackgroundImage:[UIImage imageNamed:@"ellow"] forState:UIControlStateNormal];
    }
    else if (gamestate_game4[2][3] == 2) {
        [_R3_C4 setBackgroundImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R3_C4 setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW4
    if (gamestate_game4[3][0] == 1) {
        [_R4_C1 setBackgroundImage:[UIImage imageNamed:@"ellow"] forState:UIControlStateNormal];
    }
    else if (gamestate_game4[3][0] == 2) {
        [_R4_C1 setBackgroundImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R4_C1 setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game4[3][1] == 1) {
        [_R4_C2 setBackgroundImage:[UIImage imageNamed:@"ellow"] forState:UIControlStateNormal];
    }
    else if (gamestate_game4[3][1] == 2) {
        [_R4_C2 setBackgroundImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R4_C2 setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game4[3][2] == 1) {
        [_R4_C3 setBackgroundImage:[UIImage imageNamed:@"ellow"] forState:UIControlStateNormal];
    }
    else if (gamestate_game4[3][2] == 2) {
        [_R4_C3 setBackgroundImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R4_C3 setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game4[3][3] == 1) {
        [_R4_C4 setBackgroundImage:[UIImage imageNamed:@"ellow"] forState:UIControlStateNormal];
    }
    else if (gamestate_game4[3][3] == 2) {
        [_R4_C4 setBackgroundImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R4_C4 setBackgroundImage:[UIImage imageNamed:@"pink"] forState:UIControlStateNormal];
    }

}
-(void)random_init{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _R1_C1.alpha = 0;
        _R1_C2.alpha = 0;
        _R1_C3.alpha = 0;
        _R1_C4.alpha = 0;
        _R2_C1.alpha = 0;
        _R2_C2.alpha = 0;
        _R2_C3.alpha = 0;
        _R2_C4.alpha = 0;
        _R3_C1.alpha = 0;
        _R3_C2.alpha = 0;
        _R3_C3.alpha = 0;
        _R3_C4.alpha = 0;
        _R4_C1.alpha = 0;
        _R4_C2.alpha = 0;
        _R4_C3.alpha = 0;
        _R4_C4.alpha = 0;
    }completion:nil];
    
    //matirx to set enabled for button grid socket
    if (button_wanted == 0) {
        //#teamOCD
        _R1_C1.enabled = YES;_R1_C2.enabled = NO;_R1_C3.enabled = NO;_R1_C4.enabled = NO;
        //
        _R2_C1.enabled = NO;_R2_C2.enabled = NO;_R2_C3.enabled = NO;_R2_C4.enabled = NO;
        //
        _R3_C1.enabled = NO;_R3_C2.enabled = NO;_R3_C3.enabled = NO;_R3_C4.enabled = NO;
        //
        _R4_C1.enabled = NO;_R4_C2.enabled = NO;_R4_C3.enabled = NO;_R4_C4.enabled = NO;
        //
    }
    else if (button_wanted == 1){
        //#teamOCD
        _R1_C1.enabled = NO;_R1_C2.enabled = YES;_R1_C3.enabled = NO;_R1_C4.enabled = NO;
        //
        _R2_C1.enabled = NO;_R2_C2.enabled = NO;_R2_C3.enabled = NO;_R2_C4.enabled = NO;
        //
        _R3_C1.enabled = NO;_R3_C2.enabled = NO;_R3_C3.enabled = NO;_R3_C4.enabled = NO;
        //
        _R4_C1.enabled = NO;_R4_C2.enabled = NO;_R4_C3.enabled = NO;_R4_C4.enabled = NO;
        //
    }
    else if (button_wanted == 2){
        //#teamOCD
        _R1_C1.enabled = NO;_R1_C2.enabled = NO;_R1_C3.enabled = YES;_R1_C4.enabled = NO;
        //
        _R2_C1.enabled = NO;_R2_C2.enabled = NO;_R2_C3.enabled = NO;_R2_C4.enabled = NO;
        //
        _R3_C1.enabled = NO;_R3_C2.enabled = NO;_R3_C3.enabled = NO;_R3_C4.enabled = NO;
        //
        _R4_C1.enabled = NO;_R4_C2.enabled = NO;_R4_C3.enabled = NO;_R4_C4.enabled = NO;
        //
    }
    else if (button_wanted == 3){
        //#teamOCD
        _R1_C1.enabled = NO;_R1_C2.enabled = NO;_R1_C3.enabled = NO;_R1_C4.enabled = YES;
        //
        _R2_C1.enabled = NO;_R2_C2.enabled = NO;_R2_C3.enabled = NO;_R2_C4.enabled = NO;
        //
        _R3_C1.enabled = NO;_R3_C2.enabled = NO;_R3_C3.enabled = NO;_R3_C4.enabled = NO;
        //
        _R4_C1.enabled = NO;_R4_C2.enabled = NO;_R4_C3.enabled = NO;_R4_C4.enabled = NO;
        //
    }
    else if (button_wanted == 4){
        //#teamOCD
        _R1_C1.enabled = NO;_R1_C2.enabled = NO;_R1_C3.enabled = NO;_R1_C4.enabled = NO;
        //
        _R2_C1.enabled = YES;_R2_C2.enabled = NO;_R2_C3.enabled = NO;_R2_C4.enabled = NO;
        //
        _R3_C1.enabled = NO;_R3_C2.enabled = NO;_R3_C3.enabled = NO;_R3_C4.enabled = NO;
        //
        _R4_C1.enabled = NO;_R4_C2.enabled = NO;_R4_C3.enabled = NO;_R4_C4.enabled = NO;
        //
    }
    else if(button_wanted == 5){
        //#teamOCD
        _R1_C1.enabled = NO;_R1_C2.enabled = NO;_R1_C3.enabled = NO;_R1_C4.enabled = NO;
        //
        _R2_C1.enabled = NO;_R2_C2.enabled = YES;_R2_C3.enabled = NO;_R2_C4.enabled = NO;
        //
        _R3_C1.enabled = NO;_R3_C2.enabled = NO;_R3_C3.enabled = NO;_R3_C4.enabled = NO;
        //
        _R4_C1.enabled = NO;_R4_C2.enabled = NO;_R4_C3.enabled = NO;_R4_C4.enabled = NO;
        //
    }
    else if (button_wanted == 6){
        //#teamOCD
        _R1_C1.enabled = NO;_R1_C2.enabled = NO;_R1_C3.enabled = NO;_R1_C4.enabled = NO;
        //
        _R2_C1.enabled = NO;_R2_C2.enabled = NO;_R2_C3.enabled = YES;_R2_C4.enabled = NO;
        //
        _R3_C1.enabled = NO;_R3_C2.enabled = NO;_R3_C3.enabled = NO;_R3_C4.enabled = NO;
        //
        _R4_C1.enabled = NO;_R4_C2.enabled = NO;_R4_C3.enabled = NO;_R4_C4.enabled = NO;
        //
    }
    else if (button_wanted == 7){
        //#teamOCD
        _R1_C1.enabled = NO;_R1_C2.enabled = NO;_R1_C3.enabled = NO;_R1_C4.enabled = NO;
        //
        _R2_C1.enabled = NO;_R2_C2.enabled = NO;_R2_C3.enabled = NO;_R2_C4.enabled = YES;
        //
        _R3_C1.enabled = NO;_R3_C2.enabled = NO;_R3_C3.enabled = NO;_R3_C4.enabled = NO;
        //
        _R4_C1.enabled = NO;_R4_C2.enabled = NO;_R4_C3.enabled = NO;_R4_C4.enabled = NO;
        //
    }
    else if (button_wanted == 8){
        //#teamOCD
        _R1_C1.enabled = NO;_R1_C2.enabled = NO;_R1_C3.enabled = NO;_R1_C4.enabled = NO;
        //
        _R2_C1.enabled = NO;_R2_C2.enabled = NO;_R2_C3.enabled = NO;_R2_C4.enabled = NO;
        //
        _R3_C1.enabled = YES;_R3_C2.enabled = NO;_R3_C3.enabled = NO;_R3_C4.enabled = NO;
        //
        _R4_C1.enabled = NO;_R4_C2.enabled = NO;_R4_C3.enabled = NO;_R4_C4.enabled = NO;
        //
    }
    else if (button_wanted == 9){
        //#teamOCD
        _R1_C1.enabled = NO;_R1_C2.enabled = NO;_R1_C3.enabled = NO;_R1_C4.enabled = NO;
        //
        _R2_C1.enabled = NO;_R2_C2.enabled = NO;_R2_C3.enabled = NO;_R2_C4.enabled = NO;
        //
        _R3_C1.enabled = NO;_R3_C2.enabled = YES;_R3_C3.enabled = NO;_R3_C4.enabled = NO;
        //
        _R4_C1.enabled = NO;_R4_C2.enabled = NO;_R4_C3.enabled = NO;_R4_C4.enabled = NO;
        //
    }
    else if (button_wanted == 10){
        //#teamOCD
        _R1_C1.enabled = NO;_R1_C2.enabled = NO;_R1_C3.enabled = NO;_R1_C4.enabled = NO;
        //
        _R2_C1.enabled = NO;_R2_C2.enabled = NO;_R2_C3.enabled = NO;_R2_C4.enabled = NO;
        //
        _R3_C1.enabled = NO;_R3_C2.enabled = NO;_R3_C3.enabled = YES;_R3_C4.enabled = NO;
        //
        _R4_C1.enabled = NO;_R4_C2.enabled = NO;_R4_C3.enabled = NO;_R4_C4.enabled = NO;
        //
    }
    else if (button_wanted == 11){
        //#teamOCD
        _R1_C1.enabled = NO;_R1_C2.enabled = NO;_R1_C3.enabled = NO;_R1_C4.enabled = NO;
        //
        _R2_C1.enabled = NO;_R2_C2.enabled = NO;_R2_C3.enabled = NO;_R2_C4.enabled = NO;
        //
        _R3_C1.enabled = NO;_R3_C2.enabled = NO;_R3_C3.enabled = NO;_R3_C4.enabled = YES;
        //
        _R4_C1.enabled = NO;_R4_C2.enabled = NO;_R4_C3.enabled = NO;_R4_C4.enabled = NO;
        //
    }
    else if (button_wanted == 12){
        //#teamOCD
        _R1_C1.enabled = NO;_R1_C2.enabled = NO;_R1_C3.enabled = NO;_R1_C4.enabled = NO;
        //
        _R2_C1.enabled = NO;_R2_C2.enabled = NO;_R2_C3.enabled = NO;_R2_C4.enabled = NO;
        //
        _R3_C1.enabled = NO;_R3_C2.enabled = NO;_R3_C3.enabled = NO;_R3_C4.enabled = NO;
        //
        _R4_C1.enabled = YES;_R4_C2.enabled = NO;_R4_C3.enabled = NO;_R4_C4.enabled = NO;
        //
    }
    else if (button_wanted == 13){
        //#teamOCD
        _R1_C1.enabled = NO;_R1_C2.enabled = NO;_R1_C3.enabled = NO;_R1_C4.enabled = NO;
        //
        _R2_C1.enabled = NO;_R2_C2.enabled = NO;_R2_C3.enabled = NO;_R2_C4.enabled = NO;
        //
        _R3_C1.enabled = NO;_R3_C2.enabled = NO;_R3_C3.enabled = NO;_R3_C4.enabled = NO;
        //
        _R4_C1.enabled = NO;_R4_C2.enabled = YES;_R4_C3.enabled = NO;_R4_C4.enabled = NO;
        //
    }
    else if (button_wanted == 14){
        //#teamOCD
        _R1_C1.enabled = NO;_R1_C2.enabled = NO;_R1_C3.enabled = NO;_R1_C4.enabled = NO;
        //
        _R2_C1.enabled = NO;_R2_C2.enabled = NO;_R2_C3.enabled = NO;_R2_C4.enabled = NO;
        //
        _R3_C1.enabled = NO;_R3_C2.enabled = NO;_R3_C3.enabled = NO;_R3_C4.enabled = NO;
        //
        _R4_C1.enabled = NO;_R4_C2.enabled = NO;_R4_C3.enabled = YES;_R4_C4.enabled = NO;
        //
    }
    else if (button_wanted == 15){
        //#teamOCD
        _R1_C1.enabled = NO;_R1_C2.enabled = NO;_R1_C3.enabled = NO;_R1_C4.enabled = NO;
        //
        _R2_C1.enabled = NO;_R2_C2.enabled = NO;_R2_C3.enabled = NO;_R2_C4.enabled = NO;
        //
        _R3_C1.enabled = NO;_R3_C2.enabled = NO;_R3_C3.enabled = NO;_R3_C4.enabled = NO;
        //
        _R4_C1.enabled = NO;_R4_C2.enabled = NO;_R4_C3.enabled = NO;_R4_C4.enabled = YES;
        //
    }
    [UIView animateWithDuration:0.2 delay:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _R1_C1.alpha = 1;
        _R1_C2.alpha = 1;
        _R1_C3.alpha = 1;
        _R1_C4.alpha = 1;
        _R2_C1.alpha = 1;
        _R2_C2.alpha = 1;
        _R2_C3.alpha = 1;
        _R2_C4.alpha = 1;
        _R3_C1.alpha = 1;
        _R3_C2.alpha = 1;
        _R3_C3.alpha = 1;
        _R3_C4.alpha = 1;
        _R4_C1.alpha = 1;
        _R4_C2.alpha = 1;
        _R4_C3.alpha = 1;
        _R4_C4.alpha = 1;
    }completion:nil];
}
/////////////BUTTON MAIN IBACTIONS
//row1 IF ROW1 IS MODIFIED, CHECK FOR EQ and bool
- (IBAction)R1_C1:(id)sender{
 //rand next button
    int rand = arc4random()%15;
    if (rand == 0) { button_wanted = 1;} else if (rand == 1){button_wanted = 2;} else if (rand == 2){button_wanted = 3;} else if (rand == 3){button_wanted = 4;} else if (rand == 4){button_wanted = 5;} else if (rand == 5){button_wanted = 6;} else if (rand == 6){button_wanted = 7;} else if (rand == 7){button_wanted = 8;} else if (rand == 8){button_wanted = 9;} else if (rand == 9){button_wanted = 10;} else if (rand == 10){button_wanted = 11;} else if (rand == 11){button_wanted = 12;} else if (rand == 12){button_wanted = 13;} else if (rand == 13){button_wanted = 14;}else if (rand == 14){button_wanted = 15;}
    [self random_init];
    //did send log resp
    NSLog(@"Did activate"); score++; [_score_disp setText:[NSString stringWithFormat:@"%i", score]]; [self randomise_images];

}
- (IBAction)R1_C2:(id)sender{
    //rand next button
    int rand = arc4random()%15;
    if (rand == 0) { button_wanted = 0;} else if (rand == 1){button_wanted = 2;} else if (rand == 2){button_wanted = 3;} else if (rand == 3){button_wanted = 4;} else if (rand == 4){button_wanted = 5;} else if (rand == 5){button_wanted = 6;} else if (rand == 6){button_wanted = 7;} else if (rand == 7){button_wanted = 8;} else if (rand == 8){button_wanted = 9;} else if (rand == 9){button_wanted = 10;} else if (rand == 10){button_wanted = 11;} else if (rand == 11){button_wanted = 12;} else if (rand == 12){button_wanted = 13;} else if (rand == 13){button_wanted = 14;}else if (rand == 14){button_wanted = 15;}
    [self random_init];
    //did send log resp
    NSLog(@"Did activate"); score++; [_score_disp setText:[NSString stringWithFormat:@"%i", score]]; [self randomise_images];


}
- (IBAction)R1_C3:(id)sender{
    //rand next button
    int rand = arc4random()%15;
    if (rand == 0) { button_wanted = 0;} else if (rand == 1){button_wanted = 1;} else if (rand == 2){button_wanted = 4;} else if (rand == 3){button_wanted = 5;} else if (rand == 4){button_wanted = 6;} else if (rand == 5){button_wanted = 7;} else if (rand == 6){button_wanted = 8;} else if (rand == 7){button_wanted = 9;} else if (rand == 8){button_wanted = 10;} else if (rand == 9){} else if (rand == 10){button_wanted = 11;} else if (rand == 11){button_wanted = 12;} else if (rand == 12){button_wanted = 13;} else if (rand == 13){button_wanted = 14;}else if (rand == 14){button_wanted = 15;}
    [self random_init];
    //did send log resp
    NSLog(@"Did activate"); score++; [_score_disp setText:[NSString stringWithFormat:@"%i", score]]; [self randomise_images];


}
- (IBAction)R1_C4:(id)sender{
    //rand next button
    int rand = arc4random()%15;
    if (rand == 0) { button_wanted = 0;} else if (rand == 1){button_wanted = 1;} else if (rand == 2){button_wanted = 2;} else if (rand == 3){button_wanted = 3;} else if (rand == 4){button_wanted = 5;} else if (rand == 5){button_wanted = 6;} else if (rand == 6){button_wanted = 7;} else if (rand == 7){button_wanted = 8;} else if (rand == 8){button_wanted = 8;} else if (rand == 9){button_wanted = 10;} else if (rand == 10){button_wanted = 11;} else if (rand == 11){button_wanted = 12;} else if (rand == 12){button_wanted = 13;} else if (rand == 13){button_wanted = 14;}else if (rand == 14){button_wanted = 15;}
    [self random_init];
    //did send log resp
    NSLog(@"Did activate"); score++; [_score_disp setText:[NSString stringWithFormat:@"%i", score]]; [self randomise_images];


}
//////////////////////////////////////////////////////////////////////////////////////////////////////
//row2
- (IBAction)R2_C1:(id)sender{
    //rand next button
    int rand = arc4random()%15;
    if (rand == 0) { button_wanted = 0;} else if (rand == 1){button_wanted = 1;} else if (rand == 2){button_wanted = 2;} else if (rand == 3){button_wanted = 3;} else if (rand == 4){button_wanted = 4;} else if (rand == 5){button_wanted = 6;} else if (rand == 6){button_wanted = 7;} else if (rand == 7){button_wanted = 8;} else if (rand == 8){button_wanted = 9;} else if (rand == 9){button_wanted = 10;} else if (rand == 10){button_wanted = 11;} else if (rand == 11){button_wanted = 12;} else if (rand == 12){button_wanted = 13;} else if (rand == 13){button_wanted = 14;}else if (rand == 14){button_wanted = 15;}
    [self random_init];
    //did send log resp
    NSLog(@"Did activate"); score++; [_score_disp setText:[NSString stringWithFormat:@"%i", score]]; [self randomise_images];


}
- (IBAction)R2_C2:(id)sender{
    //rand next button
    int rand = arc4random()%15;
    if (rand == 0) { button_wanted = 0;} else if (rand == 1){button_wanted = 1;} else if (rand == 2){button_wanted = 2;} else if (rand == 3){button_wanted = 3;} else if (rand == 4){button_wanted = 4;} else if (rand == 5){button_wanted = 5;} else if (rand == 6){button_wanted = 7;} else if (rand == 7){button_wanted = 8;} else if (rand == 8){button_wanted = 9;} else if (rand == 9){button_wanted = 10;} else if (rand == 10){button_wanted = 11;} else if (rand == 11){button_wanted = 12;} else if (rand == 12){button_wanted = 13;} else if (rand == 13){button_wanted = 14;}else if (rand == 14){button_wanted = 15;}
    [self random_init];
    //did send log resp
    NSLog(@"Did activate"); score++; [_score_disp setText:[NSString stringWithFormat:@"%i", score]]; [self randomise_images];


}
- (IBAction)R2_C3:(id)sender{
    //rand next button
    int rand = arc4random()%15;
    if (rand == 0) { button_wanted = 0;} else if (rand == 1){button_wanted = 1;} else if (rand == 2){button_wanted = 2;} else if (rand == 3){button_wanted = 3;} else if (rand == 4){button_wanted = 4;} else if (rand == 5){button_wanted = 5;} else if (rand == 6){button_wanted = 6;} else if (rand == 7){button_wanted = 8;} else if (rand == 8){button_wanted = 9;} else if (rand == 9){button_wanted = 10;} else if (rand == 10){button_wanted = 11;} else if (rand == 11){button_wanted = 12;} else if (rand == 12){button_wanted = 13;} else if (rand == 13){button_wanted = 14;}else if (rand == 14){button_wanted = 15;}
    [self random_init];
    //did send log resp
    NSLog(@"Did activate"); score++; [_score_disp setText:[NSString stringWithFormat:@"%i", score]]; [self randomise_images];


}
- (IBAction)R2_C4:(id)sender{
    //rand next button
    int rand = arc4random()%15;
    if (rand == 0) { button_wanted = 0;} else if (rand == 1){button_wanted = 1;} else if (rand == 2){button_wanted = 2;} else if (rand == 3){button_wanted = 3;} else if (rand == 4){button_wanted = 4;} else if (rand == 5){button_wanted = 5;} else if (rand == 6){button_wanted = 6;} else if (rand == 7){button_wanted = 7;} else if (rand == 8){button_wanted = 9;} else if (rand == 9){button_wanted = 10;} else if (rand == 10){button_wanted = 11;} else if (rand == 11){button_wanted = 12;} else if (rand == 12){button_wanted = 13;} else if (rand == 13){button_wanted = 14;}else if (rand == 14){button_wanted = 15;}
    [self random_init];
    //did send log resp
    NSLog(@"Did activate"); score++; [_score_disp setText:[NSString stringWithFormat:@"%i", score]]; [self randomise_images];


}
//////////////////////////////////////////////////////////////////////////////////////////////////////
//row3
- (IBAction)R3_C1:(id)sender{
    //rand next button
    int rand = arc4random()%15;
    if (rand == 0) { button_wanted = 0;} else if (rand == 1){button_wanted = 1;} else if (rand == 2){button_wanted = 2;} else if (rand == 3){button_wanted = 3;} else if (rand == 4){button_wanted = 4;} else if (rand == 5){button_wanted = 5;} else if (rand == 6){button_wanted = 6;} else if (rand == 7){button_wanted = 7;} else if (rand == 8){button_wanted = 8;} else if (rand == 9){button_wanted = 10;} else if (rand == 10){button_wanted = 11;} else if (rand == 11){button_wanted = 12;} else if (rand == 12){button_wanted = 13;} else if (rand == 13){button_wanted = 14;}else if (rand == 14){button_wanted = 15;}
    [self random_init];
    //did send log resp
    NSLog(@"Did activate"); score++; [_score_disp setText:[NSString stringWithFormat:@"%i", score]]; [self randomise_images];

}
- (IBAction)R3_C2:(id)sender{
    //rand next button
    int rand = arc4random()%15;
    if (rand == 0) { button_wanted = 0;} else if (rand == 1){button_wanted = 1;} else if (rand == 2){button_wanted = 2;} else if (rand == 3){button_wanted = 3;} else if (rand == 4){button_wanted = 4;} else if (rand == 5){button_wanted = 5;} else if (rand == 6){button_wanted = 6;} else if (rand == 7){button_wanted = 7;} else if (rand == 8){button_wanted = 8;} else if (rand == 9){button_wanted = 9;} else if (rand == 10){button_wanted = 11;} else if (rand == 11){button_wanted = 12;} else if (rand == 12){button_wanted = 13;} else if (rand == 13){button_wanted = 14;}else if (rand == 14){button_wanted = 15;}
    [self random_init];
    //did send log resp
    NSLog(@"Did activate"); score++; [_score_disp setText:[NSString stringWithFormat:@"%i", score]]; [self randomise_images];

}
- (IBAction)R3_C3:(id)sender{
    //rand next button
    int rand = arc4random()%15;
    if (rand == 0) { button_wanted = 0;} else if (rand == 1){button_wanted = 1;} else if (rand == 2){button_wanted = 2;} else if (rand == 3){button_wanted = 3;} else if (rand == 4){button_wanted = 4;} else if (rand == 5){button_wanted = 5;} else if (rand == 6){button_wanted = 6;} else if (rand == 7){button_wanted = 7;} else if (rand == 8){button_wanted = 8;} else if (rand == 9){button_wanted = 9;} else if (rand == 10){button_wanted = 10;} else if (rand == 11){button_wanted = 12;} else if (rand == 12){button_wanted = 13;} else if (rand == 13){button_wanted = 14;}else if (rand == 14){button_wanted = 15;}
    [self random_init];
}
- (IBAction)R3_C4:(id)sender{
    //rand next button
    int rand = arc4random()%15;
    if (rand == 0) { button_wanted = 0;} else if (rand == 1){button_wanted = 1;} else if (rand == 2){button_wanted = 2;} else if (rand == 3){button_wanted = 3;} else if (rand == 4){button_wanted = 4;} else if (rand == 5){button_wanted = 5;} else if (rand == 6){button_wanted = 6;} else if (rand == 7){button_wanted = 7;} else if (rand == 8){button_wanted = 8;} else if (rand == 9){button_wanted = 9;} else if (rand == 10){button_wanted = 10;} else if (rand == 11){button_wanted = 12;} else if (rand == 12){button_wanted = 13;} else if (rand == 13){button_wanted = 14;}else if (rand == 14){button_wanted = 15;}
    [self random_init];
    //did send log resp
    NSLog(@"Did activate"); score++; [_score_disp setText:[NSString stringWithFormat:@"%i", score]]; [self randomise_images];

  }
//////////////////////////////////////////////////////////////////////////////////////////////////////

//row4
- (IBAction)R4_C1:(id)sender{
    //rand next button
    int rand = arc4random()%15;
    if (rand == 0) { button_wanted = 0;} else if (rand == 1){button_wanted = 1;} else if (rand == 2){button_wanted = 2;} else if (rand == 3){button_wanted = 3;} else if (rand == 4){button_wanted = 4;} else if (rand == 5){button_wanted = 5;} else if (rand == 6){button_wanted = 6;} else if (rand == 7){button_wanted = 7;} else if (rand == 8){button_wanted = 8;} else if (rand == 9){button_wanted = 9;} else if (rand == 10){button_wanted = 10;} else if (rand == 11){button_wanted = 11;} else if (rand == 12){button_wanted = 12;} else if (rand == 13){button_wanted = 14;}else if (rand == 14){button_wanted = 15;}
    [self random_init];
    //did send log resp
    NSLog(@"Did activate"); score++; [_score_disp setText:[NSString stringWithFormat:@"%i", score]]; [self randomise_images];

   }
- (IBAction)R4_C2:(id)sender{
    //rand next button
    int rand = arc4random()%15;
    if (rand == 0) { button_wanted = 0;} else if (rand == 1){button_wanted = 1;} else if (rand == 2){button_wanted = 2;} else if (rand == 3){button_wanted = 3;} else if (rand == 4){button_wanted = 4;} else if (rand == 5){button_wanted = 5;} else if (rand == 6){button_wanted = 6;} else if (rand == 7){button_wanted = 7;} else if (rand == 8){button_wanted = 8;} else if (rand == 9){button_wanted = 9;} else if (rand == 10){button_wanted = 10;} else if (rand == 11){button_wanted = 11;} else if (rand == 12){button_wanted = 12;} else if (rand == 13){button_wanted = 14;}else if (rand == 14){button_wanted = 15;}
    [self random_init];
    //did send log resp
    NSLog(@"Did activate"); score++; [_score_disp setText:[NSString stringWithFormat:@"%i", score]]; [self randomise_images];

    
}
- (IBAction)R4_C3:(id)sender{
    //rand next button
    int rand = arc4random()%15;
    if (rand == 0) { button_wanted = 0;} else if (rand == 1){button_wanted = 1;} else if (rand == 2){button_wanted = 2;} else if (rand == 3){button_wanted = 3;} else if (rand == 4){button_wanted = 4;} else if (rand == 5){button_wanted = 5;} else if (rand == 6){button_wanted = 6;} else if (rand == 7){button_wanted = 7;} else if (rand == 8){button_wanted = 8;} else if (rand == 9){button_wanted = 9;} else if (rand == 10){button_wanted = 10;} else if (rand == 11){button_wanted = 11;} else if (rand == 12){button_wanted = 12;} else if (rand == 13){button_wanted = 13;}else if (rand == 14){button_wanted = 15;}
    [self random_init];
    //did send log resp
    NSLog(@"Did activate"); score++; [_score_disp setText:[NSString stringWithFormat:@"%i", score]]; [self randomise_images];

    
}
- (IBAction)R4_C4:(id)sender{
    //rand next button
    int rand = arc4random()%15;
    if (rand == 0) { button_wanted = 0;} else if (rand == 1){button_wanted = 1;} else if (rand == 2){button_wanted = 2;} else if (rand == 3){button_wanted = 3;} else if (rand == 4){button_wanted = 4;} else if (rand == 5){button_wanted = 5;} else if (rand == 6){button_wanted = 6;} else if (rand == 7){button_wanted = 7;} else if (rand == 8){button_wanted = 8;} else if (rand == 9){button_wanted = 9;} else if (rand == 10){button_wanted = 10;} else if (rand == 11){button_wanted = 11;} else if (rand == 12){button_wanted = 12;} else if (rand == 13){button_wanted = 13;}else if (rand == 14){button_wanted = 1;}
    [self random_init];
    //did send log resp
    NSLog(@"Did activate"); score++; [_score_disp setText:[NSString stringWithFormat:@"%i", score]]; [self randomise_images];

}
//////////////////////////////////////////////////////////////////////////////////////////////////////
// intit with pause menu
- (IBAction)Quit:(id)sender {
    //pop to root view
    //back
    [UIView animateWithDuration:0.3 animations:^{
        _pauseview_container.alpha = 0;
    }];
    //stop music
    //
    //reset score
    score = 0;
    NSLog(@"back to restart");
    [timer_game4 invalidate];
    timer_game4 = nil;
    //detrigger persec
    didwin_game4 = true;
    [_time_dis setText:@"0.0"];
    time_left_game4 = 35;
    //lockdown
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;
    //get usertap point
    float x, y , width, height;
    x      = _usertap_view.frame.origin.x;
    y      = _usertap_view.frame.origin.y;
    width  = _usertap_view.frame.size.width;
    height = _usertap_view.frame.size.height;
    [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _usertap_view.frame       = CGRectMake(x, y + 800, width, height);
        _time_dis.alpha          = 0;
        _seconds_unit.alpha       = 0;
        _progress_view_time.alpha = 0;
        _pause_button.alpha = 0;
        
    }completion:nil];
    double delayInSeconds = 1.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //pop to previous view
        [self.navigationController popToRootViewControllerAnimated:YES];
    });
    
}

- (IBAction)restart:(id)sender {
    //back
    [UIView animateWithDuration:0.3 animations:^{
        _pauseview_container.alpha = 0;
    }];
    //stop music
    //
    NSLog(@"back to restart");
    [timer_game4 invalidate];
    timer_game4 = nil;
    //detrigger persec
    didwin_game4 = true;
    [_time_dis setText:@"0.0"];
    time_left_game4 = 35;
    score = 0;
    //lockdown
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;
    //get usertap point
    float x, y , width, height;
    x      = _usertap_view.frame.origin.x;
    y      = _usertap_view.frame.origin.y;
    width  = _usertap_view.frame.size.width;
    height = _usertap_view.frame.size.height;
    [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _usertap_view.frame       = CGRectMake(x, y + 800, width, height);
        _time_dis.alpha          = 0;
        _seconds_unit.alpha       = 0;
        _progress_view_time.alpha = 0;
        _pause_button.alpha = 0;
        
    }completion:nil];
    double delayInSeconds = 1.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //pop to previous view
        [self.navigationController popViewControllerAnimated:NO];
    });
    
}
- (IBAction)backto_game:(id)sender {
    [audioPlayer play];
    [UIView animateWithDuration:0.8 animations:^{
        _pauseview_container.alpha = 0;
    }completion:nil];
    //return persec state & timer state
    time_left_game4 = savedtime;
    [self timer_start];
}
int savedtime;
- (IBAction)pause_button:(id)sender {
    [audioPlayer pause];
    //save time stateq
    savedtime = time_left_game4;
    //prevent persec from killing
    didwin_game4 = true;
    //kill timers
    [timer_game4 invalidate];
    timer_game4 = nil;
    //bring up pause menu
    [UIView animateWithDuration:0.8 animations:^{
        _pauseview_container.alpha = 1;
    }];
}


@end

