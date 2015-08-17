//
//  game1.m
//  pastel50.
//
//  Created by Sean Lim on 5/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "game1.h"

@interface game1 ()

@end

@implementation game1
bool didplay_before;
//initwith array state
int gamestate [4][4];
int current_wanted_state [4][4];
//game level count
int game_level_count;
//bool
bool didwin;
//timer
NSTimer *timer;
double time_left = 30;
double time_count = 0;
//headsup init
int x,y,width,height;
///////////////////////ALL THE CHRONOS STUFF
//countdown start timer
-(void) gamestart_countdown{
    //set shadow
    _circle_countdown.layer.cornerRadius = self.circle_countdown.frame.size.width/2;
    self.circle_countdown.clipsToBounds = YES;
    CALayer *circle_layer      = _circle_countdown.layer;
    circle_layer.shadowOffset  = CGSizeMake(2, 2);
    circle_layer.shadowRadius  = 15.0f ;
    circle_layer.shadowColor   = [UIColor blackColor].CGColor;
    circle_layer.shadowOpacity = 0.8f;
    circle_layer.shadowPath    = [[UIBezierPath bezierPathWithRect:_circle_countdown.bounds]CGPath];
  //get bool for first time
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  didplay_before = [defaults boolForKey:@"didplay"];
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //this will be executed after 1 seconds
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            [_countdown_start_label setText:@"2"];
            _countdown_blurview.alpha = 0.8;
            //didplay_before
            if (didplay_before == YES) {
              //initwith tut
                [_tutorial_label setText:@"Tap the dots to change their color"];

            }
            else{
                didplay_before = YES;
                [defaults setBool:didplay_before forKey:@"didplay"];
            }
        }completion:nil];
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            //this will be executed after 2 seconds
            [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                [_countdown_start_label setText:@"1"];
                _countdown_blurview.alpha = 0.7;
                if (didplay_before == YES) {
                  //initwith tut
                    [_tutorial_label setText:@"Complete all of the sets within the time limit"];
                }
                else{
                  didplay_before = YES;
                    [defaults setBool:didplay_before forKey:@"didplay"];

                }
            }completion:nil];
            double delayInSeconds = 2.0;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                //this will be executed after 3 seconds
                [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    _countdown_blurview.alpha = 0;
                    if (didplay_before == YES) {
                      //initwith tut
                        [_tutorial_label setText:@""];

                    }
                    else{
                    didplay_before = YES;
                    [defaults setBool:didplay_before forKey:@"didplay"];
                    }
                }completion:nil];
                [self timer_start];
            });
        });
    });
}
-(void) timer_start{
    //start main timer
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timercount) userInfo:nil repeats:YES];
    //start persec timer
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(persec:) userInfo:nil repeats:YES];
}
-(void) persec: (NSTimer*)persectimer {
    time_count ++;
    if (time_count > 15) {
        _progress_view_time.progressTintColor = [UIColor redColor];
    }
    if (time_count > 20) {
        [_time_disp setTextColor:[UIColor redColor]];
    }
    if (time_count == 30) {
        //LOST
        //shake animation
        CAKeyframeAnimation *shake_animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
        shake_animation.timingFunction       = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        shake_animation.duration             = 0.6;
        shake_animation.values               = @[ @(-20), @(20), @(-20), @(20), @(-10), @(10), @(-5), @(5), @(0) ];
        [_time_disp.layer addAnimation:shake_animation forKey:@"shake"];
        [_usertap_view.layer addAnimation:shake_animation forKey:@"shake"];
        [_guide_view.layer addAnimation:shake_animation forKey:@"shake"];
        //
        NSLog(@"lost the game");
        [timer invalidate];
        timer = nil;
        [persectimer invalidate];
        persectimer = nil;
        [_time_disp setText:@"0.0"];
        time_count = 0;
        time_left = 30;
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
            _usertap_view.frame       = CGRectMake(x, y + 800, width, height);
            _time_disp.alpha          = 0;
            _seconds_unit.alpha       = 0;
            _progress_view_time.alpha = 0;
        }completion:nil];
        double delayInSeconds = 1.5;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            //segue to lose view
            [self performSegueWithIdentifier:@"lost" sender:nil];
        });
        

    }
    if (didwin == true) {
        didwin = false;
        [persectimer invalidate];
        persectimer = nil;
    }
}
-(void)timercount{
    //runs every 0.1 seconds
    time_left = time_left - 0.1;
    [_progress_view_time setProgress: (time_left / 30) animated:YES];
    [_time_disp setText:[NSString stringWithFormat:@"%0.1f", time_left]];


}

