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
//initial leaderboard position
int x_lead,y_lead,width_lead,height_lead;
-(void)viewDidLoad{
    //init
    NSLog(@"current user is %@", [[NSUserDefaults standardUserDefaults] stringForKey:@"user"]);
    _load_card.alpha = 0;
    x_lead = self.leaderboard_container.frame.origin.x;
    y_lead = self.leaderboard_container.frame.origin.y;
    width_lead = self.leaderboard_container.frame.size.width;
    height_lead = self.leaderboard_container.frame.size.height;
    _leaderboard_container.frame = CGRectMake(x_lead, height_lead +11, width_lead, height_lead);
    _leaderboard_container.alpha = 0;
    //set frame for container view
    CALayer *layer = self.leaderboard_container.layer;
    layer.shadowColor = [UIColor colorWithWhite:0.383 alpha:1.000].CGColor;
    layer.shadowOpacity = 0.4;
    layer.shadowRadius = 11.0f;
    layer.shadowOffset = CGSizeMake(2, 3);
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:_leaderboard_container.bounds]CGPath];
    layer.cornerRadius = 15.0f;
    [self refresh];
    [self getuser];
}
-(void)refresh{
    //start computing
    [UIView animateWithDuration:0.4 animations:^{
        _load_card.alpha = 1;
    }];
    [_activity_indicator startAnimating];
    //shadow
    CALayer *layer = self.load_card.layer;
    layer.shadowColor = [UIColor colorWithWhite:0.383 alpha:1.000].CGColor;
    layer.shadowOpacity = 0.4;
    layer.shadowRadius = 10.0f;
    layer.shadowOffset = CGSizeMake(2, 3);
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:_load_card.bounds]CGPath];
    layer.cornerRadius = 15.0f;
    //////////
    //run pfqueries for all 5 indexes
    PFQuery *query = [PFQuery queryWithClassName:@"leaderboard"];
    //sort array
    [query orderByDescending:@"score"];
    //get first score
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *err){
        if(!err){
            //kill animations
            [_activity_indicator stopAnimating];
            [UIView animateWithDuration:0.4 animations:^{
                _load_card.alpha = 0;
            }];
            [UIView animateWithDuration:0.6 animations:^{
                _leaderboard_container.alpha = 1;
                _leaderboard_container.frame = CGRectMake(x_lead, y_lead, width_lead, height_lead);
            }];
       //ordered scores
        NSLog([NSString stringWithFormat:@"%@", array]);
        //init with label sets
        //1
        [_name_1 setText:[NSString stringWithFormat:@"%@",[[array objectAtIndex:0] objectForKey:@"user"]]];
        [_score_1 setText:[NSString stringWithFormat:@"%@", [[array objectAtIndex:0] objectForKey:@"score"]]];
            [[NSUserDefaults standardUserDefaults]setObject:[[array objectAtIndex:0]objectForKey:@"score"] forKey:@"score1"];
        //2
        [_name_2 setText:[NSString stringWithFormat:@"%@",[[array objectAtIndex:1] objectForKey:@"user"]]];
        [_score_2 setText:[NSString stringWithFormat:@"%@", [[array objectAtIndex:1] objectForKey:@"score"]]];
            [[NSUserDefaults standardUserDefaults]setObject:[[array objectAtIndex:1]objectForKey:@"score"] forKey:@"score2"];

        //3
        [_name_3 setText:[NSString stringWithFormat:@"%@",[[array objectAtIndex:2] objectForKey:@"user"]]];
        [_score_3 setText:[NSString stringWithFormat:@"%@", [[array objectAtIndex:2] objectForKey:@"score"]]];
            [[NSUserDefaults standardUserDefaults]setObject:[[array objectAtIndex:2]objectForKey:@"score"] forKey:@"score3"];

        //4
        [_name_4 setText:[NSString stringWithFormat:@"%@",[[array objectAtIndex:3] objectForKey:@"user"]]];
        [_score_4 setText:[NSString stringWithFormat:@"%@", [[array objectAtIndex:3] objectForKey:@"score"]]];
            [[NSUserDefaults standardUserDefaults]setObject:[[array objectAtIndex:3]objectForKey:@"score"] forKey:@"score4"];

        //5
        [_name_5 setText:[NSString stringWithFormat:@"%@",[[array objectAtIndex:4] objectForKey:@"user"]]];
        [_score_5 setText:[NSString stringWithFormat:@"%@", [[array objectAtIndex:4] objectForKey:@"score"]]];
            [[NSUserDefaults standardUserDefaults]setObject:[[array objectAtIndex:4]objectForKey:@"score"] forKey:@"score5"];

        
        }
        else{
            //error
            [_activity_indicator stopAnimating];
            [_err_msg setText:@"Error"];
        }
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
        [[NSUserDefaults standardUserDefaults]setObject:user forKey:@"user"];
        [self runcomp];
    }
}
-(void)runcomp{
    //run comparison algortihm
    //**********************//
    //PREDICATE SCORE
    //INIT
    //
    //get score
    int score1, score2, score3, score4, score5;
    score1 = [[NSUserDefaults standardUserDefaults] integerForKey:@"score1"];
    score2 = [[NSUserDefaults standardUserDefaults]integerForKey:@"score2"];
    score3 = [[NSUserDefaults standardUserDefaults]integerForKey:@"score3"];
    score4 = [[NSUserDefaults standardUserDefaults] integerForKey:@"score4"];
    score5 = [[NSUserDefaults standardUserDefaults]integerForKey:@"score5"];
    //current hs
    int current_hs = [[NSUserDefaults standardUserDefaults] integerForKey:@"game4_highscore"];
    NSLog([NSString stringWithFormat:@"current highscore is ,%i",current_hs]);
    NSNumber *current_hs_nm = [NSNumber numberWithInt:current_hs];
    //user
    NSString *username = [[NSUserDefaults standardUserDefaults]stringForKey:@"user"];
    ///
    //TRUNCATED SEQUENCING WITH UNIQUE IDs FOR INDEX
    //compare first
    if (current_hs > score1) {
        //new global highscore
        PFQuery *query = [PFQuery queryWithClassName:@"leaderboard"];
        [query getObjectInBackgroundWithId:@"YqCO6bQ3zx" block:^(PFObject *object, NSError *error){
            [object setObject:username forKey:@"user"];
            [object setObject:current_hs_nm forKey:@"score"];
            [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"game4_highscore"];
            //refresh
            [self refresh];
            [object saveInBackgroundWithBlock:^(BOOL hi, NSError*error){
                if (error) {
                    //error
                }
            }];
        }];
    }
    else if (current_hs > score2){
        //is less than one, takes second place
        PFQuery *query = [PFQuery queryWithClassName:@"leaderboard"];
        [query getObjectInBackgroundWithId:@"oJvJtpyU8k" block:^(PFObject *object, NSError *error){
            //
            [object setObject:username forKey:@"user"];
            [object setObject:current_hs_nm forKey:@"score"];
            [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"game4_highscore"];

            [object saveInBackgroundWithBlock:^(BOOL hi, NSError*error){
                if (error) {
                    //error
                }
            }];}];
    }
    
    else if (current_hs > score3){
        //takes third
        PFQuery *query = [PFQuery queryWithClassName:@"leaderboard"];
        [query getObjectInBackgroundWithId:@"AdYrhO7cVY" block:^(PFObject *object, NSError *error){
            //
            [object setObject:username forKey:@"user"];
            [object setObject:current_hs_nm forKey:@"score"];
            [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"game4_highscore"];
            //refresh
            [self refresh];
            [object saveInBackgroundWithBlock:^(BOOL hi, NSError*error){
                if (error) {
                    //error
                }
        }];
        }];
        
    }
    else if (current_hs > score4){
        //takes 4th
        PFQuery *query = [PFQuery queryWithClassName:@"leaderboard"];
        [query getObjectInBackgroundWithId:@"lFiesdWw0s" block:^(PFObject *object, NSError *error){
           //
            [object setObject:username forKey:@"user"];
            [object setObject:current_hs_nm forKey:@"score"];
            [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"game4_highscore"];
            //refresh
            [self refresh];
            [object saveInBackgroundWithBlock:^(BOOL hi, NSError*error){
                if (error) {
                    //error
                }
        }];
            }];
    }
    else if (current_hs > score5){
        //takes 5th
        PFQuery *query = [PFQuery queryWithClassName:@"leaderboard"];
        [query getObjectInBackgroundWithId:@"Wdi5apo6aZ" block:^(PFObject *object, NSError *error){
           //
            [object setObject:username forKey:@"user"];
            [object setObject:current_hs_nm forKey:@"score"];
            [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"game4_highscore"];
            //refresh
            [self refresh];
            [object saveInBackgroundWithBlock:^(BOOL hi, NSError*error){
                if (error) {
                    //error
                }
        }];
        }];
        }
    else{
        //did not make highscore
        NSLog(@"no highscore");
    }
}
@end
