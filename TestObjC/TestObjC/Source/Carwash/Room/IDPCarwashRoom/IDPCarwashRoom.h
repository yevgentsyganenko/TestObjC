//
//  IDPCarwashRoom.h
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IDPRoom.h"

@class IDPCar;

@interface IDPCarwashRoom : IDPRoom
@property (nonatomic, readonly)     NSUInteger      carsCapacity;
@property (nonatomic, readonly)     NSArray         *cars;

+ (instancetype)roomWithPeopleCapacity:(NSUInteger)peopleCapacity
                          carsCapacity:(NSUInteger)carsCapacity;

- (instancetype)init;
- (instancetype)initWithPeopleCapacity:(NSUInteger)peopleCapacity
                          carsCapacity:(NSUInteger)carsCapacity NS_DESIGNATED_INITIALIZER;

- (void)addCar:(IDPCar *)car;
- (void)removeCar:(IDPCar *)car;

@end