///////////////////VDL
- (void)viewDidLoad {
    [super viewDidLoad];
    //initwith achieve view
    x      = self.headsup_view_container.frame.origin.x;
    y      = self.headsup_view_container.frame.origin.y;
    width  = self.headsup_view_container.frame.size.width;
    height = self.headsup_view_container.frame.size.height;
    //shadows for the achieve view
    CALayer *layer1      = self.headsup_view_container.layer;
    layer1.shadowColor   = [[UIColor grayColor] CGColor];
    layer1.shadowRadius  = 10.0f;
    layer1.shadowOpacity = 0.50f;
    layer1.shadowOffset  = CGSizeMake(1, 1);
    layer1.shadowPath    = [[UIBezierPath bezierPathWithRect:_headsup_view_container.bounds] CGPath];
    //set frame
    self.headsup_view_container.frame = CGRectMake(x, -height -10, width, height);
    //initwith main game
    [_time_disp setTextColor:[UIColor blackColor]];
    //timer init
    [self gamestart_countdown];
    [_time_disp setText:[NSString stringWithFormat:@"%0.1f", time_left]];
    game_level_count = 0;
    didwin = false;
    //init with drawings
    //GUIDEview
    _guide_view.alpha = 0;
    //round image
    self.guide_view.layer.cornerRadius = 15.0f;
    self.guide_view.clipsToBounds      = YES;
    //set border
    self.guide_view.layer.borderWidth = 1.0f;
    self.guide_view.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //
    //mainview
    CALayer *layer      = self.usertap_view.layer;
    layer.shadowOffset  = CGSizeMake(1, 1);
    layer.shadowColor   = [[UIColor grayColor] CGColor];
    layer.shadowRadius  = 10.0f;
    layer.shadowOpacity = 0.60f;
    layer.shadowOffset  = CGSizeMake(0, 1);
    layer.shadowPath    = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
    //init with random
    [self random];
}

