//
//  IDPObserver.h
//  TestObjC
//
//  Created by Genek on 5/10/17.
//  Copyright © 2017 Genek. All rights reserved.
//

@protocol IDPObserver <NSObject>

- (SEL)selectorForState:(NSUInteger)state;

@end
