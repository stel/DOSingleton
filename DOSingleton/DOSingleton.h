//
//  DOSingleton.h
//  DOSingleton
//
//  Created by Dmitry Obukhov on 03.04.13.
//  Copyright (c) 2013 Dmitry Obukhov. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * `DOSingleton` is a generic class for Mac OSX and iOS that implements all the required methods to 
 * implement a singleton object. It's designed for subclassing.
 *
 * When subclassing `DOSingleton` you should think about your class as an ordinary class, `DOSingleton`
 * makes sure that there is only one instance of your class.
 */

@interface DOSingleton : NSObject

/**
 * @name Instantiating
 */

/**
 * Returns the singleton object of the receiver class.
 *
 * You shoudn't override this method in your subclass.
 *
 * @return Singleton object of the receiver class.
 */
+ (instancetype)sharedInstance;

@end
