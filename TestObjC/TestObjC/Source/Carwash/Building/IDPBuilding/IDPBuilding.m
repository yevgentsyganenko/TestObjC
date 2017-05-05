//
//  IDPBuilding.m
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPBuilding.h"

@interface IDPBuilding ()
@property (nonatomic, retain)     NSMutableArray    *mutableRooms;
@property (nonatomic, assign)     NSUInteger        roomsAmount;

@end

@implementation IDPBuilding

@dynamic rooms;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)buildingWithRoomsAmount:(NSUInteger)roomsAmount {
    return [[[self alloc] initWithRoomsAmount:roomsAmount] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableRooms = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithRoomsAmount:0];
}

- (instancetype)initWithRoomsAmount:(NSUInteger)roomsAmount {
    self = [super init];
    if (self) {
        self.roomsAmount = roomsAmount;
        self.mutableRooms = [NSMutableArray arrayWithCapacity:roomsAmount];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)rooms {
    return [[[self mutableRooms] copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)addRoom:(IDPRoom *)room {
    NSMutableArray *mutableRooms = self.mutableRooms;
    if (room && self.roomsAmount > mutableRooms.count && ![mutableRooms containsObject:room]) {
        [mutableRooms addObject:room];
    }
}

- (void)removeRoom:(IDPRoom *)room {
    [self.mutableRooms removeObject:room];
}

@end
