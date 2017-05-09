//
//  NSArray+IDPExtensions.m
//  TestObjC
//
//  Created by Genek on 5/8/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "NSArray+IDPExtensions.h"

@implementation NSArray (IDPExtensions)

+ (nullable instancetype)arrayWithCount:(NSUInteger)count factory:(IDPFactoryBlock)block {
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger index = 0; index < count; index++) {
        [mutableArray addObject:block()];
    }
    
    return [NSArray arrayWithArray:mutableArray];
}

- (nullable id)objectOfClass:(nonnull Class)cls {
    return [self objectOfClass:cls withPredicate:nil];
}

- (nullable id)objectOfClass:(nonnull Class)cls withPredicate:(IDPPredicate)predicate {
    for (id object in self) {
        if ([object isMemberOfClass:cls]) {
            if (predicate && predicate(object)) {
                return object;
            }
        }
    }
    
    return nil;
}

@end
