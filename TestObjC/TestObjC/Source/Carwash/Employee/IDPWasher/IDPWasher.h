//
//  IDPWasher.h
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IDPEmployee.h"
//#import "IDPMoneyProtocol.h"

@class IDPCar;

@interface IDPWasher : IDPEmployee /* <IDPMoneyProtocol> */
@property (nonatomic, assign)   NSUInteger  price;

//- (void)washCar:(IDPCar *)car;

@end
