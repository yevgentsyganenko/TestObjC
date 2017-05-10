//
//  IDPObservableObject.h
//  TestObjC
//
//  Created by Gene on 5/9/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IDPObserver.h"

@interface IDPObservableObject : NSObject
@property (nonatomic, assign)   NSUInteger          state;
@property (nonatomic, readonly) NSSet<IDPObserver>  *observersSet;

- (void)addObserver:(id<IDPObserver>)observer;
- (void)removeObserver:(id<IDPObserver>)observer;

@end
