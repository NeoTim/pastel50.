//
//  Main_Menu_Launchpad.m
//  pastel50.
//
//  Created by Sean Lim on 12/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "Main_Menu_Launchpad.h"

@interface Main_Menu_Launchpad ()

@end

@implementation Main_Menu_Launchpad

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self performSegueWithIdentifier:@"game1" sender:nil];

}

@end
