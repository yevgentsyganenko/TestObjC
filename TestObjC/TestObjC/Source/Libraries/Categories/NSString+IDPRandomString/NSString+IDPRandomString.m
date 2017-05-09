//
//  NSString+IDPRandomString.m
//  TestObjC
//
//  Created by Genek on 5/3/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "NSString+IDPRandomString.h"

#import "NSString+IDPAlphabet.h"

static const NSUInteger IDPDefaultCharactersLength = 10;

@implementation NSString (IDPRandomString)

+ (instancetype)randomString {
    return [self randomStringWithLength:IDPDefaultCharactersLength];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length {
    return [self randomStringWithLength:length alphabet:[NSString alphabetWithType:IDPAlphanumericAlphabet]];
}

+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet {
    return [self randomStringWithLength:IDPDefaultCharactersLength alphabet:alphabet];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet {
    NSMutableString *result = [NSMutableString stringWithCapacity:length];
    NSUInteger count = [alphabet length];
    
    for (NSUInteger index = 0; index < length; index++) {
        [result appendFormat:@"%c", [alphabet characterAtIndex:arc4random_uniform((uint32_t)count)]];
    }
    
    return [[result copy] autorelease];
}

@end
