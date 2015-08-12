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
    //fetch level lostfrom
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    level_from = [defaults integerForKey:@"level_lost_from"];
}


- (IBAction)retry:(id)sender {
    //init with sendback
    
}

- (IBAction)quit_mm:(id)sender {
}
@end
