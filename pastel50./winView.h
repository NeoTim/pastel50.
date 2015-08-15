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
@property (strong, nonatomic) IBOutlet UILabel *h2;

@end
