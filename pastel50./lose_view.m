//
//  lose_view.m
//  pastel50.
//
//  Created by Sean Lim on 12/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "lose_view.h"

@interface lose_view ()

@end

@implementation lose_view
int level_from;
- (void)viewDidLoad {
    [super viewDidLoad];
    //init with animations
    _h1.alpha              = 0;
    _h2.alpha              = 0;
    _pic.alpha             = 0;
    _mainmenu_button.alpha = 0;
    
}
-(void)viewDidAppear:(BOOL)animated{
    [UIView animateWithDuration:0.8 animations:^{
        _h1.alpha  = 1;
        _h2.alpha  = 1;
        _pic.alpha = 1;
    }];
    [UIView animateWithDuration:0.5 delay:0.4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _mainmenu_button.alpha = 1;
    }completion:nil];
}
- (IBAction)quit_mm:(id)sender {
    //init with sendback
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
