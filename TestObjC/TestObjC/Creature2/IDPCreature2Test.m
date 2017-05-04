//
//  IDPCreature2Test.m
//  TestObjC
//
//  Created by Genek on 5/4/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPCreature2Test.h"

#import "IDPCreature2.h"
#import "IDPCreatureMale.h"
#import "IDPCreatureFemale.h"

#import "NSString+IDPRandomString.h"
#import "NSString+IDPAlphabet.h"

@interface IDPCreature2Test ()

+ (IDPCreatureMale *)maleWithName:(NSString *)name weight:(NSUInteger)weight age:(NSUInteger)age;
+ (IDPCreatureFemale *)femaleWithName:(NSString *)name weight:(NSUInteger)weight age:(NSUInteger)age;

@end

@implementation IDPCreature2Test

#pragma mark -
#pragma mark Public

+ (void)performTest {
    NSUInteger maleCount = 10;
    NSUInteger femaleCount = 10;
    NSMutableArray *creatures = [NSMutableArray arrayWithCapacity:maleCount + femaleCount];
    
    for (NSUInteger index = 0; index < maleCount; index++) {
        NSString *name = [[NSString randomStringWithAlphabet:[NSString alphabetWithType:IDPLowercaseLettersAlphabet]] capitalizedString];
        NSUInteger weight = arc4random_uniform(120) + 40;
        NSUInteger age = arc4random_uniform(100) + 18;
        NSUInteger identifier = arc4random_uniform(1000);
        id creature = nil;
        
        creature = 0 == identifier % 3
            ? [self maleWithName:name weight:weight age:age]
            : [self femaleWithName:name weight:weight age:age];
        
        NSLog(@"%@", creature);
        
        [creatures addObject:creature];
    }
    
    for (IDPCreature2 *creature in creatures) {
        [creature performGenderSpecificOperation];
    }
}

#pragma mark -
#pragma mark Private

+ (IDPCreatureMale *)maleWithName:(NSString *)name weight:(NSUInteger)weight age:(NSUInteger)age {
    return [IDPCreatureMale creatureWithName:name weight:weight age:age];
}

+ (IDPCreatureFemale *)femaleWithName:(NSString *)name weight:(NSUInteger)weight age:(NSUInteger)age {
    return [IDPCreatureFemale creatureWithName:name weight:weight age:age];
}

@end
