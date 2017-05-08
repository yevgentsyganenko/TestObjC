//
//  IDPEnterprise.m
//  TestObjC
//
//  Created by Genek on 5/8/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPEnterprise.h"

#import "IDPEmployee.h"
#import "IDPWasher.h"
#import "IDPAccountant.h"
#import "IDPDirector.h"
#import "IDPCar.h"

#import "NSArray+IDPExtensions.h"
#import "NSString+IDPRandomString.h"
#import "NSString+IDPAlphabet.h"

static const NSUInteger IDPWorkersCount     = 3;

@interface IDPEnterprise ()
@property (nonatomic, retain)   NSMutableArray  *mutableCars;
@property (nonatomic, retain)   NSMutableArray  *mutableWorkers;

- (void)prepareBuildings;
- (void)prepareStaff;

- (id)freeEmployeeOfClass:(Class)cls;

@end

@implementation IDPEnterprise

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableCars = nil;
    self.mutableWorkers = nil;
    
    [super dealloc];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableWorkers = [NSMutableArray arrayWithCapacity:IDPWorkersCount];
        self.mutableCars = [NSMutableArray array];
        
        [self prepareBuildings];
        [self prepareStaff];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addCar:(IDPCar *)car {
    NSMutableArray *mutableCars = self.mutableCars;
    if (car && ![mutableCars containsObject:car]) {
        [mutableCars addObject:car];
    }
}

- (void)removeCar:(IDPCar *)car {
    [self.mutableCars removeObject:car];
}

- (void)runCarwash {
    for (IDPCar *car in self.mutableCars) {
        IDPWasher *washer = [self freeEmployeeOfClass:[IDPWasher class]];
        IDPAccountant *accountant = [self freeEmployeeOfClass:[IDPAccountant class]];
        IDPDirector *director = [self freeEmployeeOfClass:[IDPDirector class]];
        
        [washer processObject:car];
        [accountant processObject:washer];
        [director processObject:accountant];
    }
}

#pragma mark -
#pragma mark Private

- (void)prepareBuildings {
    
}

- (void)prepareStaff {
//    NSMutableArray *names = [NSMutableArray arrayWithCapacity:IDPWorkersCount];
//    for (NSUInteger index = 0; index < IDPWorkersCount; index++) {
//        [names addObject:[[NSString randomStringWithLength:5 alphabet:[NSString alphabetWithType:IDPLettersAlphabet]] capitalizedString]];
//    }
    
    NSArray *names = [NSArray arrayWithCount:IDPWorkersCount factory:^id {
        return [[NSString randomStringWithLength:5 alphabet:[NSString alphabetWithType:IDPLettersAlphabet]] capitalizedString];
    }];
    
    IDPWasher *washer = [IDPWasher employeeWithName:names[0]];
    IDPAccountant *accountant = [IDPAccountant employeeWithName:names[1]];
    IDPDirector *director = [IDPDirector employeeWithName:names[2]];
        
    [self.mutableWorkers addObjectsFromArray:@[washer, accountant, director]];
}

- (id)freeEmployeeOfClass:(Class)cls {
    return [self.mutableWorkers objectOfClass:cls withPredicate:^BOOL(IDPEmployee *employee) {
        return IDPEmployeeStateFree == employee.state;
    }];
}

@end
