//
//  IDPEnterpriseTest.m
//  TestObjC
//
//  Created by Genek on 5/8/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPEnterpriseTest.h"

#import "IDPEnterprise.h"
#import "IDPCar.h"

#import "NSObject+IDPExtension.h"
#import "NSString+IDPRandomString.h"
#import "NSString+IDPAlphabet.h"

static const NSUInteger IDPCarsCount = 10;

void testCarwashWithCarsCount(NSUInteger carsCount) {
    IDPEnterprise *carwash = [IDPEnterprise object];
    
    for (NSUInteger index = 0; index < IDPCarsCount; index++) {
        NSString *carModel = [NSString randomStringWithLength:5];
        IDPCar *car = [IDPCar carWithModel:carModel money:100];
        
        [carwash addCar:car];
    }
    
    [carwash runCarwash];
}
