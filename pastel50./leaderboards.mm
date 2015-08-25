//
//  leaderboards.m
//  pastel50.
//
//  Created by Sean Lim on 24/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "leaderboards.h"
#import <Parse/Parse.h>

@implementation leaderboards
NSString *user;
-(void)viewDidLoad{
    NSLog([NSString stringWithString:[[NSUserDefaults standardUserDefaults] stringForKey:@"user"]]);
    [super viewDidLoad];
    [self set_label];
    [self getuser];
}
-(void)set_label{
    //run pfqueries for all 5 indexes
    PFQuery *query = [PFQuery queryWithClassName:@"leaderboard"];
    [query orderByAscending:@"index"];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error){
        //start progress
        NSString *firstuser = [object objectForKey:@"user"];
        [_name_1 setText:firstuser];
        [_score_1 setText:[NSString stringWithFormat:@"%@",[object objectForKey:@"score"]]];
        NSNumber *index = [object objectForKey:@"index"];
        //******BACKEND ERROR LOOP *******
        //assumption that a_index sub 1//
        int a_index = index.intValue;
        //query for second score
        int b = a_index + 1;
        NSNumber *second = [NSNumber numberWithInt:b];
        PFQuery *query = [PFQuery queryWithClassName:@"leaderboard"];
        [query whereKey:@"index" equalTo:second];
        [query findObjectsInBackgroundWithBlock:^(NSArray *array , NSError *error){
            NSString *userpull = [NSString stringWithFormat:@"%@",[[array lastObject] objectForKey:@"user"]];
            [_name_2 setText:userpull];
            [_score_2 setText:[NSString stringWithFormat:@"%@",[[array lastObject]objectForKey:@"score"]]];
        }];
        //query for third score
        int b3 = a_index + 2;
        NSNumber *third = [NSNumber numberWithInt:b3];
        PFQuery *query3 = [PFQuery queryWithClassName:@"leaderboard"];
        [query3 whereKey:@"index" equalTo:third];
        [query3 findObjectsInBackgroundWithBlock:^(NSArray *array , NSError *error){
            NSString *userpull = [NSString stringWithFormat:@"%@",[[array lastObject] objectForKey:@"user"]];
            [_name_3 setText:userpull];
            [_score_3 setText:[NSString stringWithFormat:@"%@",[[array lastObject]objectForKey:@"score"]]];
        }];
        //query for fouth score
        int b4 = a_index + 3;
        NSNumber *fourth = [NSNumber numberWithInt:b4];
        PFQuery *query4 = [PFQuery queryWithClassName:@"leaderboard"];
        [query4 whereKey:@"index" equalTo:fourth];
        [query4 findObjectsInBackgroundWithBlock:^(NSArray *array , NSError *error){
            NSString *userpull = [NSString stringWithFormat:@"%@",[[array lastObject] objectForKey:@"user"]];
            [_name_4 setText:userpull];
            [_score_4 setText:[NSString stringWithFormat:@"%@",[[array lastObject]objectForKey:@"score"]]];
        }];
        //final query
        int b5 = a_index + 4;
        NSNumber *last = [NSNumber numberWithInt:b5];
        PFQuery *query5 = [PFQuery queryWithClassName:@"leaderboard"];
        [query5 whereKey:@"index" equalTo:last];
        [query5 findObjectsInBackgroundWithBlock:^(NSArray *array , NSError *error){
            NSString *userpull = [NSString stringWithFormat:@"%@",[[array lastObject] objectForKey:@"user"]];
            [_name_5 setText:userpull];
            [_score_5 setText:[NSString stringWithFormat:@"%@",[[array lastObject]objectForKey:@"score"]]];
        }];
    }];
    //done with disp
}
-(void)getuser{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"user_req"] != TRUE) {
        //do a username req through uialertview
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ohai there!" message:@"What is your username?" delegate:self cancelButtonTitle:@"nah" otherButtonTitles:@"done", nil];
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        [alert show];
    }
    else{
        [self runcomp];
    }

}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1){
        [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"user_req"];
        //set username
        user = [[alertView textFieldAtIndex:0] text];
        [[NSUserDefaults standardUserDefaults]setObject:user forKey:@"user"];
        [self runcomp];
    }
}
-(void)runcomp{
    int score = [[NSUserDefaults standardUserDefaults] integerForKey:@"game4_highscore"];
    //run comparison algortihm
    
}
@end
