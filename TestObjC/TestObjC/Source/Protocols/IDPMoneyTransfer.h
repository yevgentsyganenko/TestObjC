//
//  IDPMoneyTransfer.h
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IDPMoneyTransfer <NSObject>

- (void)takeMoney:(NSUInteger)money fromObject:(id<IDPMoney>)object;

@end
