//
//  IDPEnterprise.h
//  TestObjC
//
//  Created by Genek on 5/8/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IDPEmployeeObserver.h"
#import "IDPEmployee.h"

@class IDPCar;

@interface IDPEnterprise : NSObject <IDPEmployeeObserver>

- (void)addCar:(IDPCar *)car;
- (void)removeCar:(IDPCar *)car;

- (void)runCarwash;

- (SEL)selectorForState:(IDPEmployeeState)state;;

@end
