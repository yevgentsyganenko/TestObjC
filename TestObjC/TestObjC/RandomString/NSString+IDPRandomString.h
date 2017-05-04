//
//  NSString+IDPRandomString.h
//  TestObjC
//
//  Created by Genek on 5/3/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (IDPRandomString)

+ (instancetype)randomString;
+ (instancetype)randomStringWithLength:(NSUInteger)length;
+ (instancetype)randomStringWithAlphabet:(NSString *)alphabet;
+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet;

@end
