//
//  NSString+IDPAlphabet.m
//  TestObjC
//
//  Created by Genek on 5/3/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "NSString+IDPAlphabet.h"

#import "NSObject+IDPExtension.h"

@interface NSString ()

+ (instancetype)alphabetWithRange:(NSRange)range;

+ (instancetype)numericAlphabet;
+ (instancetype)alphanumericAlphabet;
+ (instancetype)lettersAlphabet;
+ (instancetype)uppercaseLettersAlphabet;
+ (instancetype)lowercaseLettersAlphabet;

@end

@implementation NSString (IDPAlphabet)

+ (instancetype)alphabetWithType:(IDPAlphabetType)type {
    switch (type) {
        case IDPNumericAlphabet:
            return [self numericAlphabet];
            
        case IDPAlphanumericAlphabet:
            return [self alphanumericAlphabet];
            
        case IDPLettersAlphabet:
            return [self lettersAlphabet];
            
        case IDPUppercaseLettersAlphabet:
            return [self uppercaseLettersAlphabet];
            
        case IDPLowercaseLettersAlphabet:
            return [self lowercaseLettersAlphabet];
    }
}

+ (instancetype)alphabetWithRange:(NSRange)range {
    NSMutableString *result = [NSMutableString object];
    unichar lastCharacter = NSMaxRange(range);

    for (unichar character = range.location; character < lastCharacter; character++) {
        [result appendFormat:@"%c", character];
    }
    
    return result;
}

+ (instancetype)numericAlphabet {
    return [self alphabetWithRange:NSMakeRange('0', 10)];
}

+ (instancetype)alphanumericAlphabet {
    return [[self numericAlphabet] stringByAppendingString:[self lettersAlphabet]];
}

+ (instancetype)lettersAlphabet {
    return [[self lowercaseLettersAlphabet] stringByAppendingString:[self uppercaseLettersAlphabet]];
}

+ (instancetype)uppercaseLettersAlphabet {
    return [self alphabetWithRange:NSMakeRange('A', 26)];
}

+ (instancetype)lowercaseLettersAlphabet {
    return [self alphabetWithRange:NSMakeRange('a', 26)];
}

@end
