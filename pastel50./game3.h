//
//  ViewController.h
//  Icode
//
//  Created by Benjamin Koh on 19/8/15.
//  Copyright (c) 2015 Tangent.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface game3 : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *TimeLeft;

@property (weak, nonatomic) IBOutlet UIButton *R1_C1;
@property (weak, nonatomic) IBOutlet UIButton *R1_C2;
@property (weak, nonatomic) IBOutlet UIButton *R1_C3;
@property (weak, nonatomic) IBOutlet UIButton *R1_C4;
@property (weak, nonatomic) IBOutlet UIButton *R2_C1;
@property (weak, nonatomic) IBOutlet UIButton *R2_C2;
@property (weak, nonatomic) IBOutlet UIButton *R2_C3;
@property (weak, nonatomic) IBOutlet UIButton *R2_C4;
@property (weak, nonatomic) IBOutlet UIButton *R3_C1;
@property (weak, nonatomic) IBOutlet UIButton *R3_C2;
@property (weak, nonatomic) IBOutlet UIButton *R3_C3;
@property (weak, nonatomic) IBOutlet UIButton *R3_C4;
@property (weak, nonatomic) IBOutlet UIButton *R4_C1;
@property (weak, nonatomic) IBOutlet UIButton *R4_C2;
@property (weak, nonatomic) IBOutlet UIButton *R4_C3;
@property (weak, nonatomic) IBOutlet UIButton *R4_C4;


- (IBAction)R1_C1:(id)sender;
- (IBAction)R1_C2:(id)sender;
- (IBAction)R1_C3:(id)sender;
- (IBAction)R1_C4:(id)sender;
- (IBAction)R2_C1:(id)sender;
- (IBAction)R2_C2:(id)sender;
- (IBAction)R2_C3:(id)sender;
- (IBAction)R2_C4:(id)sender;
- (IBAction)R3_C1:(id)sender;
- (IBAction)R3_C2:(id)sender;
- (IBAction)R3_C3:(id)sender;
- (IBAction)R3_C4:(id)sender;
- (IBAction)R4_C1:(id)sender;
- (IBAction)R4_C2:(id)sender;
- (IBAction)R4_C3:(id)sender;
- (IBAction)R4_C4:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *INFO;
- (IBAction)STARTTEST:(id)sender;






@end

