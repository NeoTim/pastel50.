//
//  choose_gamemode.m
//  pastel50.
//
//  Created by Sean Lim on 4/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "choose_gamemode.h"

@interface choose_gamemode ()

@end

@implementation choose_gamemode

-(void)viewDidAppear:(BOOL)animated{
    _background_img.alpha = 0;
    //init with background get
    [UIView animateWithDuration: 1 animations:^{
        _background_img.alpha = 1;
    }];
    [self getquote];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_activity_indicator startAnimating];
    _background_img.alpha = 0;
    
}
-(void) getquote {
    int rand = arc4random()%9;
    if (rand == 0) {
        [_quote_view setText:@"You can find the national anthem in Micro-text on the back of the 1000-dollar note"];
    }
    if (rand == 1) {
        [_quote_view setText:@""];
    }
    if (rand == 2) {
        [_quote_view setText:@""];
    }
    if (rand == 3) {
        [_quote_view setText:@""];
    }
    if (rand == 4) {
        [_quote_view setText:@""];
    }
    if (rand == 5) {
        [_quote_view setText:@""];
    }
    if (rand == 6) {
        [_quote_view setText:@""];
    }
    if (rand == 7) {
        [_quote_view setText:@""];
    }
    if (rand == 8) {
        [_quote_view setText:@""];
    }
    if (rand == 9) {
        [_quote_view setText:@""];
    }
    double delayInSeconds = 15.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //segue
        NSLog(@"didsegue");
        [self performSegueWithIdentifier:@"game1" sender:nil];
    });
}

@end
