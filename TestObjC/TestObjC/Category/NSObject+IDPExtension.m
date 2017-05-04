//
//  NSObject+IDPExtension.m
//  TestObjC
//
//  Created by Genek on 5/4/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "NSObject+IDPExtension.h"

@implementation NSObject (IDPExtension)

- (instancetype)object {
    return [[[self alloc] init] autorelease];
}

@end
