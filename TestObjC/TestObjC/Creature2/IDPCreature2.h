//
//  IDPCreature2.h
//  TestObjC
//
//  Created by Genek on 5/4/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IDPCreature2 : NSObject
@property (nonatomic, copy)         NSString        *name;
@property (nonatomic, assign)       NSUInteger      weight;
@property (nonatomic, assign)       NSUInteger      age;
@property (nonatomic, readonly)     NSArray         *children;

+ (instancetype)creature;

+ (instancetype)creatureWithName:(NSString *)name;

+ (instancetype)creatureWithName:(NSString *)name
                          weight:(NSUInteger)weight
                             age:(NSUInteger)age;

- (instancetype)initWithName:(NSString *)name;

- (instancetype)initWithName:(NSString *)name
                      weight:(NSUInteger)weight
                         age:(NSUInteger)age;

- (void)addChild:(IDPCreature2 *)child;
- (void)removeChild:(IDPCreature2 *)child;

- (void)performGenderSpecificOperation;

@end
