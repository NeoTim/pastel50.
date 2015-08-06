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
//initwith array state
int gamestate [4][4];
int current_wanted_state [4][4];
int game_level_count;

- (void)viewDidLoad {
    [super viewDidLoad];
    game_level_count = 0;
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
    current_wanted_state[0][0] = arc4random()%2; current_wanted_state[0][1] = arc4random()%2; current_wanted_state[0][2] = arc4random()%2; current_wanted_state[0][3] = arc4random()%2;
    //rand for row 2
    current_wanted_state[1][0] = arc4random()%2; current_wanted_state[1][1] = arc4random()%2; current_wanted_state[1][2] = arc4random()%2; current_wanted_state[1][3] = arc4random()%2;
    //rand for row 3
    current_wanted_state[2][0] = arc4random()%2; current_wanted_state[2][1] = arc4random()%2; current_wanted_state[2][2] = arc4random()%2; current_wanted_state[2][3] = arc4random()%2;
    //rand for row 4
    current_wanted_state[3][0] = arc4random()%2; current_wanted_state[3][1] = arc4random()%2; current_wanted_state[3][2] = arc4random()%2; current_wanted_state[3][3] = arc4random()%2;
    
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

//check function
-(void)check{
    if (gamestate[0][0] == current_wanted_state [0][0] & gamestate[0][1] == current_wanted_state [0][1] & gamestate[0][2] == current_wanted_state [0][2] & gamestate[0][3] == current_wanted_state [0][3]
        & gamestate[1][0] == current_wanted_state [1][0] & gamestate[1][1] == current_wanted_state [1][1] & gamestate[1][2] == current_wanted_state [1][2] & gamestate[1][3] == current_wanted_state [1][3]
        & gamestate[2][0] == current_wanted_state [2][0] & gamestate[2][1] == current_wanted_state [2][1] & gamestate[2][2] == current_wanted_state [2][2] & gamestate[2][3] == current_wanted_state [2][3]
        & gamestate[3][0] == current_wanted_state [3][0] & gamestate[3][1] == current_wanted_state [3][1] & gamestate[3][2] == current_wanted_state [3][2] & gamestate[3][3] == current_wanted_state [3][3] & game_level_count == 2) {
        //game win
        NSLog(@"WIN");
        game_level_count = 0;
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
        [UIView animateWithDuration:1 animations:^{
            _guide_view.alpha = 0;
            _usertap_view.alpha = 0;
            _seconds_unit.alpha = 0;
            _time_disp.alpha = 0;
        }];
        //segue to win view
        
            }
    else if (gamestate[0][0] == current_wanted_state [0][0] & gamestate[0][1] == current_wanted_state [0][1] & gamestate[0][2] == current_wanted_state [0][2] & gamestate[0][3] == current_wanted_state [0][3]
             & gamestate[1][0] == current_wanted_state [1][0] & gamestate[1][1] == current_wanted_state [1][1] & gamestate[1][2] == current_wanted_state [1][2] & gamestate[1][3] == current_wanted_state [1][3]
             & gamestate[2][0] == current_wanted_state [2][0] & gamestate[2][1] == current_wanted_state [2][1] & gamestate[2][2] == current_wanted_state [2][2] & gamestate[2][3] == current_wanted_state [2][3]
             & gamestate[3][0] == current_wanted_state [3][0] & gamestate[3][1] == current_wanted_state [3][1] & gamestate[3][2] == current_wanted_state [3][2] & gamestate[3][3] == current_wanted_state [3][3] & game_level_count < 2){
        //level complete
        NSLog(@"done, %i", game_level_count);
        game_level_count ++;
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
        double delayInSeconds = 1.6;
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
}
@end
