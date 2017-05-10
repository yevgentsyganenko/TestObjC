//
//  IDPEnterprise.m
//  TestObjC
//
//  Created by Genek on 5/8/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPEnterprise.h"

//#import "IDPEmployee.h"
#import "IDPWasher.h"
#import "IDPAccountant.h"
#import "IDPDirector.h"
#import "IDPCar.h"

#import "IDPCarwash.h"
#import "IDPAdministration.h"
#import "IDPCarwashRoom.h"
#import "IDPRoom.h"

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
    IDPCar *car = [self.mutableCars firstObject];
    IDPWasher *washer = [self freeEmployeeOfClass:[IDPWasher class]];
    if (car) {
        <#statements#>
    }
    for (IDPCar *car in self.mutableCars) {
        IDPWasher *washer = [self freeEmployeeOfClass:[IDPWasher class]];
//        IDPAccountant *accountant = [self freeEmployeeOfClass:[IDPAccountant class]];
//        IDPDirector *director = [self freeEmployeeOfClass:[IDPDirector class]];
        
        [washer processObject:car];
//        [accountant processObject:washer];
//        [director processObject:accountant];
        
        [self removeCar:car];
    }
}

#pragma mark -
#pragma mark IDPObserver

- (SEL)selectorForState:(IDPEmployeeState)state {
    switch (state) {
        case IDPEmployeeStateBusy:
            return NULL;
            
        case IDPEmployeeStateFree:
            return @selector(employeeDidBecomeFree:);
            
        case IDPEmployeeStateReadyForProcessing:
            return NULL;
    }
    
    return NULL;
}

#pragma mark -
#pragma mark IDPEmployeeObserver

- (void)employeeDidBecomeFree:(IDPWasher *)washer {
    IDPCar *car = [self.mutableCars firstObject];
    if (car) {
        [self removeCar:car];
        [washer processObject:car];
    }
}

#pragma mark -
#pragma mark Private

- (void)prepareBuildings {
    IDPAdministration *administrationBuilding = [IDPAdministration buildingWithRoomsAmount:1];
    IDPCarwash *carwashBuilding = [IDPCarwash buildingWithRoomsAmount:1];
    
    IDPRoom *administrationRoom = [IDPRoom roomWithPeopleCapacity:2];
    IDPCarwashRoom *carwashRoom = [IDPCarwashRoom roomWithPeopleCapacity:1 carsCapacity:1];
    
    IDPWasher *washer = [self freeEmployeeOfClass:[IDPWasher class]];
    IDPAccountant *accountant = [self freeEmployeeOfClass:[IDPAccountant class]];
    IDPDirector *director = [self freeEmployeeOfClass:[IDPDirector class]];
    
    [administrationBuilding addRoom:administrationRoom];
    [carwashBuilding addCarwashRoom:carwashRoom];
    
    [administrationRoom addPerson:accountant];
    [administrationRoom addPerson:director];
    [carwashRoom addPerson:washer];
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
    
    [washer addObserver:accountant];
    [washer addObserver:self];
    [accountant addObserver:director];
        
    [self.mutableWorkers addObjectsFromArray:@[washer, accountant, director]];
}

- (id)freeEmployeeOfClass:(Class)cls {
    return [self.mutableWorkers objectOfClass:cls withPredicate:^BOOL(IDPEmployee *employee) {
        return IDPEmployeeStateFree == employee.state;
    }];
}

@end
