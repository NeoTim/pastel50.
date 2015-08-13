//
//  game3_splash.m
//  pastel50.
//
//  Created by Sean Lim on 12/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "game3_splash.h"

@interface game3_splash ()

@end

@implementation game3_splash
-(void)viewDidAppear:(BOOL)animated{
    [UIView animateWithDuration:0.4 delay:0.4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _h1.alpha = 1;
        _h2.alpha = 1;
    }completion:nil];
    [UIView animateWithDuration:0.8 animations:^{
        _background.alpha = 1;
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //init view
    _background.alpha = 0;
    _h1.alpha = 0;
    _h2.alpha = 0;

}


@end
