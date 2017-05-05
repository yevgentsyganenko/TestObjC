//
//  IDPCarwash.h
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IDPBuilding.h"

@class IDPCarwashRoom;

@interface IDPCarwash : IDPBuilding
@property (nonatomic, readonly)     NSArray     *carwashRooms;
@property (nonatomic, readonly)     NSUInteger  carwashRoomsAmount;

+ (instancetype)carwashWithCarwashRoomsAmount:(NSUInteger)carwashRoomsAmount
                                  roomsAmount:(NSUInteger)roomsAmount;

- (instancetype)initWithCarwashRoomsAmount:(NSUInteger)carwashRoomsAmount
                               roomsAmount:(NSUInteger)roomsAmount NS_DESIGNATED_INITIALIZER;

- (void)addCarwashRoom:(IDPCarwashRoom *)carwashRoom;
- (void)removeCarwashRoom:(IDPCarwashRoom *)carwashRoom;

@end
