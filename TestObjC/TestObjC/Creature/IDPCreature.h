//
//  IDPCreature.h
//  TestObjC
//
//  Created by Genek on 5/4/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, IDPGender) {
    IDPGenderMale,
    IDPGenderFemale
};

@interface IDPCreature : NSObject
@property (nonatomic, assign)       IDPGender       gender;
@property (nonatomic, copy)         NSString        *name;
@property (nonatomic, assign)       NSUInteger      weight;
@property (nonatomic, assign)       NSUInteger      age;
@property (nonatomic, readonly)     NSArray         *children;

+ (instancetype)creature;

+ (instancetype)creatureWithGender:(IDPGender)gender
                              name:(NSString *)name;

+ (instancetype)creatureWithGender:(IDPGender)gender
                              name:(NSString *)name
                            weight:(NSUInteger)weight
                               age:(NSUInteger)age;

- (instancetype)initWithGender:(IDPGender)gender
                          name:(NSString *)name;

- (instancetype)initWithGender:(IDPGender)gender
                          name:(NSString *)name
                        weight:(NSUInteger)weight
                           age:(NSUInteger)age;

- (void)addChild:(IDPCreature *)child;
- (void)removeChild:(IDPCreature *)child;

- (void)fight;
- (IDPCreature *)giveBirth;

- (void)sayHi;

@end
