//
//  IDPEmployee.h
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IDPMoneyProtocol.h"
#import "IDPTakeMoneyProtocol.h"

typedef NS_ENUM(NSUInteger, IDPEmployeeState) {
    IDPEmployeeStateFree,
    IDPEmployeeStateBusy
};

@interface IDPEmployee : NSObject <IDPMoneyProtocol, IDPTakeMoneyProtocol>
@property (nonatomic, copy)     NSString            *name;
@property (nonatomic, assign)   NSUInteger          experience;
@property (nonatomic, assign)   NSUInteger          salary;
//@property (nonatomic, assign)   NSUInteger          money;
@property (nonatomic, assign)   IDPEmployeeState    state;

+ (instancetype)employeeWithName:(NSString *)name
                      experience:(NSUInteger)experience
                          salary:(NSUInteger)salary
                           money:(NSUInteger)money;

- (instancetype)init;
- (instancetype)initWithName:(NSString *)name
                  experience:(NSUInteger)experience
                      salary:(NSUInteger)salary
                       money:(NSUInteger)money NS_DESIGNATED_INITIALIZER;

- (void)performWorkWithObject:(id)object;

@end
