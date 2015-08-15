//
//  winView.m
//  pastel50.
//
//  Created by Sean Lim on 14/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "winView.h"

@interface winView ()

@end

@implementation winView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _backto_mm.alpha = 0;
    _h1.alpha = 0;
    _h2.alpha = 0;
    [self check_for_unlock];
}
-(void)viewDidAppear:(BOOL)animated{
    //start animation
    [UIView animateWithDuration:0.8 animations:^{
        _backto_mm.alpha = 1;
        _h1.alpha = 1;
        _h2.alpha = 1;
    }];
}
- (IBAction)backto_mm:(id)sender {
    //send back to mm
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void) check_for_unlock{
    //init with check for new values
    
}
@end
