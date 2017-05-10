//
//  IDPObservableObject.m
//  TestObjC
//
//  Created by Gene on 5/9/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPObservableObject.h"

@interface IDPObservableObject ()
@property (nonatomic, retain)   NSMutableSet<IDPObserver>   *mutableObserversSet;

@end

@implementation IDPObservableObject

@dynamic observersSet;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableObserversSet = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObserversSet = [NSMutableSet<IDPObserver> set];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet<IDPObserver> *)observersSet {
    return [[self.mutableObserversSet copy] autorelease];
}

- (void)setState:(NSUInteger)state {
    if (_state != state) {
        _state = state;
        
        [self notifyOfStateChange:state];
    }
}

#pragma mark -
#pragma mark Public

- (void)addObserver:(id<IDPObserver>)observer {
    if (observer) {
        [self.mutableObserversSet addObject:observer];
    }
}

- (void)removeObserver:(id<IDPObserver>)observer {
    
}

#pragma mark -
#pragma mark Private

- (void)notifyOfStateChange:(NSUInteger)state {
    for (id<IDPObserver> observer in self.observersSet) {
        [self notifyObserver:observer withSelector:[observer selectorForState:state]];
    }
}

- (void)notifyObserver:(id<IDPObserver>)observer withSelector:(SEL)selector {
    if ([observer respondsToSelector:selector]) {
        [observer performSelector:selector withObject:self];
    }
}

@end
