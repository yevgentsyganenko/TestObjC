//
//  NSArray+IDPExtensions.h
//  TestObjC
//
//  Created by Genek on 5/8/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef _Nullable id(^_Nonnull IDPFactoryBlock)();
typedef BOOL(^_Nullable IDPPredicate)(_Nonnull id);

@interface NSArray (IDPExtensions)

+ (nullable instancetype)arrayWithCount:(NSUInteger)count factory:(IDPFactoryBlock)block;

- (nullable id)objectOfClass:(nonnull Class)cls;
- (nullable id)objectOfClass:(nonnull Class)cls withPredicate:(IDPPredicate)predicate;

@end
