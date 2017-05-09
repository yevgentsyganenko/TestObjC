//
//  NSString+IDPAlphabet.h
//  TestObjC
//
//  Created by Genek on 5/3/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, IDPAlphabetType) {
    IDPNumericAlphabet,
    IDPAlphanumericAlphabet,
    IDPLettersAlphabet,
    IDPUppercaseLettersAlphabet,
    IDPLowercaseLettersAlphabet
};

@interface NSString (IDPAlphabet)

+ (instancetype)alphabetWithType:(IDPAlphabetType)type;

@end
