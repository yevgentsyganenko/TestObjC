//
//  IDPCreatureFemale.m
//  TestObjC
//
//  Created by Genek on 5/4/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPCreatureFemale.h"

#import "NSObject+IDPExtensions.h"

@interface IDPCreatureFemale ()

- (IDPCreature2 *)giveBirth;

@end

@implementation IDPCreatureFemale

#pragma mark -
#pragma mark Overridden

- (void)performGenderSpecificOperation {
    [self giveBirth];
}

#pragma mark -
#pragma mark Private

- (IDPCreature2 *)giveBirth {
    NSLog(@"New child!");
    
    return [IDPCreature2 object];
}

@end
