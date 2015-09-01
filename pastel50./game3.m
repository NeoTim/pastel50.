//
//  ViewController.m
//  Icode
//
//  Created by Benjamin Koh on 19/8/15.
//  Copyright (c) 2015 Tangent.Inc. All rights reserved.
//

#import "game3.h"

@interface game3 ()

@end

@implementation game3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

double time_count_3 = 0;

float timedsp = 30;
int answerno[4][4];
bool didenter = true;
int question;
int score_3;

- (IBAction)STARTTEST:(id)sender {
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(persec:) userInfo:nil repeats:YES];
    
}
-(void) persec: (NSTimer*)persectimer {
    if (timedsp > 0) {
        time_count_3 = time_count_3 + 0.1;
        timedsp = 30.0 - time_count_3;
        [_TimeLeft setText:[NSString stringWithFormat:@"%0.1f", timedsp]];
        [self random];}
    else {
            if (score_3 >3) {
                [ _INFO setText:@"You Win"];
            } else {
                [_INFO setText:@"Sorry"];
            }}
        
        
    }



-(void)random{//randomizer
     srand((unsigned int)time(NULL));
    if ( didenter == true ) {
        
        didenter = false;
int p[16] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};

//shuffle p

    for (int i=15; i>-1; --i)
{
    //get swap index
    int j = rand()%16;
    //swap p[i] with p[j]
    int temp = p[i];
    p[i] = p[j];
    p[j] = temp;
            }
        int row = 0;
        int column = 0;
        for (int button = 0 ; button < 17;) {
            answerno[row][column] = p[button];
            column++;
            button++;
            if (column == 4) {
                row++;
                column = 0;
            }
        }
        
        
        if (didenter == false) {
            [self loadvalues];
}
   
    }
    
   
    
    
}
-(void) loadvalues{
    _R1_C1.enabled = YES;
    _R1_C2.enabled = YES;
    _R1_C3.enabled = YES;
    _R1_C4.enabled = YES;
    _R2_C1.enabled = YES;
    _R2_C2.enabled = YES;
    _R2_C3.enabled = YES;
    _R2_C4.enabled = YES;
    _R3_C1.enabled = YES;
    _R3_C2.enabled = YES;
    _R3_C3.enabled = YES;
    _R3_C4.enabled = YES;
    _R4_C1.enabled = YES;
    _R4_C2.enabled = YES;
    _R4_C3.enabled = YES;
    _R4_C4.enabled = YES;

    
    question = arc4random()%16;
    switch (question) {
        case 0:
            [_INFO setText:@"An estimate of something"];
            break;
        case 1:
            [_INFO setText:@"Cannot one"];
            break;
        case 2:
            [_INFO setText:@"Too complex to understand"];
            break;
        case 3:
            [_INFO setText:@"Singlish way of saying correct"];
            break;
        case 4:
            [_INFO setText:@"Used to describe something bad"];
            break;
        case 5:
            [_INFO setText:@"Should have said earlier"];
            break;
        case 6:
            [_INFO setText:@"Truancy or AWOL"];
            break;
        case 7:
            [_INFO setText:@"Pleasurable, ecstatic"];
            break;
        case 8:
            [_INFO setText:@"Obviously"];
            break;
        case 9:
            [_INFO setText:@"Used to describe how blur one is"];
            break;
        case 10:
            [_INFO setText:@"Used to describe how confident or ‘’zai’’ someone is"];
            break;
        case 11:
            [_INFO setText:@"A hokkien phrase which means never invite"];
            break;
        case 12:
            [_INFO setText:@"Used to show your irritation"];
            break;
        case 13:
            [_INFO setText:@"Mild curse used to disabuse someone of his or her erroneous assumption."];
            break;
        case 14:
            [_INFO setText:@"To reserve something, commonmly used for seats"];
            break;
        case 15:
            [_INFO setText:@"It is commonly used convey a general cautionary sentiment with a hint of foreboding"];
            break;}
    switch (answerno[0][0]) {
        case 0:
            [_R1_C1 setImage:[UIImage imageNamed:@"agaragar.png"] forState:UIControlStateNormal];
            break;
        case 1:
             [_R1_C1 setImage:[UIImage imageNamed:@"cannot.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_R1_C1 setImage:[UIImage imageNamed:@"cheem.png"] forState:UIControlStateNormal];
            break;
        case 3:
             [_R1_C1 setImage:[UIImage imageNamed:@"corright.png"] forState:UIControlStateNormal];
            break;
        case 4:
             [_R1_C1 setImage:[UIImage imageNamed:@"jialat.png"] forState:UIControlStateNormal];
            break;
        case 5:
             [_R1_C1 setImage:[UIImage imageNamed:@"NEVERSAY.png"] forState:UIControlStateNormal];
            break;
        case 6:
             [_R1_C1 setImage:[UIImage imageNamed:@"poteng.png"] forState:UIControlStateNormal];
            break;
        case 7:
             [_R1_C1 setImage:[UIImage imageNamed:@"shiok.png"] forState:UIControlStateNormal];
            break;
        case 8:
             [_R1_C1 setImage:[UIImage imageNamed:@"singlish .png"] forState:UIControlStateNormal];
            break;
        case 9:
             [_R1_C1 setImage:[UIImage imageNamed:@"sotong.png"] forState:UIControlStateNormal];
            break;
        case 10:
             [_R1_C1 setImage:[UIImage imageNamed:@"steady.png"] forState:UIControlStateNormal];
            break;
        case 11:
             [_R1_C1 setImage:[UIImage imageNamed:@"bojio.png"] forState:UIControlStateNormal];
            break;
        case 12:
             [_R1_C1 setImage:[UIImage imageNamed:@"yahlah.png"] forState:UIControlStateNormal];
            break;
        case 13:
             [_R1_C1 setImage:[UIImage imageNamed:@"ypurhead.png"] forState:UIControlStateNormal];
            break;
        case 14:
             [_R1_C1 setImage:[UIImage imageNamed:@"chope.png"] forState:UIControlStateNormal];
            break;
        case 15:
             [_R1_C1 setImage:[UIImage imageNamed:@"sekali.png"] forState:UIControlStateNormal];
        break;}
    switch (answerno[0][1]) {
        case 0:
            [_R1_C2 setImage:[UIImage imageNamed:@"agaragar.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [_R1_C2 setImage:[UIImage imageNamed:@"cannot.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_R1_C2 setImage:[UIImage imageNamed:@"cheem.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [_R1_C2 setImage:[UIImage imageNamed:@"corright.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [_R1_C2 setImage:[UIImage imageNamed:@"jialat.png"] forState:UIControlStateNormal];
            break;
        case 5:
            [_R1_C2 setImage:[UIImage imageNamed:@"NEVERSAY.png"] forState:UIControlStateNormal];
            break;
        case 6:
            [_R1_C2 setImage:[UIImage imageNamed:@"poteng.png"] forState:UIControlStateNormal];
            break;
        case 7:
            [_R1_C2 setImage:[UIImage imageNamed:@"shiok.png"] forState:UIControlStateNormal];
            break;
        case 8:
            [_R1_C2 setImage:[UIImage imageNamed:@"singlish .png"] forState:UIControlStateNormal];
            break;
        case 9:
            [_R1_C2 setImage:[UIImage imageNamed:@"sotong.png"] forState:UIControlStateNormal];
            break;
        case 10:
            [_R1_C2 setImage:[UIImage imageNamed:@"steady.png"] forState:UIControlStateNormal];
            break;
        case 11:
            [_R1_C2 setImage:[UIImage imageNamed:@"bojio.png"] forState:UIControlStateNormal];
            break;
        case 12:
            [_R1_C2 setImage:[UIImage imageNamed:@"yahlah.png"] forState:UIControlStateNormal];
            break;
        case 13:
            [_R1_C2 setImage:[UIImage imageNamed:@"ypurhead.png"] forState:UIControlStateNormal];
            break;
        case 14:
            [_R1_C2 setImage:[UIImage imageNamed:@"chope.png"] forState:UIControlStateNormal];
            break;
        case 15:
            [_R1_C2 setImage:[UIImage imageNamed:@"sekali.png"] forState:UIControlStateNormal];
        break;}
    switch (answerno[0][2]) {
        case 0:
            [_R1_C3 setImage:[UIImage imageNamed:@"agaragar.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [_R1_C3 setImage:[UIImage imageNamed:@"cannot.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_R1_C3 setImage:[UIImage imageNamed:@"cheem.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [_R1_C3 setImage:[UIImage imageNamed:@"corright.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [_R1_C3 setImage:[UIImage imageNamed:@"jialat.png"] forState:UIControlStateNormal];
            break;
        case 5:
            [_R1_C3 setImage:[UIImage imageNamed:@"NEVERSAY.png"] forState:UIControlStateNormal];
            break;
        case 6:
            [_R1_C3 setImage:[UIImage imageNamed:@"poteng.png"] forState:UIControlStateNormal];
            break;
        case 7:
            [_R1_C3 setImage:[UIImage imageNamed:@"shiok.png"] forState:UIControlStateNormal];
            break;
        case 8:
            [_R1_C3 setImage:[UIImage imageNamed:@"singlish .png"] forState:UIControlStateNormal];
            break;
        case 9:
            [_R1_C3 setImage:[UIImage imageNamed:@"sotong.png"] forState:UIControlStateNormal];
            break;
        case 10:
            [_R1_C3 setImage:[UIImage imageNamed:@"steady.png"] forState:UIControlStateNormal];
            break;
        case 11:
            [_R1_C3 setImage:[UIImage imageNamed:@"bojio.png"] forState:UIControlStateNormal];
            break;
        case 12:
            [_R1_C3 setImage:[UIImage imageNamed:@"yahlah.png"] forState:UIControlStateNormal];
            break;
        case 13:
            [_R1_C3 setImage:[UIImage imageNamed:@"ypurhead.png"] forState:UIControlStateNormal];
            break;
        case 14:
            [_R1_C3 setImage:[UIImage imageNamed:@"chope.png"] forState:UIControlStateNormal];
            break;
        case 15:
            [_R1_C3 setImage:[UIImage imageNamed:@"sekali.png"] forState:UIControlStateNormal];
        break;}
    switch (answerno[0][3]) {
        case 0:
            [_R1_C4 setImage:[UIImage imageNamed:@"agaragar.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [_R1_C4 setImage:[UIImage imageNamed:@"cannot.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_R1_C4 setImage:[UIImage imageNamed:@"cheem.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [_R1_C4 setImage:[UIImage imageNamed:@"corright.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [_R1_C4 setImage:[UIImage imageNamed:@"jialat.png"] forState:UIControlStateNormal];
            break;
        case 5:
            [_R1_C4 setImage:[UIImage imageNamed:@"NEVERSAY.png"] forState:UIControlStateNormal];
            break;
        case 6:
            [_R1_C4 setImage:[UIImage imageNamed:@"poteng.png"] forState:UIControlStateNormal];
            break;
        case 7:
            [_R1_C4 setImage:[UIImage imageNamed:@"shiok.png"] forState:UIControlStateNormal];
            break;
        case 8:
            [_R1_C4 setImage:[UIImage imageNamed:@"singlish .png"] forState:UIControlStateNormal];
            break;
        case 9:
            [_R1_C4 setImage:[UIImage imageNamed:@"sotong.png"] forState:UIControlStateNormal];
            break;
        case 10:
            [_R1_C4 setImage:[UIImage imageNamed:@"steady.png"] forState:UIControlStateNormal];
            break;
        case 11:
            [_R1_C4 setImage:[UIImage imageNamed:@"bojio.png"] forState:UIControlStateNormal];
            break;
        case 12:
            [_R1_C4 setImage:[UIImage imageNamed:@"yahlah.png"] forState:UIControlStateNormal];
            break;
        case 13:
            [_R1_C4 setImage:[UIImage imageNamed:@"ypurhead.png"] forState:UIControlStateNormal];
            break;
        case 14:
            [_R1_C4 setImage:[UIImage imageNamed:@"chope.png"] forState:UIControlStateNormal];
            break;
        case 15:
            [_R1_C4 setImage:[UIImage imageNamed:@"sekali.png"] forState:UIControlStateNormal];
        break;}
    switch (answerno[1][0]) {
        case 0:
            [_R2_C1 setImage:[UIImage imageNamed:@"agaragar.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [_R2_C1 setImage:[UIImage imageNamed:@"cannot.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_R2_C1 setImage:[UIImage imageNamed:@"cheem.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [_R2_C1 setImage:[UIImage imageNamed:@"corright.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [_R2_C1 setImage:[UIImage imageNamed:@"jialat.png"] forState:UIControlStateNormal];
            break;
        case 5:
            [_R2_C1 setImage:[UIImage imageNamed:@"NEVERSAY.png"] forState:UIControlStateNormal];
            break;
        case 6:
            [_R2_C1 setImage:[UIImage imageNamed:@"poteng.png"] forState:UIControlStateNormal];
            break;
        case 7:
            [_R2_C1 setImage:[UIImage imageNamed:@"shiok.png"] forState:UIControlStateNormal];
            break;
        case 8:
            [_R2_C1 setImage:[UIImage imageNamed:@"singlish .png"] forState:UIControlStateNormal];
            break;
        case 9:
            [_R2_C1 setImage:[UIImage imageNamed:@"sotong.png"] forState:UIControlStateNormal];
            break;
        case 10:
            [_R2_C1 setImage:[UIImage imageNamed:@"steady.png"] forState:UIControlStateNormal];
            break;
        case 11:
            [_R2_C1 setImage:[UIImage imageNamed:@"bojio.png"] forState:UIControlStateNormal];
            break;
        case 12:
            [_R2_C1 setImage:[UIImage imageNamed:@"yahlah.png"] forState:UIControlStateNormal];
            break;
        case 13:
            [_R2_C1 setImage:[UIImage imageNamed:@"ypurhead.png"] forState:UIControlStateNormal];
            break;
        case 14:
            [_R2_C1 setImage:[UIImage imageNamed:@"chope.png"] forState:UIControlStateNormal];
            break;
        case 15:
            [_R2_C1 setImage:[UIImage imageNamed:@"sekali.png"] forState:UIControlStateNormal];
        break;}
    switch (answerno[1][1]) {
        case 0:
            [_R2_C2 setImage:[UIImage imageNamed:@"agaragar.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [_R2_C2 setImage:[UIImage imageNamed:@"cannot.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_R2_C2 setImage:[UIImage imageNamed:@"cheem.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [_R2_C2 setImage:[UIImage imageNamed:@"corright.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [_R2_C2 setImage:[UIImage imageNamed:@"jialat.png"] forState:UIControlStateNormal];
            break;
        case 5:
            [_R2_C2 setImage:[UIImage imageNamed:@"NEVERSAY.png"] forState:UIControlStateNormal];
            break;
        case 6:
            [_R2_C2 setImage:[UIImage imageNamed:@"poteng.png"] forState:UIControlStateNormal];
            break;
        case 7:
            [_R2_C2 setImage:[UIImage imageNamed:@"shiok.png"] forState:UIControlStateNormal];
            break;
        case 8:
            [_R2_C2 setImage:[UIImage imageNamed:@"singlish .png"] forState:UIControlStateNormal];
            break;
        case 9:
            [_R2_C2 setImage:[UIImage imageNamed:@"sotong.png"] forState:UIControlStateNormal];
            break;
        case 10:
            [_R2_C2 setImage:[UIImage imageNamed:@"steady.png"] forState:UIControlStateNormal];
            break;
        case 11:
            [_R2_C2 setImage:[UIImage imageNamed:@"bojio.png"] forState:UIControlStateNormal];
            break;
        case 12:
            [_R2_C2 setImage:[UIImage imageNamed:@"yahlah.png"] forState:UIControlStateNormal];
            break;
        case 13:
            [_R2_C2 setImage:[UIImage imageNamed:@"ypurhead.png"] forState:UIControlStateNormal];
            break;
        case 14:
            [_R2_C2 setImage:[UIImage imageNamed:@"chope.png"] forState:UIControlStateNormal];
            break;
        case 15:
            [_R2_C2 setImage:[UIImage imageNamed:@"sekali.png"] forState:UIControlStateNormal];
        break;}
    switch (answerno[1][2]) {
        case 0:
            [_R2_C3 setImage:[UIImage imageNamed:@"agaragar.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [_R2_C3 setImage:[UIImage imageNamed:@"cannot.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_R2_C3 setImage:[UIImage imageNamed:@"cheem.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [_R2_C3 setImage:[UIImage imageNamed:@"corright.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [_R2_C3 setImage:[UIImage imageNamed:@"jialat.png"] forState:UIControlStateNormal];
            break;
        case 5:
            [_R2_C3 setImage:[UIImage imageNamed:@"NEVERSAY.png"] forState:UIControlStateNormal];
            break;
        case 6:
            [_R2_C3 setImage:[UIImage imageNamed:@"poteng.png"] forState:UIControlStateNormal];
            break;
        case 7:
            [_R2_C3 setImage:[UIImage imageNamed:@"shiok.png"] forState:UIControlStateNormal];
            break;
        case 8:
            [_R2_C3 setImage:[UIImage imageNamed:@"singlish .png"] forState:UIControlStateNormal];
            break;
        case 9:
            [_R2_C3 setImage:[UIImage imageNamed:@"sotong.png"] forState:UIControlStateNormal];
            break;
        case 10:
            [_R2_C3 setImage:[UIImage imageNamed:@"steady.png"] forState:UIControlStateNormal];
            break;
        case 11:
            [_R2_C3 setImage:[UIImage imageNamed:@"bojio.png"] forState:UIControlStateNormal];
            break;
        case 12:
            [_R2_C3 setImage:[UIImage imageNamed:@"yahlah.png"] forState:UIControlStateNormal];
            break;
        case 13:
            [_R2_C3 setImage:[UIImage imageNamed:@"ypurhead.png"] forState:UIControlStateNormal];
            break;
        case 14:
            [_R2_C3 setImage:[UIImage imageNamed:@"chope.png"] forState:UIControlStateNormal];
            break;
        case 15:
            [_R2_C3 setImage:[UIImage imageNamed:@"sekali.png"] forState:UIControlStateNormal];
        break;}
    switch (answerno[1][3]) {
        case 0:
            [_R2_C4 setImage:[UIImage imageNamed:@"agaragar.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [_R2_C4 setImage:[UIImage imageNamed:@"cannot.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_R2_C4 setImage:[UIImage imageNamed:@"cheem.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [_R2_C4 setImage:[UIImage imageNamed:@"corright.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [_R2_C4 setImage:[UIImage imageNamed:@"jialat.png"] forState:UIControlStateNormal];
            break;
        case 5:
            [_R2_C4 setImage:[UIImage imageNamed:@"NEVERSAY.png"] forState:UIControlStateNormal];
            break;
        case 6:
            [_R2_C4 setImage:[UIImage imageNamed:@"poteng.png"] forState:UIControlStateNormal];
            break;
        case 7:
            [_R2_C4 setImage:[UIImage imageNamed:@"shiok.png"] forState:UIControlStateNormal];
            break;
        case 8:
            [_R2_C4 setImage:[UIImage imageNamed:@"singlish .png"] forState:UIControlStateNormal];
            break;
        case 9:
            [_R2_C4 setImage:[UIImage imageNamed:@"sotong.png"] forState:UIControlStateNormal];
            break;
        case 10:
            [_R2_C4 setImage:[UIImage imageNamed:@"steady.png"] forState:UIControlStateNormal];
            break;
        case 11:
            [_R2_C4 setImage:[UIImage imageNamed:@"bojio.png"] forState:UIControlStateNormal];
            break;
        case 12:
            [_R2_C4 setImage:[UIImage imageNamed:@"yahlah.png"] forState:UIControlStateNormal];
            break;
        case 13:
            [_R2_C4 setImage:[UIImage imageNamed:@"ypurhead.png"] forState:UIControlStateNormal];
            break;
        case 14:
            [_R2_C4 setImage:[UIImage imageNamed:@"chope.png"] forState:UIControlStateNormal];
            break;
        case 15:
            [_R2_C4 setImage:[UIImage imageNamed:@"sekali.png"] forState:UIControlStateNormal];
        break;}
    switch (answerno[2][0]) {
        case 0:
            [_R3_C1 setImage:[UIImage imageNamed:@"agaragar.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [_R3_C1 setImage:[UIImage imageNamed:@"cannot.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_R3_C1 setImage:[UIImage imageNamed:@"cheem.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [_R3_C1 setImage:[UIImage imageNamed:@"corright.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [_R3_C1 setImage:[UIImage imageNamed:@"jialat.png"] forState:UIControlStateNormal];
            break;
        case 5:
            [_R3_C1 setImage:[UIImage imageNamed:@"NEVERSAY.png"] forState:UIControlStateNormal];
            break;
        case 6:
            [_R3_C1 setImage:[UIImage imageNamed:@"poteng.png"] forState:UIControlStateNormal];
            break;
        case 7:
            [_R3_C1 setImage:[UIImage imageNamed:@"shiok.png"] forState:UIControlStateNormal];
            break;
        case 8:
            [_R3_C1 setImage:[UIImage imageNamed:@"singlish .png"] forState:UIControlStateNormal];
            break;
        case 9:
            [_R3_C1 setImage:[UIImage imageNamed:@"sotong.png"] forState:UIControlStateNormal];
            break;
        case 10:
            [_R3_C1 setImage:[UIImage imageNamed:@"steady.png"] forState:UIControlStateNormal];
            break;
        case 11:
            [_R3_C1 setImage:[UIImage imageNamed:@"bojio.png"] forState:UIControlStateNormal];
            break;
        case 12:
            [_R3_C1 setImage:[UIImage imageNamed:@"yahlah.png"] forState:UIControlStateNormal];
            break;
        case 13:
            [_R3_C1 setImage:[UIImage imageNamed:@"ypurhead.png"] forState:UIControlStateNormal];
            break;
        case 14:
            [_R3_C1 setImage:[UIImage imageNamed:@"chope.png"] forState:UIControlStateNormal];
            break;
        case 15:
            [_R3_C1 setImage:[UIImage imageNamed:@"sekali.png"] forState:UIControlStateNormal];
        break;}
    
    switch (answerno[2][1]) {
        case 0:
            [_R3_C2 setImage:[UIImage imageNamed:@"agaragar.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [_R3_C2 setImage:[UIImage imageNamed:@"cannot.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_R3_C2 setImage:[UIImage imageNamed:@"cheem.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [_R3_C2 setImage:[UIImage imageNamed:@"corright.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [_R3_C2 setImage:[UIImage imageNamed:@"jialat.png"] forState:UIControlStateNormal];
            break;
        case 5:
            [_R3_C2 setImage:[UIImage imageNamed:@"NEVERSAY.png"] forState:UIControlStateNormal];
            break;
        case 6:
            [_R3_C2 setImage:[UIImage imageNamed:@"poteng.png"] forState:UIControlStateNormal];
            break;
        case 7:
            [_R3_C2 setImage:[UIImage imageNamed:@"shiok.png"] forState:UIControlStateNormal];
            break;
        case 8:
            [_R3_C2 setImage:[UIImage imageNamed:@"singlish .png"] forState:UIControlStateNormal];
            break;
        case 9:
            [_R3_C2 setImage:[UIImage imageNamed:@"sotong.png"] forState:UIControlStateNormal];
            break;
        case 10:
            [_R3_C2 setImage:[UIImage imageNamed:@"steady.png"] forState:UIControlStateNormal];
            break;
        case 11:
            [_R3_C2 setImage:[UIImage imageNamed:@"bojio.png"] forState:UIControlStateNormal];
            break;
        case 12:
            [_R3_C2 setImage:[UIImage imageNamed:@"yahlah.png"] forState:UIControlStateNormal];
            break;
        case 13:
            [_R3_C2 setImage:[UIImage imageNamed:@"ypurhead.png"] forState:UIControlStateNormal];
            break;
        case 14:
            [_R3_C2 setImage:[UIImage imageNamed:@"chope.png"] forState:UIControlStateNormal];
            break;
        case 15:
            [_R3_C2 setImage:[UIImage imageNamed:@"sekali.png"] forState:UIControlStateNormal];
        break;}
    switch (answerno[2][2]) {
        case 0:
            [_R3_C3 setImage:[UIImage imageNamed:@"agaragar.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [_R3_C3 setImage:[UIImage imageNamed:@"cannot.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_R3_C3 setImage:[UIImage imageNamed:@"cheem.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [_R3_C3 setImage:[UIImage imageNamed:@"corright.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [_R3_C3 setImage:[UIImage imageNamed:@"jialat.png"] forState:UIControlStateNormal];
            break;
        case 5:
            [_R3_C3 setImage:[UIImage imageNamed:@"NEVERSAY.png"] forState:UIControlStateNormal];
            break;
        case 6:
            [_R3_C3 setImage:[UIImage imageNamed:@"poteng.png"] forState:UIControlStateNormal];
            break;
        case 7:
            [_R3_C3 setImage:[UIImage imageNamed:@"shiok.png"] forState:UIControlStateNormal];
            break;
        case 8:
            [_R3_C3 setImage:[UIImage imageNamed:@"singlish .png"] forState:UIControlStateNormal];
            break;
        case 9:
            [_R3_C3 setImage:[UIImage imageNamed:@"sotong.png"] forState:UIControlStateNormal];
            break;
        case 10:
            [_R3_C3 setImage:[UIImage imageNamed:@"steady.png"] forState:UIControlStateNormal];
            break;
        case 11:
            [_R3_C3 setImage:[UIImage imageNamed:@"bojio.png"] forState:UIControlStateNormal];
            break;
        case 12:
            [_R3_C3 setImage:[UIImage imageNamed:@"yahlah.png"] forState:UIControlStateNormal];
            break;
        case 13:
            [_R3_C3 setImage:[UIImage imageNamed:@"ypurhead.png"] forState:UIControlStateNormal];
            break;
        case 14:
            [_R3_C3 setImage:[UIImage imageNamed:@"chope.png"] forState:UIControlStateNormal];
            break;
        case 15:
            [_R3_C3 setImage:[UIImage imageNamed:@"sekali.png"] forState:UIControlStateNormal];
        break;}
    switch (answerno[2][3]) {
        case 0:
            [_R3_C4 setImage:[UIImage imageNamed:@"agaragar.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [_R3_C4 setImage:[UIImage imageNamed:@"cannot.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_R3_C4 setImage:[UIImage imageNamed:@"cheem.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [_R3_C4 setImage:[UIImage imageNamed:@"corright.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [_R3_C4 setImage:[UIImage imageNamed:@"jialat.png"] forState:UIControlStateNormal];
            break;
        case 5:
            [_R3_C4 setImage:[UIImage imageNamed:@"NEVERSAY.png"] forState:UIControlStateNormal];
            break;
        case 6:
            [_R3_C4 setImage:[UIImage imageNamed:@"poteng.png"] forState:UIControlStateNormal];
            break;
        case 7:
            [_R3_C4 setImage:[UIImage imageNamed:@"shiok.png"] forState:UIControlStateNormal];
            break;
        case 8:
            [_R3_C4 setImage:[UIImage imageNamed:@"singlish .png"] forState:UIControlStateNormal];
            break;
        case 9:
            [_R3_C4 setImage:[UIImage imageNamed:@"sotong.png"] forState:UIControlStateNormal];
            break;
        case 10:
            [_R3_C4 setImage:[UIImage imageNamed:@"steady.png"] forState:UIControlStateNormal];
            break;
        case 11:
            [_R3_C4 setImage:[UIImage imageNamed:@"bojio.png"] forState:UIControlStateNormal];
            break;
        case 12:
            [_R3_C4 setImage:[UIImage imageNamed:@"yahlah.png"] forState:UIControlStateNormal];
            break;
        case 13:
            [_R3_C4 setImage:[UIImage imageNamed:@"ypurhead.png"] forState:UIControlStateNormal];
            break;
        case 14:
            [_R3_C4 setImage:[UIImage imageNamed:@"chope.png"] forState:UIControlStateNormal];
            break;
        case 15:
            [_R3_C4 setImage:[UIImage imageNamed:@"sekali.png"] forState:UIControlStateNormal];
        break;}
    switch (answerno[3][0]) {
        case 0:
            [_R4_C1 setImage:[UIImage imageNamed:@"agaragar.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [_R4_C1 setImage:[UIImage imageNamed:@"cannot.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_R4_C1 setImage:[UIImage imageNamed:@"cheem.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [_R4_C1 setImage:[UIImage imageNamed:@"corright.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [_R4_C1 setImage:[UIImage imageNamed:@"jialat.png"] forState:UIControlStateNormal];
            break;
        case 5:
            [_R4_C1 setImage:[UIImage imageNamed:@"NEVERSAY.png"] forState:UIControlStateNormal];
            break;
        case 6:
            [_R4_C1 setImage:[UIImage imageNamed:@"poteng.png"] forState:UIControlStateNormal];
            break;
        case 7:
            [_R4_C1 setImage:[UIImage imageNamed:@"shiok.png"] forState:UIControlStateNormal];
            break;
        case 8:
            [_R4_C1 setImage:[UIImage imageNamed:@"singlish .png"] forState:UIControlStateNormal];
            break;
        case 9:
            [_R4_C1 setImage:[UIImage imageNamed:@"sotong.png"] forState:UIControlStateNormal];
            break;
        case 10:
            [_R4_C1 setImage:[UIImage imageNamed:@"steady.png"] forState:UIControlStateNormal];
            break;
        case 11:
            [_R4_C1 setImage:[UIImage imageNamed:@"bojio.png"] forState:UIControlStateNormal];
            break;
        case 12:
            [_R4_C1 setImage:[UIImage imageNamed:@"yahlah.png"] forState:UIControlStateNormal];
            break;
        case 13:
            [_R4_C1 setImage:[UIImage imageNamed:@"ypurhead.png"] forState:UIControlStateNormal];
            break;
        case 14:
            [_R4_C1 setImage:[UIImage imageNamed:@"chope.png"] forState:UIControlStateNormal];
            break;
        case 15:
            [_R4_C1 setImage:[UIImage imageNamed:@"sekali.png"] forState:UIControlStateNormal];
        break;}
    
    switch (answerno[3][1]) {
        case 0:
            [_R4_C2 setImage:[UIImage imageNamed:@"agaragar.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [_R4_C2 setImage:[UIImage imageNamed:@"cannot.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_R4_C2 setImage:[UIImage imageNamed:@"cheem.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [_R4_C2 setImage:[UIImage imageNamed:@"corright.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [_R4_C2 setImage:[UIImage imageNamed:@"jialat.png"] forState:UIControlStateNormal];
            break;
        case 5:
            [_R4_C2 setImage:[UIImage imageNamed:@"NEVERSAY.png"] forState:UIControlStateNormal];
            break;
        case 6:
            [_R4_C2 setImage:[UIImage imageNamed:@"poteng.png"] forState:UIControlStateNormal];
            break;
        case 7:
            [_R4_C2 setImage:[UIImage imageNamed:@"shiok.png"] forState:UIControlStateNormal];
            break;
        case 8:
            [_R4_C2 setImage:[UIImage imageNamed:@"singlish .png"] forState:UIControlStateNormal];
            break;
        case 9:
            [_R4_C2 setImage:[UIImage imageNamed:@"sotong.png"] forState:UIControlStateNormal];
            break;
        case 10:
            [_R4_C2 setImage:[UIImage imageNamed:@"steady.png"] forState:UIControlStateNormal];
            break;
        case 11:
            [_R4_C2 setImage:[UIImage imageNamed:@"bojio.png"] forState:UIControlStateNormal];
            break;
        case 12:
            [_R4_C2 setImage:[UIImage imageNamed:@"yahlah.png"] forState:UIControlStateNormal];
            break;
        case 13:
            [_R4_C2 setImage:[UIImage imageNamed:@"ypurhead.png"] forState:UIControlStateNormal];
            break;
        case 14:
            [_R4_C2 setImage:[UIImage imageNamed:@"chope.png"] forState:UIControlStateNormal];
            break;
        case 15:
            [_R4_C2 setImage:[UIImage imageNamed:@"sekali.png"] forState:UIControlStateNormal];
        break;}
    switch (answerno[3][2]) {
        case 0:
            [_R4_C3 setImage:[UIImage imageNamed:@"agaragar.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [_R4_C3 setImage:[UIImage imageNamed:@"cannot.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_R4_C3 setImage:[UIImage imageNamed:@"cheem.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [_R4_C3 setImage:[UIImage imageNamed:@"corright.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [_R4_C3 setImage:[UIImage imageNamed:@"jialat.png"] forState:UIControlStateNormal];
            break;
        case 5:
            [_R4_C3 setImage:[UIImage imageNamed:@"NEVERSAY.png"] forState:UIControlStateNormal];
            break;
        case 6:
            [_R4_C3 setImage:[UIImage imageNamed:@"poteng.png"] forState:UIControlStateNormal];
            break;
        case 7:
            [_R4_C3 setImage:[UIImage imageNamed:@"shiok.png"] forState:UIControlStateNormal];
            break;
        case 8:
            [_R4_C3 setImage:[UIImage imageNamed:@"singlish .png"] forState:UIControlStateNormal];
            break;
        case 9:
            [_R4_C3 setImage:[UIImage imageNamed:@"sotong.png"] forState:UIControlStateNormal];
            break;
        case 10:
            [_R4_C3 setImage:[UIImage imageNamed:@"steady.png"] forState:UIControlStateNormal];
            break;
        case 11:
            [_R4_C3 setImage:[UIImage imageNamed:@"bojio.png"] forState:UIControlStateNormal];
            break;
        case 12:
            [_R4_C3 setImage:[UIImage imageNamed:@"yahlah.png"] forState:UIControlStateNormal];
            break;
        case 13:
            [_R4_C3 setImage:[UIImage imageNamed:@"ypurhead.png"] forState:UIControlStateNormal];
            break;
        case 14:
            [_R4_C3 setImage:[UIImage imageNamed:@"chope.png"] forState:UIControlStateNormal];
            break;
        case 15:
            [_R4_C3 setImage:[UIImage imageNamed:@"sekali.png"] forState:UIControlStateNormal];
        break;}
    switch (answerno[3][3]) {
        case 0:
            [_R4_C4 setImage:[UIImage imageNamed:@"agaragar.png"] forState:UIControlStateNormal];
            break;
        case 1:
            [_R4_C4 setImage:[UIImage imageNamed:@"cannot.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [_R4_C4 setImage:[UIImage imageNamed:@"cheem.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [_R4_C4 setImage:[UIImage imageNamed:@"corright.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [_R4_C4 setImage:[UIImage imageNamed:@"jialat.png"] forState:UIControlStateNormal];
            break;
        case 5:
            [_R4_C4 setImage:[UIImage imageNamed:@"NEVERSAY.png"] forState:UIControlStateNormal];
            break;
        case 6:
            [_R4_C4 setImage:[UIImage imageNamed:@"poteng.png"] forState:UIControlStateNormal];
            break;
        case 7:
            [_R4_C4 setImage:[UIImage imageNamed:@"shiok.png"] forState:UIControlStateNormal];
            break;
        case 8:
            [_R4_C4 setImage:[UIImage imageNamed:@"singlish .png"] forState:UIControlStateNormal];
            break;
        case 9:
            [_R4_C4 setImage:[UIImage imageNamed:@"sotong.png"] forState:UIControlStateNormal];
            break;
        case 10:
            [_R4_C4 setImage:[UIImage imageNamed:@"steady.png"] forState:UIControlStateNormal];
            break;
        case 11:
            [_R4_C4 setImage:[UIImage imageNamed:@"bojio.png"] forState:UIControlStateNormal];
            break;
        case 12:
            [_R4_C4 setImage:[UIImage imageNamed:@"yahlah.png"] forState:UIControlStateNormal];
            break;
        case 13:
            [_R4_C4 setImage:[UIImage imageNamed:@"ypurhead.png"] forState:UIControlStateNormal];
            break;
        case 14:
            [_R4_C4 setImage:[UIImage imageNamed:@"chope.png"] forState:UIControlStateNormal];
            break;
        case 15:
            [_R4_C4 setImage:[UIImage imageNamed:@"sekali.png"] forState:UIControlStateNormal];
        break;}








    
    
    }




- (IBAction)R1_C1:(id)sender {
    if (answerno[0][0] == question) {
               score_3 ++;
        
    }
    didenter = true;
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;
    

}

- (IBAction)R1_C2:(id)sender {
    if (answerno[0][1] == question) {
        score_3 ++;
        
    }
    didenter = true;
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;



}

- (IBAction)R1_C3:(id)sender {
    if (answerno[0][2] == question) {
        score_3 ++;
        
    }
    didenter = true;
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;

}

- (IBAction)R1_C4:(id)sender {
    if (answerno[0][3] == question) {
        score_3 ++;
        
    }
    didenter = true;
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;

}

- (IBAction)R2_C1:(id)sender {
    if (answerno[1][0] == question) {
        score_3 ++;
        
    }
    didenter = true;
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;

}

- (IBAction)R2_C2:(id)sender {
    if (answerno[1][1] == question) {
        score_3 ++;
        
    }
    didenter = true;
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;

}

- (IBAction)R2_C3:(id)sender {
    if (answerno[1][2] == question) {
        score_3 ++;
        
    }
    didenter = true;
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;

}

- (IBAction)R2_C4:(id)sender {
    if (answerno[1][3] == question) {
        score_3 ++;
        
    }
    didenter = true;
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;

}

- (IBAction)R3_C1:(id)sender {
    if (answerno[2][0] == question) {
        score_3 ++;
        
    }
    didenter = true;
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;

}

- (IBAction)R3_C2:(id)sender {
    if (answerno[2][1] == question) {
        score_3 ++;
        
    }
    didenter = true;
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;

}

- (IBAction)R3_C3:(id)sender {
    if (answerno[2][2] == question) {
        score_3 ++;
        
    }
    didenter = true;
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;

}

- (IBAction)R3_C4:(id)sender {
    if (answerno[2][3] == question) {
        score_3 ++;
        
    }
    didenter = true;
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;

}

- (IBAction)R4_C1:(id)sender {
    if (answerno[3][0] == question) {
        score_3 ++;
        
    }
    didenter = true;
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;

}

- (IBAction)R4_C2:(id)sender {
    if (answerno[3][1] == question) {
        score_3 ++;
        
    }
    didenter = true;
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;

}

- (IBAction)R4_C3:(id)sender {
    if (answerno[3][2] == question) {
        score_3 ++;
        
    }
    didenter = true;
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;

}

- (IBAction)R4_C4:(id)sender {
    if (answerno[3][3] == question) {
        score_3 ++;
    }
    didenter = true;
    _R1_C1.enabled = NO;
    _R1_C2.enabled = NO;
    _R1_C3.enabled = NO;
    _R1_C4.enabled = NO;
    _R2_C1.enabled = NO;
    _R2_C2.enabled = NO;
    _R2_C3.enabled = NO;
    _R2_C4.enabled = NO;
    _R3_C1.enabled = NO;
    _R3_C2.enabled = NO;
    _R3_C3.enabled = NO;
    _R3_C4.enabled = NO;
    _R4_C1.enabled = NO;
    _R4_C2.enabled = NO;
    _R4_C3.enabled = NO;
    _R4_C4.enabled = NO;

}

@end
