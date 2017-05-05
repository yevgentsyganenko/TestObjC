//
//  IDPCar.m
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import "IDPCar.h"

@implementation IDPCar

#pragma mark -
#pragma mark Class Methods

+ (instancetype)carWithModel:(NSString *)model money:(NSUInteger)money {
    return [[[self alloc] initWithModel:model money:money] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.model = nil;
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithModel:nil money:0];
}

- (instancetype)initWithModel:(NSString *)model money:(NSUInteger)money {
    self = [super init];
    if (self) {
        self.model = model;
        self.money = money;
    }
    
    return self;
}

@end
