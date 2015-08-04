//
//  ViewController.m
//  pastel50.
//
//  Created by Sean Lim on 4/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //init with animations and buttons
    _start_button.layer.cornerRadius = 15.0f;
    CALayer *layer1 = _start_button.layer;
    layer1.shadowOffset = CGSizeMake(1, 1);
    layer1.shadowColor = [[UIColor lightGrayColor] CGColor];
    layer1.shadowRadius = 4;
    layer1.shadowOpacity = 0.4;
    layer1.cornerRadius=15.0f;
    layer1.shadowOffset= CGSizeMake(4, 4);
    layer1.shadowPath = [[UIBezierPath bezierPathWithRect:_start_button.bounds] CGPath];
    _start_button.alpha = 0;
    [UIView animateWithDuration:0.8 animations:^{
        _start_button.alpha = 1;
    }];
}

- (IBAction)start_button:(id)sender {
    //animations
    [UIView animateWithDuration:1 animations:^{
        //swipe out
        _start_button.alpha = 0;
        _pastel_text.alpha = 0;
    }];
    double delayInSeconds = 1.6;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //this will be executed after 2 seconds
        //segue to next view
        [self performSegueWithIdentifier:@"game1" sender:nil];
    });
    
    
}
@end
