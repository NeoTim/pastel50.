//
//  game2.m
//  pastel50.
//
//  Created by Sean Lim on 10/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "game2.h"

@interface game2 ()

@end

@implementation game2
//initwith array state
int gamestate_game2 [4][4];
int current_wanted_state_game2 [4][4];
//game level count
int game2_level_count;
//timer
NSTimer *timer_game2;
NSTimer *timer_carriedforward_game2;
bool game2didend;
//time values
double time_left_game2  = 35;
double time_count_game2 = 0;
float timecarried_forward;

///////////////////////ALL THE CHRONOS STUFF
//countdown start timer
-(void) gamestart_countdown{
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //this will be executed after 1 seconds
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [_countdown_label setText:@"2"];
            _blurview.alpha        = 0.8;
            _countdown_label.alpha = 0.8;
        }completion:nil];
        double delayInSeconds = 1.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            //this will be executed after 2 seconds
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
-(void) timer_start{
    //start main timer
    timer_game2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timercount) userInfo:nil repeats:YES];
    //start persec timer
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(persec:) userInfo:nil repeats:YES];
}
-(void) extratime {
    //start timer countdown for extra time
    timecarried_forward = timecarried_forward - 0.1;
    [_time_carried_forward_disp setText:[NSString stringWithFormat:@"+ %0.1f", timecarried_forward]];
    //
    if (timecarried_forward == 0 | timecarried_forward < 0) {
        //game is over
        //LOST
        [_time_carried_forward_disp setText:@"0.0"];
        //shake animation
        CAKeyframeAnimation *shake_animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
        shake_animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        shake_animation.duration = 0.6;
        shake_animation.values = @[ @(-20), @(20), @(-20), @(20), @(-10), @(10), @(-5), @(5), @(0) ];
        [_time_dis.layer addAnimation:shake_animation forKey:@"shake"];
        [_usertap_view.layer addAnimation:shake_animation forKey:@"shake"];
        [_guide_view.layer addAnimation:shake_animation forKey:@"shake"];
        //
        NSLog(@"lost the game");
        //kill timer
        [timer_game2 invalidate];
        timer_game2 = nil;
        [timer_carriedforward_game2 invalidate];
        timer_carriedforward_game2 = nil;
        [_time_dis setText:@"0.0"];
        time_count_game2 = 0;
        time_left_game2 = 35;
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
            _guide_view.alpha = 0.0;
        }];
        //get usertap point
        float x, y , width, height;
        x = _usertap_view.frame.origin.x;
        y = _usertap_view.frame.origin.y;
        width = _usertap_view.frame.size.width;
        height = _usertap_view.frame.size.height;
        [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _usertap_view.frame = CGRectMake(x, y + 800, width, height);
            _time_dis.alpha = 0;
            _seconds_unit.alpha = 0;
            _time_carried_forward_disp.alpha = 0;
        }completion:nil];
        //segue to lose view
        [self performSegueWithIdentifier:@"lost" sender:nil];

    }
}
-(void) persec: (NSTimer*)persectimer {
    time_count_game2 ++;
    if (time_count_game2 > 35/2) {
        _progress_view_time.progressTintColor = [UIColor redColor];
    }
    if (time_count_game2 > 25) {
        [UIView animateWithDuration:0.4 animations:^{
            [_time_dis setTextColor:[UIColor redColor]];
        }];
    }
    if (time_count_game2 == 35 | time_count_game2 > 35) {
        //main timer did end
        NSLog(@"main timer did end");
        [_time_dis setText:@"0.0"];
        //kill main timer
        [timer_game2 invalidate];
        timer_game2 = nil;
        [persectimer invalidate];
        persectimer = nil;
        //start extra time
        timer_carriedforward_game2 = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(extratime) userInfo:nil repeats:YES];
        // kill self
        [persectimer invalidate];
        persectimer = nil;
    }

}
-(void)timercount{
    //runs every 0.1 seconds
    time_left_game2 = time_left_game2 - 0.1;
    [_progress_view_time setProgress: (time_left_game2 / 35) animated:YES];
    [_time_dis setText:[NSString stringWithFormat:@"%0.1f", time_left_game2]];

}
///////////////////VDL
- (void)viewDidLoad {
    [super viewDidLoad];
    //set timecount
    time_count_game2 = 0;
    [_time_dis setTextColor:[UIColor blackColor]];
    //
    //get time carried forward
    _time_carried_forward_disp.alpha = 0;
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    timecarried_forward = [defaults floatForKey:@"time_carried_forward"];
    NSLog(@"timecarriedforward is %f", timecarried_forward);
    [_time_carried_forward_disp setText:[NSString stringWithFormat:@"+ %0.1f", timecarried_forward]];
    [UIView animateWithDuration:0.5 animations:^{
        _time_carried_forward_disp.alpha = 1;
    }];
    //
    //init with countdown
    [self gamestart_countdown];
    //
    //timer init
    [_time_dis setText:[NSString stringWithFormat:@"%0.1f", time_left_game2]];
    game2_level_count = 0;
    //init with drawings
    //GUIDEview
    _guide_view.alpha = 0;
    //round image
    self.guide_view.layer.cornerRadius = 15.0f;
    self.guide_view.clipsToBounds = YES;
    //set border
    self.guide_view.layer.borderWidth = 1.0f;
    self.guide_view.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //
    //mainview
    CALayer *layer = self.usertap_view.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor grayColor] CGColor];
    layer.shadowRadius = 10.0f;
    layer.shadowOpacity = 0.60f;
    layer.shadowOffset = CGSizeMake(0, 1);
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
    //init with random
    [self random];
}

