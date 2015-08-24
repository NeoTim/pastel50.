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
    [super viewDidLoad];
    [self set_label];
    [self getuser];
}
-(void)set_label{
    //run pfqueries for all 5 indexes
    PFQuery *query_1 = [PFQuery queryWithClassName:@"leaderboard_game4"];
    [query_1 whereKey:@"index" equalTo:@"1"];
    [query_1 getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error){
        [_name_1 setText:[NSString stringWithString:[object objectForKey:@"user"]]];
        [_score_1 setText:[object objectForKey:@"score"]];
    }];
    //
    PFQuery *query_2 = [PFQuery queryWithClassName:@"leaderboard_game4"];
    [query_2 whereKey:@"index" equalTo:@"2"];
    [query_2 getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error){
        [_name_2 setText:[NSString stringWithString:[object objectForKey:@"user"]]];
        [_score_2 setText:[object objectForKey:@"score"]];
    }];
    //
    PFQuery *query_3 = [PFQuery queryWithClassName:@"leaderboard_game4"];
    [query_3 whereKey:@"index" equalTo:@"3"];
    [query_3 getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error){
        [_name_3 setText:[NSString stringWithString:[object objectForKey:@"user"]]];
        [_score_3 setText:[object objectForKey:@"score"]];
    }];
    //
    PFQuery *query_4 = [PFQuery queryWithClassName:@"leaderboard_game4"];
    [query_4 whereKey:@"index" equalTo:@"4"];
    [query_4 getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error){
        [_name_4 setText:[NSString stringWithString:[object objectForKey:@"user"]]];
        [_score_4 setText:[object objectForKey:@"score"]];
    }];
    //
    PFQuery *query_5 = [PFQuery queryWithClassName:@"leaderboard_game4"];
    [query_5 whereKey:@"index" equalTo:@"5"];
    [query_5 getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error){
        [_name_5 setText:[NSString stringWithString:[object objectForKey:@"user"]]];
        [_score_5 setText:[object objectForKey:@"score"]];
    }];
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
        [self runcomp];
    }
}
-(void)runcomp{
    int score = [[NSUserDefaults standardUserDefaults] integerForKey:@"game4_highscore"];
    //run comparisons
    //1st
    PFQuery *query = [PFQuery queryWithClassName:@"leaderboard_game4"];
    [query whereKey:@"index" equalTo:@"1"];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error){
        NSNumber *first = [object objectForKey:@"score"];
        int firsti = first.intValue;
        if (score > firsti) {
            //new first
            NSNumber *rep = [NSNumber numberWithInt:score];
            [object setObject:rep forKey:@"score"];
            [object setObject:user forKey:@"user"];
        }
        else{
            //2nd
            PFQuery *query = [PFQuery queryWithClassName:@"leaderboard_game4"];
            [query whereKey:@"index" equalTo:@"2"];
            [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error){
                NSNumber *first = [object objectForKey:@"score"];
                int firsti = first.intValue;
                if (score > firsti) {
                    //new 2nd
                    NSNumber *rep = [NSNumber numberWithInt:score];
                    [object setObject:rep forKey:@"score"];
                    [object setObject:user forKey:@"user"];

                }
                else{
                    //3rd
                    PFQuery *query = [PFQuery queryWithClassName:@"leaderboard_game4"];
                    [query whereKey:@"index" equalTo:@"3"];
                    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error){
                        NSNumber *first = [object objectForKey:@"score"];
                        int firsti = first.intValue;
                        if (score > firsti) {
                            //new 3rd
                            NSNumber *rep = [NSNumber numberWithInt:score];
                            [object setObject:rep forKey:@"score"];
                            [object setObject:user forKey:@"user"];

                        }
                        else{
                            //4th
                            PFQuery *query = [PFQuery queryWithClassName:@"leaderboard_game4"];
                            [query whereKey:@"index" equalTo:@"4"];
                            [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error){
                                NSNumber *first = [object objectForKey:@"score"];
                                int firsti = first.intValue;
                                if (score > firsti) {
                                    //new 4th
                                    NSNumber *rep = [NSNumber numberWithInt:score];
                                    [object setObject:rep forKey:@"score"];
                                    [object setObject:user forKey:@"user"];

                                }
                                else{
                                    //5th
                                    PFQuery *query = [PFQuery queryWithClassName:@"leaderboard_game4"];
                                    [query whereKey:@"index" equalTo:@"5"];
                                    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error){
                                        NSNumber *first = [object objectForKey:@"score"];
                                        int firsti = first.intValue;
                                        if (score > firsti) {
                                            //new 5th
                                            NSNumber *rep = [NSNumber numberWithInt:score];
                                            [object setObject:rep forKey:@"score"];
                                            [object setObject:user forKey:@"user"];

                                        }
                                    }];
                                }
                            }];
                        }
                    }];
                }
            }];
        }
    }];

}
@end
