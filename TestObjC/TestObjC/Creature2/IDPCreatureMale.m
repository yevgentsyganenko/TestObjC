//
//  IDPCreatureMale.m
//  TestObjC
//
//  Created by Genek on 5/4/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPCreatureMale.h"

@interface IDPCreatureMale ()

- (void)fight;

@end

@implementation IDPCreatureMale

#pragma mark -
#pragma mark Overridden

- (void)performGenderSpecificOperation {
    [self fight];
}

#pragma mark -
#pragma mark Private

- (void)fight {
    NSLog(@"Fight!");
}

@end
