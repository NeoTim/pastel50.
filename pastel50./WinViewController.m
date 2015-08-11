//
//  WinViewController.m
//  pastel50.
//
//  Created by Sean Lim on 10/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "WinViewController.h"

@interface WinViewController ()

@end

@implementation WinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _background.alpha = 0;
}
-(void) viewDidAppear:(BOOL)animated{
    //init with view
    [UIView animateWithDuration:0.8 animations:^{
        _background.alpha = 1;
    }];
    double delayInSeconds = 1.8;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //segue to game 2 VC
        [self performSegueWithIdentifier:@"togame2" sender:nil];
    });
}


@end