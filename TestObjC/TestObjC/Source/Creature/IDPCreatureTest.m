//
//  IDPCreatureTest.m
//  TestObjC
//
//  Created by Genek on 5/4/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPCreatureTest.h"

#import "IDPCreature.h"

#import "NSString+IDPRandomString.h"
#import "NSString+IDPAlphabet.h"

@interface IDPCreatureTest ()

+ (IDPCreature *)randomCreatureWithWeightRange:(NSRange)weightRange ageRange:(NSRange)ageRange;

@end

@implementation IDPCreatureTest

+ (void)performTest {
    NSUInteger creaturesCount = 10;
    
    for (NSUInteger index = 0; index < creaturesCount; index++) {
        IDPCreature *creature = [self randomCreatureWithWeightRange:NSMakeRange(40, 160) ageRange:NSMakeRange(18, 110)];
        NSUInteger randomChildrenCount = arc4random_uniform(5);
        
        for (NSUInteger index = 0; index < randomChildrenCount; index++) {
            [creature addChild:[self randomCreatureWithWeightRange:NSMakeRange(2, 20) ageRange:NSMakeRange(1, 16)]];
        }
        
        NSLog(@"%@", creature);
        NSLog(@"%@", creature.children);
        
        switch (creature.gender) {
            case IDPGenderMale:
                [creature fight];
                break;
                
            case IDPGenderFemale:
                [creature giveBirth];
                break;
                
            default:
                break;
        }
    }
}

#pragma mark -
#pragma mark Private

+ (IDPCreature *)randomCreatureWithWeightRange:(NSRange)weightRange ageRange:(NSRange)ageRange {
    IDPGender randomGender = arc4random_uniform(2);
    NSString *randomName = [[NSString randomStringWithAlphabet:[NSString alphabetWithType:IDPLowercaseLettersAlphabet]] capitalizedString];
    NSUInteger randomWeight = arc4random_uniform((uint32_t)(weightRange.location + weightRange.length)) + weightRange.location;
    NSUInteger randomAge = arc4random_uniform((uint32_t)(ageRange.location + ageRange.length)) + ageRange.location;
    
    return [IDPCreature creatureWithGender:randomGender
                                      name:randomName
                                    weight:randomWeight
                                       age:randomAge];
}

@end
