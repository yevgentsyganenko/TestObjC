//
//  IDPEmployeeObserver.h
//  TestObjC
//
//  Created by Gene on 5/9/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IDPObserver.h"

@class IDPEmployee;

@protocol IDPEmployeeObserver <IDPObserver>

@optional

- (void)employeeDidFinishWork:(IDPEmployee *)employee;
- (void)employeeDidBecomeFree:(IDPEmployee *)employee;

@end
