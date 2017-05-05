//
//  IDPCreature.m
//  TestObjC
//
//  Created by Genek on 5/4/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPCreature.h"

#import "NSObject+IDPExtension.h"

static NSString * const _Nonnull IDPCreatureDescriptionFormatString     = @"IDPCreature: Gender: %s, Name: %@, Age: %lu Weight: %lu";

@interface IDPCreature ()
@property (nonatomic, retain)   NSMutableArray     *mutableChildren;

@end

@implementation IDPCreature

@dynamic children;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)creature {
    return [self object];
}

+ (instancetype)creatureWithGender:(IDPGender)gender
                              name:(NSString *)name
{
    return [[[self alloc] initWithGender:gender name:name] autorelease];
}

+ (instancetype)creatureWithGender:(IDPGender)gender
                              name:(NSString *)name
                            weight:(NSUInteger)weight
                               age:(NSUInteger)age
{
    return [[[self alloc] initWithGender:gender
                                    name:name
                                  weight:weight
                                     age:age] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.name = nil;
    self.mutableChildren = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithGender:IDPGenderNone name:nil];
}

- (instancetype)initWithGender:(IDPGender)gender
                          name:(NSString *)name
{
    return [self initWithGender:gender name:name weight:0 age:0];
}

- (instancetype)initWithGender:(IDPGender)gender
                          name:(NSString *)name
                        weight:(NSUInteger)weight
                           age:(NSUInteger)age
{
    self = [super init];
    if (self) {
        self.mutableChildren = [NSMutableArray array];
        self.gender = gender;
        self.name = name;
        self.weight = weight;
        self.age = age;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)children {
    return [[[self mutableChildren] copy] autorelease];
}

#pragma mark -
#pragma mark Overridden

- (NSString *)description {
    return [NSString stringWithFormat:IDPCreatureDescriptionFormatString,
            IDPGenderMale == self.gender ? "Male" : "Female",
            self.name,
            self.age,
            self.weight];
}

#pragma mark -
#pragma mark Public

- (void)addChild:(IDPCreature *)child {
    NSMutableArray *children = self.mutableChildren;
    if (child && ![children containsObject:child]) {
        [self.mutableChildren addObject:child];
    }
}

- (void)removeChild:(IDPCreature *)child {
    [self.mutableChildren removeObject:child];
}

- (void)fight {
    NSLog(@"Fight!");
}

- (IDPCreature *)giveBirth {
    NSLog(@"New child!");
    
    return [IDPCreature object];
}

- (void)sayHi {
    NSLog(@"Hi!");
    
    for (IDPCreature *child in self.children) {
        [child sayHi];
    }
}

@end
