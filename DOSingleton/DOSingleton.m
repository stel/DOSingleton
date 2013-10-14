
// DOSingleton.m

#import "DOSingleton.h"

@implementation DOSingleton

static NSMutableDictionary 		  *_sharedInstances = nil; // Dictionary that holds all instances of DOSingleton subclasses
+ (void) initialize					{ 	_sharedInstances = _sharedInstances ?: NSMutableDictionary.new;								}

+ (id)allocWithZone:	(NSZone*)z 	{ return self.sharedInstance;  /* Not allow allocating memory in a different zone */ 	}
+ (id)copyWithZone:	(NSZone*)z 	{ return self.sharedInstance;  /* Not allow copying to a different zone	          */ 	}

#pragma mark - Instances

+ (instancetype) instance			{ return self.sharedInstance; 																			}
+ (instancetype) sharedInstance	{ 			  id sharedInstance = nil;
	
	@synchronized(self) { 	// If there's no instance – create one and add it to the dictionary
		sharedInstance = _sharedInstances[NSStringFromClass(self)] =
							  _sharedInstances[NSStringFromClass(self)] ?: [super allocWithZone:nil].init;
	}
	return sharedInstance;
}
- (id)init	{	if (self != super.init) return nil; _isInitialized = YES; return self; }

@end


// Copyright (c) 2013 Dmitry Obukhov (stel2k@gmail.com)

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
