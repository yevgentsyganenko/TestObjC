//
//  IDPWasher.m
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPWasher.h"

#import "IDPCar.h"

@interface IDPWasher ()

- (BOOL)checkCarMoney:(IDPCar *)car;

@end

@implementation IDPWasher

#pragma mark -
#pragma mark Overridden

- (void)performWorkWithObject:(IDPCar *)car {
    if ([self checkCarMoney:car]) {
        [self washCar:car];
        
        NSLog(@"Car %@ has been washed", car.model);
    } else {
        NSLog(@"Car %@ has not enough money", car.model);
    }
}

#pragma mark -
#pragma mark Public

- (void)washCar:(IDPCar *)car {
    if (car) {
        [self takeMoney:self.price fromObject:car];
    }
}

#pragma mark -
#pragma mark Private

- (BOOL)checkCarMoney:(IDPCar *)car {
    return car.money >= self.price;
}

@end
