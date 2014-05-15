// DOSingleton.h
//
// Copyright (c) 2014 Dmitry Obukhov (stel2k@gmail.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>

/**
 `DOSingleton` is a generic class for Mac OSX and iOS that implements all the required methods to implement a singleton object. It's designed for subclassing.
 
 ### Subclassing Notes
 
 When subclassing `DOSingleton` you should think about your subclass as an ordinary class, `DOSingleton` makes sure that there is only one instance of your class.
 
 If you want to make your own initializer or override `-init` method your should check whether your singleton has already been initialized with `isInitialized` property to prevent repeated initialization.
*/

@interface DOSingleton : NSObject

/// @name Obtaining the Shared Instance

/**
 Returns the shared instance of the receiver class, creating it if necessary.

 You shoudn't override this method in your subclasses.

 @return Shared instance of the receiver class.
*/
+ (instancetype)sharedInstance;

/**
 `sharedInstance` alias.
 
 @return Shared instance of the receiver class.
 */
+ (instancetype)instance;

/// @name Destroy Singleton Instance

/**
 Destroys shared instance of singleton class (if there are no other references to that instance).
 
 @warning *Note:* calling `+sharedInstance` after calling this method will create new singleton instance.
 */
+ (void)destroyInstance;

/// @name Testing Singleton Initialization

/**
 A Boolean value that indicates whether the receiver has been initialized.

 This property is usefull if you make you own initializer or override `-init` method.
 You should check if your singleton object has already been initialized to prevent repeated initialization in your custom initializer.
 
 @warning *Important:* you should check whether your instance already initialized before calling `[super init]`.
 
	- (id)init
	{
        if (!self.isInitialized) {
            self = [super init];
		
            if (self) {
                // Initialize self.
            }
        }
 
		return self;
	}
*/
@property (assign, readonly) BOOL isInitialized;

@end
