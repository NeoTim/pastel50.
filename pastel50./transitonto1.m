//
//  transitonto1.m
//  pastel50.
//
//  Created by Sean Lim on 10/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "transitonto1.h"

@interface transitonto1 ()

@end

@implementation transitonto1
-(void)viewDidLoad{
    [super viewDidLoad];
    _logo.alpha = 0;
}
-(void)viewDidAppear:(BOOL)animated{
    [UIView animateWithDuration:0.8 animations:^{
        _logo.alpha = 1;
    }];
    double delayInSeconds = 2.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //segue into main game
        [self performSegueWithIdentifier:@"togame1" sender:nil];
    });
}

@end
