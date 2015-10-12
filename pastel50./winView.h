//
//  winView.h
//  pastel50.
//
//  Created by Sean Lim on 14/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface winView : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *backto_mm;
- (IBAction)backto_mm:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *h1;
@property (strong, nonatomic) IBOutlet UIButton *leaderboards_button;
@property (strong, nonatomic) IBOutlet UILabel *h2;
- (IBAction)leaderboards_button:(id)sender;


//Headsup
@property (strong, nonatomic) IBOutlet UIView *headsup_container;
@property (strong, nonatomic) IBOutlet UIImageView *icon;
@property (strong, nonatomic) IBOutlet UILabel *header;
@property (strong, nonatomic) IBOutlet UILabel *content;

@end
