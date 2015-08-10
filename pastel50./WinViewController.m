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
}


@end
