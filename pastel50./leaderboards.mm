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
        //2
        [_name_2 setText:[NSString stringWithFormat:@"%@",[[array objectAtIndex:1] objectForKey:@"user"]]];
        [_score_2 setText:[NSString stringWithFormat:@"%@", [[array objectAtIndex:1] objectForKey:@"score"]]];

        //3
        [_name_3 setText:[NSString stringWithFormat:@"%@",[[array objectAtIndex:2] objectForKey:@"user"]]];
        [_score_3 setText:[NSString stringWithFormat:@"%@", [[array objectAtIndex:2] objectForKey:@"score"]]];

        //4
        [_name_4 setText:[NSString stringWithFormat:@"%@",[[array objectAtIndex:3] objectForKey:@"user"]]];
        [_score_4 setText:[NSString stringWithFormat:@"%@", [[array objectAtIndex:3] objectForKey:@"score"]]];

        //5
        [_name_5 setText:[NSString stringWithFormat:@"%@",[[array objectAtIndex:4] objectForKey:@"user"]]];
        [_score_5 setText:[NSString stringWithFormat:@"%@", [[array objectAtIndex:4] objectForKey:@"score"]]];

        
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
    int score = [[NSUserDefaults standardUserDefaults] integerForKey:@"game4_highscore"];
    NSLog(@"highscore %i",score);
    [_highscore_disp setText:[NSString stringWithFormat:@"Your Highscore is %i", score]];
    NSNumber *scorenm = [NSNumber numberWithInt:score];
    NSString *user = [[NSUserDefaults standardUserDefaults]stringForKey:@"user"];
    //
    PFQuery *query = [PFQuery queryWithClassName:@"leaderboard"];
    //sort
    [query orderByDescending:@"score"];
    //init with score grab
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error){
       //init with comp.
        ////////////
        //1
        if (score >= [[[array objectAtIndex:0] objectForKey:@"score"]intValue]) {
            NSLog(@"did score 1");
            PFQuery *query = [PFQuery queryWithClassName:@"leaderboard"];
            [query getObjectInBackgroundWithId:[[array objectAtIndex:0]objectId] block:^(PFObject *object, NSError *error){
                if (error) {
                    NSLog([error localizedDescription]);
                }
                //init with replacement
                [object setObject:user forKey:@"user"];
                [object setObject:scorenm forKey:@"score"];
                [object saveInBackgroundWithBlock:^(BOOL y, NSError *error){
                    if (error) {
                        NSLog([error localizedDescription]);
                    }
                }];
            }];
        }
        //2
        else if (score >= [[[array objectAtIndex:1] objectForKey:@"score"] intValue]){
            PFQuery *query = [PFQuery queryWithClassName:@"leaderboard"];
            [query getObjectInBackgroundWithId:[[array objectAtIndex:1]objectId] block:^(PFObject *object, NSError *error){
                //init with replacement
                [object setObject:user forKey:@"user"];
                [object setObject:scorenm forKey:@"score"];
                [object saveInBackground];
            }];
        }
        //3
        else if (score >= [[[array objectAtIndex:2] objectForKey:@"score"] intValue]){
            PFQuery *query = [PFQuery queryWithClassName:@"leaderboard"];
            [query getObjectInBackgroundWithId:[[array objectAtIndex:2]objectId] block:^(PFObject *object, NSError *error){
                //init with replacement
                [object setObject:user forKey:@"user"];
                [object setObject:scorenm forKey:@"score"];
                [object saveInBackground];
            }];
        }
        //4
        else if (score >= [[[array objectAtIndex:3] objectForKey:@"score"] intValue]){
            PFQuery *query = [PFQuery queryWithClassName:@"leaderboard"];
            [query getObjectInBackgroundWithId:[[array objectAtIndex:3]objectId] block:^(PFObject *object, NSError *error){
                //init with replacement
                [object setObject:user forKey:@"user"];
                [object setObject:scorenm forKey:@"score"];
                [object saveInBackground];
            }];
        }
        //5
        else if (score >= [[[array objectAtIndex:4] objectForKey:@"score"] intValue]){
            PFQuery *query = [PFQuery queryWithClassName:@"leaderboard"];
            [query getObjectInBackgroundWithId:[[array objectAtIndex:4]objectId] block:^(PFObject *object, NSError *error){
                //init with replacement
                [object setObject:user forKey:@"user"];
                [object setObject:scorenm forKey:@"score"];
                [object saveInBackground];
            }];
        }
            [self refresh];
    }];

}
- (IBAction)back_button:(id)sender {
    //pop to root view controller
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)refresh:(id)sender {
    [self refresh];
}
@end
