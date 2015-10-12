//
//  settings.h
//  pastel50.
//
//  Created by Sean Lim on 22/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface settings : UIViewController
@property (assign) BOOL sound_did_on;
@property (strong, nonatomic) IBOutlet UILabel *h1;
@property (strong, nonatomic) IBOutlet UIImageView *background;
//sound
@property (strong, nonatomic) IBOutlet UILabel *h2;
@property (strong, nonatomic) IBOutlet UISwitch *sound_switch;
- (IBAction)sound_switch:(id)sender;
//done button
@property (strong, nonatomic) IBOutlet UIButton *done_button;
- (IBAction)done_button:(id)sender;
- (IBAction)aboutus_button:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *aboutus;

@end

