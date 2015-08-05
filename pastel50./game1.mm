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

- (void)viewDidLoad {
    [super viewDidLoad];
    //init with drawings
    _guide_view.alpha = 0;
    //round image
    self.guide_view.layer.cornerRadius = 15.0f;
    self.guide_view.clipsToBounds = YES;
    //set border
    self.guide_view.layer.borderWidth = 1.0f;
    self.guide_view.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //init with random
    [self random];
}

-(void)random {
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
    [UIView animateWithDuration:1 animations:^{
        _guide_view.alpha = 1;
    }];
}


@end
