//
//  DOSingleton.h
//  DOSingleton
//
//  Created by Dmitry Obukhov on 03.04.13.
//  Copyright (c) 2013 Dmitry Obukhov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DOSingleton : NSObject

+ (instancetype)sharedInstance;

@end
