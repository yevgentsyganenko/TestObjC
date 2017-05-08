//
//  IDPEnterprise.h
//  TestObjC
//
//  Created by Genek on 5/8/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IDPCar;

@interface IDPEnterprise : NSObject

- (void)addCar:(IDPCar *)car;
- (void)removeCar:(IDPCar *)car;

- (void)runCarwash;

@end
