//
//  ViewController.h
//  pastel50.
//
//  Created by Sean Lim on 4/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *pastel_text;
@property (strong, nonatomic) IBOutlet UIButton *start_button;
- (IBAction)start_button:(id)sender;

@end

