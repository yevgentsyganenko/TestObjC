//
//  IDPCar.h
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IDPMoney.h"

typedef NS_ENUM(NSUInteger, IDPCarState) {
    IDPCarStateDirty,
    IDPCarStateClean
};

@interface IDPCar : NSObject <IDPMoney>
@property (nonatomic, copy)     NSString        *model;
@property (nonatomic, assign)   NSUInteger      money;
@property (nonatomic, assign)   IDPCarState     state;

+ (instancetype)carWithModel:(NSString *)model money:(NSUInteger)money;

- (instancetype)init;
- (instancetype)initWithModel:(NSString *)model money:(NSUInteger)money NS_DESIGNATED_INITIALIZER;

@end
