//
//  settings.m
//  pastel50.
//
//  Created by Sean Lim on 22/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "settings.h"
#import "AppDelegate.h"
BOOL sound_did_on;
@implementation settings
-(void)viewDidLoad{
    //init with fade in animations
    [self animate_in];
    //get sound setting
    sound_did_on = [[NSUserDefaults standardUserDefaults] boolForKey:@"sound_setting"];
    if (sound_did_on == YES) {
        //UISwitch soundidon
        [_sound_switch setOn:YES animated:YES];
    }
    else{
        //sound is off
        [_sound_switch setOn:NO animated:YES];
    }
}
-(void)animate_in{
    _h1.alpha           = 0;
    _h2.alpha           = 0;
    _background.alpha   = 0;
    _sound_switch.alpha = 0;
    _done_button.alpha  = 0;
    [UIView animateWithDuration:0.5 animations:^{
        _background.alpha = 1;
        _h1.alpha           = 1;
        _h2.alpha           = 1;
        _background.alpha   = 1;
        _sound_switch.alpha = 1;
        _done_button.alpha  = 1;
    }];
}
- (IBAction)sound_switch:(id)sender {
    //user did_tap sound switch
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"sound_setting"] == YES) {
        //disable sound
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"sound_setting"];
        sound_did_on = NO;
        //set button state
        [_sound_switch setOn:NO animated:YES];
    }
    else if ([[NSUserDefaults standardUserDefaults]boolForKey:@"sound_settings"] == NO){
        //enable sound
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"sound_setting"];
        sound_did_on = YES;
        //set button state
        [_sound_switch setOn:YES animated:YES];
    }
}
- (IBAction)done_button:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
