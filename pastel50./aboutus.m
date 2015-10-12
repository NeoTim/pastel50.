//
//  aboutus.m
//  pastel50.
//
//  Created by Sean Lim on 12/10/15.
//  Copyright © 2015 Tangent.inc. All rights reserved.
//

#import "aboutus.h"

@interface aboutus ()

@end

@implementation aboutus

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)artwork_cred:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.buildingsingapore.teoyusiang.com/"]];
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
