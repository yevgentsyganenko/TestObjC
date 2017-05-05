//
//  IDPRoom.h
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IDPEmployee;

@interface IDPRoom : NSObject
@property (nonatomic, readonly)     NSUInteger      peopleCapacity;
@property (nonatomic, readonly)     NSArray         *people;

+ (instancetype)roomWithPeopleCapacity:(NSUInteger)peopleCapacity;

- (instancetype)init;
- (instancetype)initWithPeopleCapacity:(NSUInteger)peopleCapacity NS_DESIGNATED_INITIALIZER;

- (void)addPerson:(IDPEmployee *)person;
- (void)removePerson:(IDPEmployee *)person;

@end
