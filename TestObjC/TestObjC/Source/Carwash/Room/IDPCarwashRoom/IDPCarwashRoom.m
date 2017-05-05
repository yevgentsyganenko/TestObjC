//
//  IDPCarwashRoom.m
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPCarwashRoom.h"

@interface IDPCarwashRoom ()
@property (nonatomic, assign)     NSUInteger      	carsCapacity;
@property (nonatomic, retain)     NSMutableArray    *mutableCars;

@end

@implementation IDPCarwashRoom

@dynamic cars;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)roomWithPeopleCapacity:(NSUInteger)peopleCapacity
                          carsCapacity:(NSUInteger)carsCapacity
{
    return [[[self alloc] initWithPeopleCapacity:peopleCapacity carsCapacity:carsCapacity] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableCars = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithPeopleCapacity:0];
}

- (instancetype)initWithPeopleCapacity:(NSUInteger)peopleCapacity {
    return [self initWithPeopleCapacity:peopleCapacity carsCapacity:0];
}

- (instancetype)initWithPeopleCapacity:(NSUInteger)peopleCapacity
                          carsCapacity:(NSUInteger)carsCapacity
{
    self = [super initWithPeopleCapacity:peopleCapacity];
    if (self) {
        self.carsCapacity = carsCapacity;
        self.mutableCars = [NSMutableArray arrayWithCapacity:carsCapacity];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)cars {
    return [[[self mutableCars] copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)addCar:(IDPCar *)car {
    NSMutableArray *mutableCars = self.mutableCars;
    if (car && self.carsCapacity > mutableCars.count && ![mutableCars containsObject:car]) {
        [mutableCars addObject:car];
    }
}

- (void)removeCar:(IDPCar *)car {
    [self.mutableCars removeObject:car];
}

@end
