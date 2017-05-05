//
//  IDPCarwash.m
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPCarwash.h"

@interface IDPCarwash ()
@property (nonatomic, retain)   NSMutableArray      *mutableCarwashRooms;
@property (nonatomic, assign)   NSUInteger          carwashRoomsAmount;

@end

@implementation IDPCarwash

@dynamic carwashRooms;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)carwashWithCarwashRoomsAmount:(NSUInteger)carwashRoomsAmount
                                  roomsAmount:(NSUInteger)roomsAmount
{
    return [[[self alloc] initWithCarwashRoomsAmount:carwashRoomsAmount roomsAmount:roomsAmount] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableCarwashRooms = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithCarwashRoomsAmount:0 roomsAmount:0];
}

- (instancetype)initWithRoomsAmount:(NSUInteger)roomsAmount {
    return [self initWithCarwashRoomsAmount:0 roomsAmount:roomsAmount];
}

- (instancetype)initWithCarwashRoomsAmount:(NSUInteger)carwashRoomsAmount
                               roomsAmount:(NSUInteger)roomsAmount
{
    self = [super initWithRoomsAmount:roomsAmount];
    if (self) {
        self.carwashRoomsAmount = carwashRoomsAmount;
        self.mutableCarwashRooms = [NSMutableArray arrayWithCapacity:carwashRoomsAmount];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)carwashRooms {
    return [[[self mutableCarwashRooms] copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)addCarwashRoom:(IDPCarwashRoom *)carwashRoom {
    NSMutableArray *mutableCarwashRooms = self.mutableCarwashRooms;
    if (carwashRoom && self.carwashRoomsAmount > mutableCarwashRooms.count && ![mutableCarwashRooms containsObject:carwashRoom]) {
        [mutableCarwashRooms addObject:carwashRoom];
    }
}

- (void)removeCarwashRoom:(IDPCarwashRoom *)carwashRoom {
    [self.mutableCarwashRooms removeObject:carwashRoom];
}

@end
