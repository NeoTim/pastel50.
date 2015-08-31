//
//  game4.h
//  pastel50.
//
//  Created by Sean Lim on 18/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface game4 : UIViewController{
    AVAudioPlayer *audioPlayer;
}
//init timer
@property (strong, nonatomic) IBOutlet UILabel            *time_dis;
@property (strong, nonatomic) IBOutlet UILabel            *seconds_unit;
//headsup panel
@property (strong, nonatomic) IBOutlet UIView *headsup_view_container;
@property (strong, nonatomic) IBOutlet UILabel *header_headsup;
@property (strong, nonatomic) IBOutlet UIImageView *headsup_view_img;
@property (strong, nonatomic) IBOutlet UILabel *content;
//blurview
@property (strong, nonatomic) IBOutlet UIVisualEffectView *blur_view;
@property (strong, nonatomic) IBOutlet UILabel *countdown_disp;
@property (strong, nonatomic) IBOutlet UILabel *tut_;
//main game interface
//MAIN USER TAP
//err catch
//
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


//////////////////////////////////
//countdown timer view
@property (strong, nonatomic) IBOutlet UIVisualEffectView *blurview;
@property (strong, nonatomic) IBOutlet UILabel            *countdown_label;
//game progress
@property (strong, nonatomic) IBOutlet UIProgressView     *game_progress;
////
@property (strong, nonatomic) IBOutlet UILabel *score_disp;

@property (strong, nonatomic) IBOutlet UIButton *pause_button;
- (IBAction)pause_button:(id)sender;

//Pause view
@property (strong, nonatomic) IBOutlet UIVisualEffectView *pauseview_container;
- (IBAction)Quit:(id)sender;
- (IBAction)restart:(id)sender;
- (IBAction)backto_game:(id)sender;

@end
