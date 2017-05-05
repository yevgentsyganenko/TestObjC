//
//  IDPCreature2.m
//  TestObjC
//
//  Created by Genek on 5/4/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPCreature2.h"

#import "NSObject+IDPExtension.h"

static NSString * const _Nonnull IDPCreatureDescriptionFormatString     = @"%@, Name: %@, Age: %lu Weight: %lu";

@interface IDPCreature2 ()
@property (nonatomic, retain)   NSMutableArray     *mutableChildren;

@end

@implementation IDPCreature2

@dynamic children;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)creature {
    return [self object];
}

+ (instancetype)creatureWithName:(NSString *)name {
    return [[[self alloc] initWithName:name] autorelease];
}

+ (instancetype)creatureWithName:(NSString *)name
                          weight:(NSUInteger)weight
                             age:(NSUInteger)age
{
    return [[[self alloc] initWithName:name
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
    return [self initWithName:nil];
}

- (instancetype)initWithName:(NSString *)name {
    return [self initWithName:name weight:0 age:0];
}

- (instancetype)initWithName:(NSString *)name
                      weight:(NSUInteger)weight
                         age:(NSUInteger)age
{
    self = [super init];
    if (self) {
        self.mutableChildren = [NSMutableArray array];
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
            [self class],
            self.name,
            self.age,
            self.weight];
}

- (void)performGenderSpecificOperation {
    
}

#pragma mark -
#pragma mark Public

- (void)addChild:(IDPCreature2 *)child {
    NSMutableArray *children = self.mutableChildren;
    if (child && ![children containsObject:child]) {
        [self.mutableChildren addObject:child];
    }
}

- (void)removeChild:(IDPCreature2 *)child {
    [self.mutableChildren removeObject:child];
}

@end
