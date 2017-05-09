//
//  IDPObservableObject.m
//  TestObjC
//
//  Created by Gene on 5/9/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPObservableObject.h"

@interface IDPObservableObject ()
@property (nonatomic, retain)   NSMutableSet    *mutableObserversSet;

@end

@implementation IDPObservableObject

#pragma mark -
#pragma mark Public

- (void)addObserver:(id)observer {
    
}

- (void)removeObserver:(id)observer {
    
}

#pragma mark -
#pragma mark Private

- (void)notifyOfStateChange:(NSUInteger)state {
    for (id observer in self.observersSet) {
        [self notifyWithSelector:[observer selectorForState:state]];
    }
}

//- (void)notifyWithSelector:(SEL)selector {
//    
//}

@end