-(void)random {
    ////////////////////////////////////////////////////////////////////////////////
    //RANDOM FOR WANTED STATE
    //rand for row 1
    current_wanted_state_game2[0][0] = arc4random()%3;
    current_wanted_state_game2[0][1] = arc4random()%3;
    current_wanted_state_game2[0][2] = arc4random()%3;
    current_wanted_state_game2[0][3] = arc4random()%3;
    //rand for row 2
    current_wanted_state_game2[1][0] = arc4random()%3;
    current_wanted_state_game2[1][1] = arc4random()%3;
    current_wanted_state_game2[1][2] = arc4random()%3;
    current_wanted_state_game2[1][3] = arc4random()%3;
    //rand for row 3
    current_wanted_state_game2[2][0] = arc4random()%3;
    current_wanted_state_game2[2][1] = arc4random()%3;
    current_wanted_state_game2[2][2] = arc4random()%3;
    current_wanted_state_game2[2][3] = arc4random()%3;
    //rand for row 4
    current_wanted_state_game2[3][0] = arc4random()%3;
    current_wanted_state_game2[3][1] = arc4random()%3;
    current_wanted_state_game2[3][2] = arc4random()%3;
    current_wanted_state_game2[3][3] = arc4random()%3;

    //set guideview
    //////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW1
    if (current_wanted_state_game2[0][0] == 1) {
        [_R1_C1_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else if (current_wanted_state_game2[0][0] == 2){
        [_R1_C1_G setImage:[UIImage imageNamed:@"blu"]];
    }
    else{
        [_R1_C1_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state_game2[0][1] == 1) {
        [_R1_C2_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else if (current_wanted_state_game2[0][1] == 2){
        [_R1_C2_G setImage:[UIImage imageNamed:@"blu"]];
    }
    else{
        [_R1_C2_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state_game2[0][2] == 1) {
        [_R1_C3_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else if (current_wanted_state_game2[0][2] == 2){
        [_R1_C3_G setImage:[UIImage imageNamed:@"blu"]];
    }
    else{
        [_R1_C3_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state_game2[0][3] == 1) {
        [_R1_C4_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else if (current_wanted_state_game2[0][3] == 2){
        [_R1_C4_G setImage:[UIImage imageNamed:@"blu"]];
    }
    else{
        [_R1_C4_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW2
    if (current_wanted_state_game2[1][0] == 1) {
        [_R2_C1_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else if (current_wanted_state_game2[1][0] == 2){
        [_R2_C1_G setImage:[UIImage imageNamed:@"blu"]];
    }
    else{
        [_R2_C1_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state_game2[1][1] == 1) {
        [_R2_C2_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else if (current_wanted_state_game2[1][1] == 2){
        [_R2_C2_G setImage:[UIImage imageNamed:@"blu"]];
    }
    else{
        [_R2_C2_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state_game2[1][2] == 1) {
        [_R2_C3_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else if (current_wanted_state_game2[1][2] == 2){
        [_R2_C3_G setImage:[UIImage imageNamed:@"blu"]];
    }
    else{
        [_R2_C3_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state_game2[1][3] == 1) {
        [_R2_C4_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else if (current_wanted_state_game2[1][3] == 2){
        [_R2_C4_G setImage:[UIImage imageNamed:@"blu"]];
    }
    else{
        [_R2_C4_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW3
    if (current_wanted_state_game2[2][0] == 1) {
        [_R3_C1_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else if (current_wanted_state_game2[2][0] == 2){
        [_R3_C1_G setImage:[UIImage imageNamed:@"blu"]];
    }
    else{
        [_R3_C1_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state_game2[2][1] == 1) {
        [_R3_C2_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else if (current_wanted_state_game2[2][1] == 2){
        [_R3_C2_G setImage:[UIImage imageNamed:@"blu"]];
    }
    else{
        [_R3_C2_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state_game2[2][2] == 1) {
        [_R3_C3_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else if (current_wanted_state_game2[2][2] == 2){
        [_R3_C3_G setImage:[UIImage imageNamed:@"blu"]];
    }
    else{
        [_R3_C3_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state_game2[2][3] == 1) {
        [_R3_C4_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else if (current_wanted_state_game2[2][3] == 2){
        [_R3_C4_G setImage:[UIImage imageNamed:@"blu"]];
    }
    else{
        [_R3_C4_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW4
    if (current_wanted_state_game2[3][0] == 1) {
        [_R4_C1_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else if (current_wanted_state_game2[3][0] == 2){
        [_R4_C1_G setImage:[UIImage imageNamed:@"blu"]];
    }
    else{
        [_R4_C1_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state_game2[3][1] == 1) {
        [_R4_C2_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else if (current_wanted_state_game2[3][1] == 2){
        [_R4_C2_G setImage:[UIImage imageNamed:@"blu"]];
    }
    else{
        [_R4_C2_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state_game2[3][2] == 1) {
        [_R4_C3_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else if (current_wanted_state_game2[3][2] == 2){
        [_R4_C3_G setImage:[UIImage imageNamed:@"blu"]];
    }
    else{
        [_R4_C3_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state_game2[3][3] == 1) {
        [_R4_C4_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else if (current_wanted_state_game2[3][3] == 2){
        [_R4_C4_G setImage:[UIImage imageNamed:@"blu"]];
    }
    else{
        [_R4_C4_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //did animate guideview
    [UIView animateWithDuration:1 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _guide_view.alpha = 1;
    }completion:nil];

    ////////////////////////////////////////////////////////////////////////////////
    //RANDOM FOR GAME STATE
    //rand for row 1
    gamestate_game2[0][0] = arc4random()%3; gamestate_game2[0][1] = arc4random()%3; gamestate_game2[0][2] = arc4random()%3; gamestate_game2[0][3] = arc4random()%3;
    //rand for row 2
    gamestate_game2[1][0] = arc4random()%3; gamestate_game2[1][1] = arc4random()%3; gamestate_game2[1][2] = arc4random()%3; gamestate_game2[1][3] = arc4random()%3;
    //rand for row 3
    gamestate_game2[2][0] = arc4random()%3; gamestate_game2[2][1] = arc4random()%3; gamestate_game2[2][2] = arc4random()%3; gamestate_game2[2][3] = arc4random()%3;
    //rand for row 4
    gamestate_game2[3][0] = arc4random()%3; gamestate_game2[3][1] = arc4random()%3; gamestate_game2[3][2] = arc4random()%3; gamestate_game2[3][3] = arc4random()%3;

    //set MAIN PLAYER VIEW
    //////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW1
    if (gamestate_game2[0][0] == 1) {
        [_R1_C1 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else if (gamestate_game2[0][0] == 2) {
        [_R1_C1 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R1_C1 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game2[0][1] == 1) {
        [_R1_C2 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else if (gamestate_game2[0][1] == 2) {
        [_R1_C2 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R1_C2 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game2[0][2] == 1) {
        [_R1_C3 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else if (gamestate_game2[0][2] == 2) {
        [_R1_C3 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R1_C3 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game2[0][3] == 1) {
        [_R1_C4 setImage:[UIImage imageNamed:@"soliddot"]  forState:UIControlStateNormal];
    }
    else if (gamestate_game2[0][3] == 2) {
        [_R1_C4 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R1_C4 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW2
    if (gamestate_game2[1][0] == 1) {
        [_R2_C1 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else if (gamestate_game2[1][0] == 2) {
        [_R2_C1 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R2_C1 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game2[1][1] == 1) {
        [_R2_C2 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else if (gamestate_game2[1][1] == 2) {
        [_R2_C2 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R2_C2 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game2[1][2] == 1) {
        [_R2_C3 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else if (gamestate_game2[1][2] == 2) {
        [_R2_C3 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R2_C3 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game2[1][3] == 1) {
        [_R2_C4 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else if (gamestate_game2[1][3] == 2) {
        [_R2_C4 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R2_C4 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW3
    if (gamestate_game2[2][0] == 1) {
        [_R3_C1 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else if (gamestate_game2[2][0] == 2) {
        [_R3_C1 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R3_C1 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game2[2][1] == 1) {
        [_R3_C2 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else if (gamestate_game2[2][1] == 2) {
        [_R3_C2 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R3_C2 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game2[2][2] == 1) {
        [_R3_C3 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else if (gamestate_game2[2][2] == 2) {
        [_R3_C3 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R3_C3 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game2[2][3] == 1) {
        [_R3_C4 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else if (gamestate_game2[2][3] == 2) {
        [_R3_C4 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R3_C4 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW4
    if (gamestate_game2[3][0] == 1) {
        [_R4_C1 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else if (gamestate_game2[3][0] == 2) {
        [_R4_C1 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R4_C1 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game2[3][1] == 1) {
        [_R4_C2 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else if (gamestate_game2[3][1] == 2) {
        [_R4_C2 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R4_C2 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game2[3][2] == 1) {
        [_R4_C3 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else if (gamestate_game2[3][2] == 2) {
        [_R4_C3 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R4_C3 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate_game2[3][3] == 1) {
        [_R4_C4 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else if (gamestate_game2[3][3] == 2) {
        [_R4_C4 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else{
        [_R4_C4 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }


}

/////////////BUTTON MAIN IBACTIONS
//row1 IF ROW1 IS MODIFIED, CHECK FOR EQ and bool
- (IBAction)R1_C1:(id)sender{
    if (gamestate_game2[0][0] == 1) {
        //is solid, move to blu
        gamestate_game2[0][0] = 2;
        [_R1_C1 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else if(gamestate_game2[0][0] == 2){
        //is blue, move on to hollow
        gamestate_game2[0][0] = 0;
        [_R1_C1 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else{
        //is hollow, revert to solid
        gamestate_game2[0][0] = 1;
        [_R1_C1 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];
}
- (IBAction)R1_C2:(id)sender{
    if (gamestate_game2[0][1] == 1) {
        //is solid, move to blu
        gamestate_game2[0][1] = 2;
        [_R1_C2 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else if(gamestate_game2[0][1] == 2){
        //is blue, move on to hollow
        gamestate_game2[0][1] = 0;
        [_R1_C2 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else{
        //is hollow, revert to solid
        gamestate_game2[0][1] = 1;
        [_R1_C2 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];
}
- (IBAction)R1_C3:(id)sender{
    if (gamestate_game2[0][2] == 1) {
        //is solid, move to blu
        gamestate_game2[0][2] = 2;
        [_R1_C3 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else if(gamestate_game2[0][2] == 2){
        //is blue, move on to hollow
        gamestate_game2[0][2] = 0;
        [_R1_C3 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else{
        //is hollow, revert to solid
        gamestate_game2[0][2] = 1;
        [_R1_C3 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];

}
- (IBAction)R1_C4:(id)sender{
    if (gamestate_game2[0][3] == 1) {
        //is solid, move to blu
        gamestate_game2[0][3] = 2;
        [_R1_C4 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else if(gamestate_game2[0][3] == 2){
        //is blue, move on to hollow
        gamestate_game2[0][3] = 0;
        [_R1_C4 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else{
        //is hollow, revert to solid
        gamestate_game2[0][3] = 1;
        [_R1_C4 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];

}
//////////////////////////////////////////////////////////////////////////////////////////////////////

//row2
- (IBAction)R2_C1:(id)sender{
    if (gamestate_game2[1][0] == 1) {
        //is solid, move to blu
        gamestate_game2[1][0] = 2;
        [_R2_C1 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else if(gamestate_game2[1][0] == 2){
        //is blue, move on to hollow
        gamestate_game2[1][0] = 0;
        [_R2_C1 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else{
        //is hollow, revert to solid
        gamestate_game2[1][0] = 1;
        [_R2_C1 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];

}
- (IBAction)R2_C2:(id)sender{
    if (gamestate_game2[1][1] == 1) {
        //is solid, move to blu
        gamestate_game2[1][1] = 2;
        [_R2_C2 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else if(gamestate_game2[1][1] == 2){
        //is blue, move on to hollow
        gamestate_game2[1][1] = 0;
        [_R2_C2 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else{
        //is hollow, revert to solid
        gamestate_game2[1][1] = 1;
        [_R2_C2 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];
}
- (IBAction)R2_C3:(id)sender{
    if (gamestate_game2[1][2] == 1) {
        //is solid, move to blu
        gamestate_game2[1][2] = 2;
        [_R2_C3 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else if(gamestate_game2[1][2] == 2){
        //is blue, move on to hollow
        gamestate_game2[1][2] = 0;
        [_R2_C3 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else{
        //is hollow, revert to solid
        gamestate_game2[1][2] = 1;
        [_R2_C3 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];
}
- (IBAction)R2_C4:(id)sender{
    if (gamestate_game2[1][3] == 1) {
        //is solid, move to blu
        gamestate_game2[1][3] = 2;
        [_R2_C4 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else if(gamestate_game2[1][3] == 2){
        //is blue, move on to hollow
        gamestate_game2[1][3] = 0;
        [_R2_C4 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else{
        //is hollow, revert to solid
        gamestate_game2[1][3] = 1;
        [_R2_C4 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];

}
//////////////////////////////////////////////////////////////////////////////////////////////////////

//row3
- (IBAction)R3_C1:(id)sender{
    if (gamestate_game2[2][0] == 1) {
        //is solid, move to blu
        gamestate_game2[2][0] = 2;
        [_R3_C1 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else if(gamestate_game2[2][0] == 2){
        //is blue, move on to hollow
        gamestate_game2[2][0] = 0;
        [_R3_C1 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else{
        //is hollow, revert to solid
        gamestate_game2[2][0] = 1;
        [_R3_C1 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];
}
- (IBAction)R3_C2:(id)sender{
    if (gamestate_game2[2][1] == 1) {
        //is solid, move to blu
        gamestate_game2[2][1] = 2;
        [_R3_C2 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else if(gamestate_game2[2][1] == 2){
        //is blue, move on to hollow
        gamestate_game2[2][1] = 0;
        [_R3_C2 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else{
        //is hollow, revert to solid
        gamestate_game2[2][1] = 1;
        [_R3_C2 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];

}
- (IBAction)R3_C3:(id)sender{
    if (gamestate_game2[2][2] == 1) {
        //is solid, move to blu
        gamestate_game2[2][2] = 2;
        [_R3_C3 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else if(gamestate_game2[2][2] == 2){
        //is blue, move on to hollow
        gamestate_game2[2][2] = 0;
        [_R3_C3 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else{
        //is hollow, revert to solid
        gamestate_game2[2][2] = 1;
        [_R3_C3 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];

}
- (IBAction)R3_C4:(id)sender{
    if (gamestate_game2[2][3] == 1) {
        //is solid, move to blu
        gamestate_game2[2][3] = 2;
        [_R3_C4 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else if(gamestate_game2[2][3] == 2){
        //is blue, move on to hollow
        gamestate_game2[2][3] = 0;
        [_R3_C4 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else{
        //is hollow, revert to solid
        gamestate_game2[2][3] = 1;
        [_R3_C4 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];
}
//////////////////////////////////////////////////////////////////////////////////////////////////////

//row4
- (IBAction)R4_C1:(id)sender{
    if (gamestate_game2[3][0] == 1) {
        //is solid, move to blu
        gamestate_game2[3][0] = 2;
        [_R4_C1 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else if(gamestate_game2[3][0] == 2){
        //is blue, move on to hollow
        gamestate_game2[3][0] = 0;
        [_R4_C1 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else{
        //is hollow, revert to solid
        gamestate_game2[3][0] = 1;
        [_R4_C1 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];
}
- (IBAction)R4_C2:(id)sender{
    if (gamestate_game2[3][1] == 1) {
        //is solid, move to blu
        gamestate_game2[3][1] = 2;
        [_R4_C2 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else if(gamestate_game2[3][1] == 2){
        //is blue, move on to hollow
        gamestate_game2[3][1] = 0;
        [_R4_C2 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else{
        //is hollow, revert to solid
        gamestate_game2[3][1] = 1;
        [_R4_C2 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];
}
- (IBAction)R4_C3:(id)sender{
    if (gamestate_game2[3][2] == 1) {
        //is solid, move to blu
        gamestate_game2[3][2] = 2;
        [_R4_C3 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else if(gamestate_game2[3][2] == 2){
        //is blue, move on to hollow
        gamestate_game2[3][2] = 0;
        [_R4_C3 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else{
        //is hollow, revert to solid
        gamestate_game2[3][2] = 1;
        [_R4_C3 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];

}
- (IBAction)R4_C4:(id)sender{
    if (gamestate_game2[3][3] == 1) {
        //is solid, move to blu
        gamestate_game2[3][3] = 2;
        [_R4_C4 setImage:[UIImage imageNamed:@"blu"] forState:UIControlStateNormal];
    }
    else if(gamestate_game2[3][3] == 2){
        //is blue, move on to hollow
        gamestate_game2[3][3] = 0;
        [_R4_C4 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else{
        //is hollow, revert to solid
        gamestate_game2[3][3] = 1;
        [_R4_C4 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];

}

//CHECK THE FRGN FUCNTIONS
-(void)check{
    if (gamestate_game2[0][0] == current_wanted_state_game2 [0][0] & gamestate_game2[0][1] == current_wanted_state_game2 [0][1] & gamestate_game2[0][2] == current_wanted_state_game2 [0][2] & gamestate_game2[0][3] == current_wanted_state_game2 [0][3]
        & gamestate_game2[1][0] == current_wanted_state_game2 [1][0] & gamestate_game2[1][1] == current_wanted_state_game2 [1][1] & gamestate_game2[1][2] == current_wanted_state_game2 [1][2] & gamestate_game2[1][3] == current_wanted_state_game2 [1][3]
        & gamestate_game2[2][0] == current_wanted_state_game2 [2][0] & gamestate_game2[2][1] == current_wanted_state_game2 [2][1] & gamestate_game2[2][2] == current_wanted_state_game2 [2][2] & gamestate_game2[2][3] == current_wanted_state_game2 [2][3]
        & gamestate_game2[3][0] == current_wanted_state_game2 [3][0] & gamestate_game2[3][1] == current_wanted_state_game2 [3][1] & gamestate_game2[3][2] == current_wanted_state_game2 [3][2] & gamestate_game2[3][3] == current_wanted_state_game2 [3][3] & time_count_game2 < 30 & game2_level_count < 1){
        //level complete
        game2_level_count ++;
        NSLog(@"done, %i", game2_level_count);
        //set game progress indicator
        if (game2_level_count == 1) {
            //set game progress indicator
            [_game_progress setProgress:(0.5) animated:YES];
        }
        else if (game2_level_count == 2){
            //set game progress indicator
            [_game_progress setProgress:(1.0) animated:YES];
        }
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
        //prepare for next rand
        [UIView animateWithDuration:0.8 animations:^{
            _guide_view.alpha = 0.0;
        }];
        //get usertap point
        float x, y , width, height;
        x = _usertap_view.frame.origin.x;
        y = _usertap_view.frame.origin.y;
        width = _usertap_view.frame.size.width;
        height = _usertap_view.frame.size.height;
        [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _usertap_view.frame = CGRectMake(x, y + 800, width, height);
        }completion:nil];
        //have time to switch rand
        double delayInSeconds = 0.7;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            //randomise view
            [self random];
            //re-enable buttons and reset view
            _R1_C1.enabled = YES;
            _R1_C2.enabled = YES;
            _R1_C3.enabled = YES;
            _R1_C4.enabled = YES;
            _R2_C1.enabled = YES;
            _R2_C2.enabled = YES;
            _R2_C3.enabled = YES;
            _R2_C4.enabled = YES;
            _R3_C1.enabled = YES;
            _R3_C2.enabled = YES;
            _R3_C3.enabled = YES;
            _R3_C4.enabled = YES;
            _R4_C1.enabled = YES;
            _R4_C2.enabled = YES;
            _R4_C3.enabled = YES;
            _R4_C4.enabled = YES;
            //
            //bring userview back
            double delayInSeconds = 0.2;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    _usertap_view.frame = CGRectMake(x, y, width, height);
                }completion:nil];
            });
        });
    }
    else if (gamestate_game2[0][0] == current_wanted_state_game2 [0][0] & gamestate_game2[0][1] == current_wanted_state_game2 [0][1] & gamestate_game2[0][2] == current_wanted_state_game2 [0][2] & gamestate_game2[0][3] == current_wanted_state_game2 [0][3]
             & gamestate_game2[1][0] == current_wanted_state_game2 [1][0] & gamestate_game2[1][1] == current_wanted_state_game2 [1][1] & gamestate_game2[1][2] == current_wanted_state_game2 [1][2] & gamestate_game2[1][3] == current_wanted_state_game2 [1][3]
             & gamestate_game2[2][0] == current_wanted_state_game2 [2][0] & gamestate_game2[2][1] == current_wanted_state_game2 [2][1] & gamestate_game2[2][2] == current_wanted_state_game2 [2][2] & gamestate_game2[2][3] == current_wanted_state_game2 [2][3]
             & gamestate_game2[3][0] == current_wanted_state_game2 [3][0] & gamestate_game2[3][1] == current_wanted_state_game2 [3][1] & gamestate_game2[3][2] == current_wanted_state_game2 [3][2] & gamestate_game2[3][3] == current_wanted_state_game2 [3][3] & game2_level_count == 1){
        //stop game, user has done 2 in 30 secs
        game2_level_count = 0;
        //kill game
        [timer_game2 invalidate];
        timer_game2 = nil;
        time_count_game2 = 0;
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
            _guide_view.alpha = 0.0;
        }];
        //get usertap point
        float x, y , width, height;
        x      = _usertap_view.frame.origin.x;
        y      = _usertap_view.frame.origin.y;
        width  = _usertap_view.frame.size.width;
        height = _usertap_view.frame.size.height;
        [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _usertap_view.frame              = CGRectMake(x, y + 800, width, height);
            _time_dis.alpha                  = 0;
            _seconds_unit.alpha              = 0;
            _time_carried_forward_disp.alpha = 0;
        }completion:nil];
        //segue to next view
        double delayInSeconds = 1.8;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            //this will be executed after 1 seconds
            [self performSegueWithIdentifier:@"2-3" sender:nil];
        });
    }
}
@end
