//
//  lose_view.h
//  pastel50.
//
//  Created by Sean Lim on 12/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lose_view : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *pic;
@property (strong, nonatomic) IBOutlet UILabel *h1;
@property (strong, nonatomic) IBOutlet UILabel *h2;

@property (strong, nonatomic) IBOutlet UIButton *retry_button;
@property (strong, nonatomic) IBOutlet UIButton *mainmenu_button;
- (IBAction)retry:(id)sender;
- (IBAction)quit_mm:(id)sender;
@end
