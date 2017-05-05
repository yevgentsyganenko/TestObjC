//
//  IDPRoom.m
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPRoom.h"

@interface IDPRoom ()
@property (nonatomic, assign)     NSUInteger      	peopleCapacity;
@property (nonatomic, retain)     NSMutableArray    *mutablePeople;

@end

@implementation IDPRoom

@dynamic people;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)roomWithPeopleCapacity:(NSUInteger)peopleCapacity {
    return [[[self alloc] initWithPeopleCapacity:peopleCapacity] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutablePeople = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithPeopleCapacity:0];
}

- (instancetype)initWithPeopleCapacity:(NSUInteger)peopleCapacity {
    self = [super init];
    if (self) {
        self.peopleCapacity = peopleCapacity;
        self.mutablePeople = [NSMutableArray arrayWithCapacity:peopleCapacity];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)people {
    return [[[self mutablePeople] copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)addPerson:(IDPEmployee *)person {
    NSMutableArray *mutablePeople = self.mutablePeople;
    if (person && self.peopleCapacity > mutablePeople.count && ![mutablePeople containsObject:person]) {
        [mutablePeople addObject:person];
    }
}

- (void)removePerson:(IDPEmployee *)person {
    [self.mutablePeople removeObject:person];
}

@end
