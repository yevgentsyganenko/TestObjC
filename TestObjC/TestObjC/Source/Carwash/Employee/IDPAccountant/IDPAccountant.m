//
//  IDPAccountant.m
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPAccountant.h"

#import "IDPWasher.h"

@implementation IDPAccountant

#pragma mark -
#pragma mark Overridden

- (void)performWorkWithObject:(IDPWasher *)washer {
    [self calculateMoney:self.money];
}

#pragma mark -
#pragma mark Public

- (void)calculateMoney:(NSUInteger)money {
    NSLog(@"Accountant %@ calculated money: %lu", self.name, money);
}

@end
