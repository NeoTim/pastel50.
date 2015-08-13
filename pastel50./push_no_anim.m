//
//  push_no_anim.m
//  pastel50.
//
//  Created by Sean Lim on 13/8/15.
//  Copyright (c) 2015 Tangent.inc. All rights reserved.
//

#import "push_no_anim.h"

@implementation push_no_anim
-(void) perform{
    [[[self sourceViewController] navigationController] pushViewController:[self   destinationViewController] animated:NO];
}
@end
