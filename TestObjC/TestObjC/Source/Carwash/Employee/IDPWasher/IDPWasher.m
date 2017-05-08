//
//  IDPWasher.m
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPWasher.h"

#import "IDPCar.h"

@implementation IDPWasher

#pragma mark -
#pragma mark Overridden

- (void)performWorkWithObject:(IDPCar *)car {
    [self washCar:car];
}

#pragma mark -
#pragma mark Public

- (void)washCar:(IDPCar *)car {
    if (car) {
        car.state = IDPCarStateClean;
        
        NSLog(@"Washer %@ washed car %@", self.name, car.model);
    }
}

@end
