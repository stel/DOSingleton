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

/**
 * A Boolean value that indicates whether the receiver has been initialized.
 *
 * This property is usefull if you make you own initializer or override `-init` method.
 * You should check if your singleton object has already been initialized to prevent repeated 
 * initialization in your custom initializer.
 *
 *     - (id)init
 *     {
 *         self = [super init];
 *         if (self && !self.isInitialized) {
 *             // Your initialization here
 *         }
 *         return self;
 *     }
 */
@property (unsafe_unretained, readonly) BOOL isInitialized;

@end
