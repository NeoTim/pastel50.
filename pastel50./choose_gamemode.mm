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
    _quote_view.alpha = 0;
    
}
-(void) getquote {
    int rand = arc4random()%3;
    if (rand == 0) {
        [_quote_view setText:@"You can find the national anthem in Micro-text on the back of the 1000-dollar note"];
    }
    if (rand == 1) {
        [_quote_view setText:@"Singapore is one of the most densely populated country in the world, with 6,430 people per square kilometre."];
    }
    if (rand == 2) {
        [_quote_view setText:@"The buildings of suntec city has been built in the shape of a palm of a hand symbolising good 'fengshui'"];
    }
    if (rand == 3) {
        [_quote_view setText:@"There is a place in the world also called Singapore in Michigan"];
    }
    _quote_view.alpha = 1;
    double delayInSeconds = 2.6;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //segue
        NSLog(@"didsegue");
        //MAIN MENU SEGUE
        [self performSegueWithIdentifier:@"next" sender:nil];
        [UIView animateWithDuration:0.4 animations:^{
            _background_img.alpha = 0;
            _quote_view.alpha = 0;
        }];
    });
}

@end
