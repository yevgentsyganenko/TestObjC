//
//  IDPBuilding.h
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IDPRoom;

@interface IDPBuilding : NSObject
@property (nonatomic, readonly)     NSArray     *rooms;
@property (nonatomic, readonly)     NSUInteger  roomsAmount;

+ (instancetype)buildingWithRoomsAmount:(NSUInteger)roomsAmount;

- (instancetype)initWithRoomsAmount:(NSUInteger)roomsAmount NS_DESIGNATED_INITIALIZER;

- (void)addRoom:(IDPRoom *)room;
- (void)removeRoom:(IDPRoom *)room;

@end