-(void)random {
    ////////////////////////////////////////////////////////////////////////////////
    //RANDOM FOR WANTED STATE
    //rand for row 1
    current_wanted_state[0][0] = arc4random()%2;
    current_wanted_state[0][1] = arc4random()%2;
    current_wanted_state[0][2] = arc4random()%2;
    current_wanted_state[0][3] = arc4random()%2;
    //rand for row 2
    current_wanted_state[1][0] = arc4random()%2;
    current_wanted_state[1][1] = arc4random()%2;
    current_wanted_state[1][2] = arc4random()%2;
    current_wanted_state[1][3] = arc4random()%2;
    //rand for row 3
    current_wanted_state[2][0] = arc4random()%2;
    current_wanted_state[2][1] = arc4random()%2;
    current_wanted_state[2][2] = arc4random()%2;
    current_wanted_state[2][3] = arc4random()%2;
    //rand for row 4
    current_wanted_state[3][0] = arc4random()%2;
    current_wanted_state[3][1] = arc4random()%2;
    current_wanted_state[3][2] = arc4random()%2;
    current_wanted_state[3][3] = arc4random()%2;

    //set guideview
    //////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW1
    if (current_wanted_state[0][0] == 1) {
        [_R1_C1_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else{
        [_R1_C1_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state[0][1] == 1) {
        [_R1_C2_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else{
        [_R1_C2_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state[0][2] == 1) {
        [_R1_C3_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else{
        [_R1_C3_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state[0][3] == 1) {
        [_R1_C4_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else{
        [_R1_C4_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
//////////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW2
    if (current_wanted_state[1][0] == 1) {
        [_R2_C1_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else{
        [_R2_C1_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state[1][1] == 1) {
        [_R2_C2_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else{
        [_R2_C2_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state[1][2] == 1) {
        [_R2_C3_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else{
        [_R2_C3_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state[1][3] == 1) {
        [_R2_C4_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else{
        [_R2_C4_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
//////////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW3
    if (current_wanted_state[2][0] == 1) {
        [_R3_C1_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else{
        [_R3_C1_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state[2][1] == 1) {
        [_R3_C2_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else{
        [_R3_C2_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state[2][2] == 1) {
        [_R3_C3_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else{
        [_R3_C3_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state[2][3] == 1) {
        [_R3_C4_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else{
        [_R3_C4_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
//////////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW4
    if (current_wanted_state[3][0] == 1) {
        [_R4_C1_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else{
        [_R4_C1_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state[3][1] == 1) {
        [_R4_C2_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else{
        [_R4_C2_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state[3][2] == 1) {
        [_R4_C3_G setImage:[UIImage imageNamed:@"soliddot"]];
    }
    else{
        [_R4_C3_G setImage:[UIImage imageNamed:@"hollowdot"]];
    }
    //
    if (current_wanted_state[3][3] == 1) {
        [_R4_C4_G setImage:[UIImage imageNamed:@"soliddot"]];
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
    gamestate[0][0] = arc4random()%2; gamestate[0][1] = arc4random()%2; gamestate[0][2] = arc4random()%2; gamestate[0][3] = arc4random()%2;
    //rand for row 2
    gamestate[1][0] = arc4random()%2; gamestate[1][1] = arc4random()%2; gamestate[1][2] = arc4random()%2; gamestate[1][3] = arc4random()%2;
    //rand for row 3
    gamestate[2][0] = arc4random()%2; gamestate[2][1] = arc4random()%2; gamestate[2][2] = arc4random()%2; gamestate[2][3] = arc4random()%2;
    //rand for row 4
    gamestate[3][0] = arc4random()%2; gamestate[3][1] = arc4random()%2; gamestate[3][2] = arc4random()%2; gamestate[3][3] = arc4random()%2;

    //set MAIN PLAYER VIEW
    //////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW1
    if (gamestate[0][0] == 1) {
        [_R1_C1 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else{
        [_R1_C1 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate[0][1] == 1) {
        [_R1_C2 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else{
        [_R1_C2 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate[0][2] == 1) {
        [_R1_C3 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else{
        [_R1_C3 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate[0][3] == 1) {
        [_R1_C4 setImage:[UIImage imageNamed:@"soliddot"]  forState:UIControlStateNormal];
    }
    else{
        [_R1_C4 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW2
    if (gamestate[1][0] == 1) {
        [_R2_C1 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else{
        [_R2_C1 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate[1][1] == 1) {
        [_R2_C2 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else{
        [_R2_C2 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate[1][2] == 1) {
        [_R2_C3 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else{
        [_R2_C3 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate[1][3] == 1) {
        [_R2_C4 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else{
        [_R2_C4 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW3
    if (gamestate[2][0] == 1) {
        [_R3_C1 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else{
        [_R3_C1 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate[2][1] == 1) {
        [_R3_C2 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else{
        [_R3_C2 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate[2][2] == 1) {
        [_R3_C3 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else{
        [_R3_C3 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate[2][3] == 1) {
        [_R3_C4 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else{
        [_R3_C4 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    //ROW4
    if (gamestate[3][0] == 1) {
        [_R4_C1 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else{
        [_R4_C1 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate[3][1] == 1) {
        [_R4_C2 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else{
        [_R4_C2 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate[3][2] == 1) {
        [_R4_C3 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else{
        [_R4_C3 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    //
    if (gamestate[3][3] == 1) {
        [_R4_C4 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    else{
        [_R4_C4 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }


}

/////////////BUTTON MAIN IBACTIONS
//row1 IF ROW1 IS MODIFIED, CHECK FOR EQ and bool
- (IBAction)R1_C1:(id)sender{
    if (gamestate[0][0] == 1) {
        //is solid, reverse to hollow
        gamestate[0][0] = 0;
        [_R1_C1 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else if(gamestate[0][0] == 0){
        //is hollow, reverse to solid
        gamestate[0][0] = 1;
        [_R1_C1 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];
}
- (IBAction)R1_C2:(id)sender{
    if (gamestate[0][1] == 1) {
        //is solid, reverse to hollow
        gamestate[0][1] = 0;
        [_R1_C2 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else if(gamestate[0][1] == 0){
        //is hollow, reverse to solid
        gamestate[0][1] = 1;
        [_R1_C2 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];
}
- (IBAction)R1_C3:(id)sender{
    if (gamestate[0][2] == 1) {
        //is solid, reverse to hollow
        gamestate[0][2] = 0;
        [_R1_C3 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else if(gamestate[0][2] == 0){
        //is hollow, reverse to solid
        gamestate[0][2] = 1;
        [_R1_C3 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];

}
- (IBAction)R1_C4:(id)sender{
    if (gamestate[0][3] == 1) {
        //is solid, reverse to hollow
        gamestate[0][3] = 0;
        [_R1_C4 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else if(gamestate[0][3] == 0){
        //is hollow, reverse to solid
        gamestate[0][3] = 1;
        [_R1_C4 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];

}
//////////////////////////////////////////////////////////////////////////////////////////////////////

//row2
- (IBAction)R2_C1:(id)sender{
    if (gamestate[1][0] == 1) {
        //is solid, reverse to hollow
        gamestate[1][0] = 0;
        [_R2_C1 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else if(gamestate[1][0] == 0){
        //is hollow, reverse to solid
        gamestate[1][0] = 1;
        [_R2_C1 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];

}
- (IBAction)R2_C2:(id)sender{
    if (gamestate[1][1] == 1) {
        //is solid, reverse to hollow
        gamestate[1][1] = 0;
        [_R2_C2 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else if(gamestate[1][1] == 0){
        //is hollow, reverse to solid
        gamestate[1][1] = 1;
        [_R2_C2 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];
}
- (IBAction)R2_C3:(id)sender{
    if (gamestate[1][2] == 1) {
        //is solid, reverse to hollow
        gamestate[1][2] = 0;
        [_R2_C3 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else if(gamestate[1][2] == 0){
        //is hollow, reverse to solid
        gamestate[1][2] = 1;
        [_R2_C3 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];
}
- (IBAction)R2_C4:(id)sender{
    if (gamestate[1][3] == 1) {
        //is solid, reverse to hollow
        gamestate[1][3] = 0;
        [_R2_C4 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else if(gamestate[1][3] == 0){
        //is hollow, reverse to solid
        gamestate[1][3] = 1;
        [_R2_C4 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];

}
//////////////////////////////////////////////////////////////////////////////////////////////////////

//row3
- (IBAction)R3_C1:(id)sender{
    if (gamestate[2][0] == 1) {
        //is solid, reverse to hollow
        gamestate[2][0] = 0;
        [_R3_C1 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else if(gamestate[2][0] == 0){
        //is hollow, reverse to solid
        gamestate[2][0] = 1;
        [_R3_C1 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];
}
- (IBAction)R3_C2:(id)sender{
    if (gamestate[2][1] == 1) {
        //is solid, reverse to hollow
        gamestate[2][1] = 0;
        [_R3_C2 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else if(gamestate[2][1] == 0){
        //is hollow, reverse to solid
        gamestate[2][1] = 1;
        [_R3_C2 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];

}
- (IBAction)R3_C3:(id)sender{
    if (gamestate[2][2] == 1) {
        //is solid, reverse to hollow
        gamestate[2][2] = 0;
        [_R3_C3 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else if(gamestate[2][2] == 0){
        //is hollow, reverse to solid
        gamestate[2][2] = 1;
        [_R3_C3 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];

}
- (IBAction)R3_C4:(id)sender{
    if (gamestate[2][3] == 1) {
        //is solid, reverse to hollow
        gamestate[2][3] = 0;
        [_R3_C4 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else if(gamestate[2][3] == 0){
        //is hollow, reverse to solid
        gamestate[2][3] = 1;
        [_R3_C4 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];
}
//////////////////////////////////////////////////////////////////////////////////////////////////////

//row4
- (IBAction)R4_C1:(id)sender{
    if (gamestate[3][0] == 1) {
        //is solid, reverse to hollow
        gamestate[3][0] = 0;
        [_R4_C1 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else if(gamestate[3][0] == 0){
        //is hollow, reverse to solid
        gamestate[3][0] = 1;
        [_R4_C1 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];
}
- (IBAction)R4_C2:(id)sender{
    if (gamestate[3][1] == 1) {
        //is solid, reverse to hollow
        gamestate[3][1] = 0;
        [_R4_C2 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else if(gamestate[3][1] == 0){
        //is hollow, reverse to solid
        gamestate[3][1] = 1;
        [_R4_C2 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];
}
- (IBAction)R4_C3:(id)sender{
    if (gamestate[3][2] == 1) {
        //is solid, reverse to hollow
        gamestate[3][2] = 0;
        [_R4_C3 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else if(gamestate[3][2] == 0){
        //is hollow, reverse to solid
        gamestate[3][2] = 1;
        [_R4_C3 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];

}
- (IBAction)R4_C4:(id)sender{
    if (gamestate[3][3] == 1) {
        //is solid, reverse to hollow
        gamestate[3][3] = 0;
        [_R4_C4 setImage:[UIImage imageNamed:@"hollowdot"] forState:UIControlStateNormal];
    }
    else if(gamestate[3][3] == 0){
        //is hollow, reverse to solid
        gamestate[3][3] = 1;
        [_R4_C4 setImage:[UIImage imageNamed:@"soliddot"] forState:UIControlStateNormal];
    }
    //check
    [self check];

}
//////////////////////////////////////////////////////////////////////////////////////////////////////

//CHECK THE FUCNTIONS
-(void)check{
   if (gamestate[0][0] == current_wanted_state [0][0] & gamestate[0][1] == current_wanted_state [0][1] & gamestate[0][2] == current_wanted_state [0][2] & gamestate[0][3] == current_wanted_state [0][3]
             & gamestate[1][0] == current_wanted_state [1][0] & gamestate[1][1] == current_wanted_state [1][1] & gamestate[1][2] == current_wanted_state [1][2] & gamestate[1][3] == current_wanted_state [1][3]
             & gamestate[2][0] == current_wanted_state [2][0] & gamestate[2][1] == current_wanted_state [2][1] & gamestate[2][2] == current_wanted_state [2][2] & gamestate[2][3] == current_wanted_state [2][3]
             & gamestate[3][0] == current_wanted_state [3][0] & gamestate[3][1] == current_wanted_state [3][1] & gamestate[3][2] == current_wanted_state [3][2] & gamestate[3][3] == current_wanted_state [3][3] & time_count < 30 & game_level_count < 2){
        //level complete
        game_level_count ++;
       NSLog(@"done, %i", game_level_count);
       //set game progress indicator
       if (game_level_count == 1) {
           //set game progress indicator
           [_game_progress setProgress:(0.4) animated:YES];
       }
       else if (game_level_count == 2){
           //set game progress indicator
           [_game_progress setProgress:(0.7) animated:YES];
       }
       else if (game_level_count == 3){
           //set game progress indicator
           [_game_progress setProgress:(1) animated:YES];
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
   else if (gamestate[0][0] == current_wanted_state [0][0] & gamestate[0][1] == current_wanted_state [0][1] & gamestate[0][2] == current_wanted_state [0][2] & gamestate[0][3] == current_wanted_state [0][3]
            & gamestate[1][0] == current_wanted_state [1][0] & gamestate[1][1] == current_wanted_state [1][1] & gamestate[1][2] == current_wanted_state [1][2] & gamestate[1][3] == current_wanted_state [1][3]
            & gamestate[2][0] == current_wanted_state [2][0] & gamestate[2][1] == current_wanted_state [2][1] & gamestate[2][2] == current_wanted_state [2][2] & gamestate[2][3] == current_wanted_state [2][3]
            & gamestate[3][0] == current_wanted_state [3][0] & gamestate[3][1] == current_wanted_state [3][1] & gamestate[3][2] == current_wanted_state [3][2] & gamestate[3][3] == current_wanted_state [3][3] & game_level_count == 2 & time_count < 30){
       //did win
       game_level_count = 0;
       didwin = true;
       //kill game
       [timer invalidate];
       timer = nil;
       //
       //set completion for game 2
       if ([[NSUserDefaults standardUserDefaults]integerForKey:@"level_2" ] == 0) {
           //user has unlocked level 2
           [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"level_2"];
           //send levelunlock
           [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"unlocked"];
       }
       else{
           //send levelunlock
           [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"unlocked"];
       }
       //
       time_count = 0;
       time_left = 30;
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
           _usertap_view.frame  = CGRectMake(x, y + 800, width, height);
           _time_disp.alpha     = 0;
           _seconds_unit.alpha  = 0;
           _game_progress.alpha = 0;
       }completion:nil];
       //segue to win view
       double delayInSeconds = 1.8;
       dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
       dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
           [self performSegueWithIdentifier:@"won" sender:nil];
       });
   }
    //run the check for achievements
    [self achievement_check];
}
-(void)achievement_check{
    //detected button state
    if ( gamestate[0][0] == 1 & gamestate[0][1] == 1  & gamestate[0][2] == 1 & gamestate[0][3] == 1
        & gamestate[1][0] == 1 & gamestate[1][1] == 1 & gamestate[1][2] == 1 & gamestate[1][3] == 1
        & gamestate[2][0] == 1 & gamestate[2][1] == 1 & gamestate[2][2] == 1 & gamestate[2][3] == 1
        & gamestate[3][0] == 1 & gamestate[3][1] == 1 & gamestate[3][2] == 1 & gamestate[3][3] == 1) {
        //unlocked all red
        //setbool for achv
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"all_red"];
        //set headsup content
        [_headsup_header setText:@"Achievement Get!"];
        [_headsup_content setText:@"All-Red"];
        //animate down
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _headsup_view_container.frame = CGRectMake(x, y, width, height);
        }completion:nil];
        [UIView animateWithDuration:0.5 delay:1.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            _headsup_view_container.frame = CGRectMake(x, -height - 10, width, height);
        }completion:nil];
    }
}

@end
