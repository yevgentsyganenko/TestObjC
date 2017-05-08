//
//  IDPDirector.m
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPDirector.h"

#import "IDPAccountant.h"

@implementation IDPDirector

#pragma mark -
#pragma mark Overridden

- (void)performWorkWithObject:(IDPAccountant *)accountant {
    [self makeProfit];
}

#pragma mark -
#pragma mark Public

- (void)makeProfit {
    NSLog(@"Director %@ profit: %lu", self.name, self.money);
}

@end
