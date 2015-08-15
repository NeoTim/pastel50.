//
//  Main_Menu_Launchpad.h
//  pastel50.
//
//  Created by Sean Lim on 12/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Main_Menu_Launchpad : UIViewController
@property (strong, nonatomic) IBOutlet UIView *textview_container;
@property (strong, nonatomic) IBOutlet UIView *card_view_text;
- (IBAction)level_1:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *level1;
@property (strong, nonatomic) IBOutlet UIButton *level_2;
- (IBAction)level2:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *level_3;


@end
