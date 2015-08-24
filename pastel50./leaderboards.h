//
//  leaderboards.h
//  pastel50.
//
//  Created by Sean Lim on 24/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface leaderboards : UIViewController
//Leaderboard card
@property (strong, nonatomic) IBOutlet UIView *leaderboard_container;
//1st
@property (strong, nonatomic) IBOutlet UILabel *name_1;
@property (strong, nonatomic) IBOutlet UILabel *score_1;
//2nd
@property (strong, nonatomic) IBOutlet UILabel *name_2;
@property (strong, nonatomic) IBOutlet UILabel *score_2;
//3rd
@property (strong, nonatomic) IBOutlet UILabel *name_3;
@property (strong, nonatomic) IBOutlet UILabel *score_3;
//4th
@property (strong, nonatomic) IBOutlet UILabel *name_4;
@property (strong, nonatomic) IBOutlet UILabel *score_4;
//5th
@property (strong, nonatomic) IBOutlet UILabel *name_5;
@property (strong, nonatomic) IBOutlet UILabel *score_5;

@end
