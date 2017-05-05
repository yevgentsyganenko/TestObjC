//
//  IDPTakeMoneyProtocol.h
//  TestObjC
//
//  Created by Genek on 5/5/17.
//  Copyright © 2017 Genek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IDPTakeMoneyProtocol <NSObject>

- (void)takeMoney:(NSUInteger)money fromObject:(id<IDPMoneyProtocol>)object;

@end
