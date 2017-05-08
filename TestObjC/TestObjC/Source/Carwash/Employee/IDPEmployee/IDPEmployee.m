//
//  IDPEmployee.m
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPEmployee.h"

@implementation IDPEmployee

#pragma mark -
#pragma mark Class Methods

+ (instancetype)employeeWithName:(NSString *)name {
    return [self employeeWithName:name experience:0 salary:0 money:0];
}

+ (instancetype)employeeWithName:(NSString *)name
                      experience:(NSUInteger)experience
                          salary:(NSUInteger)salary
                           money:(NSUInteger)money
{
    return [[[self alloc] initWithName:name experience:experience salary:salary money:money] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.name = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithName:nil];
}

- (instancetype)initWithName:(NSString *)name {
    return [self initWithName:name experience:0 salary:0 money:0];
}

- (instancetype)initWithName:(NSString *)name
                  experience:(NSUInteger)experience
                      salary:(NSUInteger)salary
                       money:(NSUInteger)money
{
    self = [super init];
    if (self) {
        self.name = name;
        self.experience = experience;
        self.salary = salary;
        self.money = money;
    }
    
    return self;
}

#pragma mark -
#pragma mark IDPMoneyTransfer

- (void)takeMoney:(NSUInteger)money fromObject:(id<IDPMoney>)object {
    if (money <= object.money) {
        self.money += money;
        object.money -= money;
    }
}

#pragma mark -
#pragma mark Public

- (void)processObject:(id<IDPMoney>)object {
    [self takeMoney:object.money fromObject:object];
    [self performWorkWithObject:object];
}

- (void)performWorkWithObject:(id)object {
    
}

@end
