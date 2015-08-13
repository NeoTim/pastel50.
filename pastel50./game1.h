//
//  game1.h
//  pastel50.
//
//  Created by Sean Lim on 5/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface game1 : UIViewController

@property (strong, nonatomic) IBOutlet UILabel            *time_disp;
@property (strong, nonatomic) IBOutlet UILabel            *seconds_unit;

//MAIN USER TAP
@property (strong, nonatomic) IBOutlet UIView             *usertap_view;
@property (strong, nonatomic) IBOutlet UIButton           *R1_C1;
@property (strong, nonatomic) IBOutlet UIButton           *R1_C2;
@property (strong, nonatomic) IBOutlet UIButton           *R1_C3;
@property (strong, nonatomic) IBOutlet UIButton           *R1_C4;
//row2
@property (strong, nonatomic) IBOutlet UIButton           *R2_C1;
@property (strong, nonatomic) IBOutlet UIButton           *R2_C2;
@property (strong, nonatomic) IBOutlet UIButton           *R2_C3;
@property (strong, nonatomic) IBOutlet UIButton           *R2_C4;
//row3
@property (strong, nonatomic) IBOutlet UIButton           *R3_C1;
@property (strong, nonatomic) IBOutlet UIButton           *R3_C2;
@property (strong, nonatomic) IBOutlet UIButton           *R3_C3;
@property (strong, nonatomic) IBOutlet UIButton           *R3_C4;
//row4
@property (strong, nonatomic) IBOutlet UIButton           *R4_C1;
@property (strong, nonatomic) IBOutlet UIButton           *R4_C2;
@property (strong, nonatomic) IBOutlet UIButton           *R4_C3;
@property (strong, nonatomic) IBOutlet UIButton           *R4_C4;
@property (strong, nonatomic) IBOutlet UIProgressView     *progress_view_time;
//ACTIONS
//row1
- (IBAction)R1_C1:(id)sender;
- (IBAction)R1_C2:(id)sender;
- (IBAction)R1_C3:(id)sender;
- (IBAction)R1_C4:(id)sender;
//row2
- (IBAction)R2_C1:(id)sender;
- (IBAction)R2_C2:(id)sender;
- (IBAction)R2_C3:(id)sender;
- (IBAction)R2_C4:(id)sender;
//row3
- (IBAction)R3_C1:(id)sender;
- (IBAction)R3_C2:(id)sender;
- (IBAction)R3_C3:(id)sender;
- (IBAction)R3_C4:(id)sender;
//row4
- (IBAction)R4_C1:(id)sender;
- (IBAction)R4_C2:(id)sender;
- (IBAction)R4_C3:(id)sender;
- (IBAction)R4_C4:(id)sender;

@property (strong, nonatomic) IBOutlet UIView             *guide_view;
//GUIDE
@property (strong, nonatomic) IBOutlet UIImageView        *R1_C1_G;
@property (strong, nonatomic) IBOutlet UIImageView        *R1_C2_G;
@property (strong, nonatomic) IBOutlet UIImageView        *R1_C3_G;
@property (strong, nonatomic) IBOutlet UIImageView        *R1_C4_G;
//
@property (strong, nonatomic) IBOutlet UIImageView        *R2_C1_G;
@property (strong, nonatomic) IBOutlet UIImageView        *R2_C2_G;
@property (strong, nonatomic) IBOutlet UIImageView        *R2_C3_G;
@property (strong, nonatomic) IBOutlet UIImageView        *R2_C4_G;
//
@property (strong, nonatomic) IBOutlet UIImageView        *R3_C1_G;
@property (strong, nonatomic) IBOutlet UIImageView        *R3_C2_G;
@property (strong, nonatomic) IBOutlet UIImageView        *R3_C3_G;
@property (strong, nonatomic) IBOutlet UIImageView        *R3_C4_G;
//
@property (strong, nonatomic) IBOutlet UIImageView        *R4_C1_G;
@property (strong, nonatomic) IBOutlet UIImageView        *R4_C2_G;
@property (strong, nonatomic) IBOutlet UIImageView        *R4_C3_G;
@property (strong, nonatomic) IBOutlet UIImageView        *R4_C4_G;

//////////////////////////////////
//countdown timer view
@property (strong, nonatomic) IBOutlet UIImageView        *circle_countdown;
@property (strong, nonatomic) IBOutlet UILabel            *tutorial_label;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *countdown_blurview;
@property (strong, nonatomic) IBOutlet UILabel            *countdown_start_label;
/////
@property (strong, nonatomic) IBOutlet UIProgressView     *game_progress;

@end
