//
//  NSObject+IDPExtensions.m
//  TestObjC
//
//  Created by Genek on 5/4/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "NSObject+IDPExtensions.h"

#import "NSArray+IDPExtensions.h"

@implementation NSObject (IDPExtension)

+ (instancetype)object {
    return [[self new] autorelease];
}

+ (NSArray *)objectsWithCount:(NSUInteger)count {
    return [NSArray arrayWithCount:count factory:^id {
        return [self object];
    }];
}

@end
