// DOSingleton.m
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

#import "DOSingleton.h"

// Dictionary that holds all instances of DOSingleton subclasses
static NSMutableDictionary *_sharedInstances = nil;

@implementation DOSingleton

#pragma mark -

+ (void)initialize
{
	if (_sharedInstances == nil) {
		_sharedInstances = [NSMutableDictionary dictionary];
	}
}

+ (id)allocWithZone:(NSZone *)zone
{
	// Not allow allocating memory in a different zone
	return [self sharedInstance];
}

+ (id)copyWithZone:(NSZone *)zone
{
	// Not allow copying to a different zone
	return [self sharedInstance];
}

#pragma mark -

+ (instancetype)sharedInstance
{
	id sharedInstance = nil;
	
	@synchronized(self) {
		NSString *instanceClass = NSStringFromClass(self);
		
		// Looking for existing instance
		sharedInstance = [_sharedInstances objectForKey:instanceClass];
		
		// If there's no instance – create one and add it to the dictionary
		if (sharedInstance == nil) {
			sharedInstance = [[super allocWithZone:nil] init];
			[_sharedInstances setObject:sharedInstance forKey:instanceClass];
		}
	}
	
	return sharedInstance;
}

+ (instancetype)instance
{
	return [self sharedInstance];
}

#pragma mark -

+ (void)destroyInstance
{
	[_sharedInstances removeObjectForKey:NSStringFromClass(self)];
}

#pragma mark -

- (id)init
{
	self = [super init];
	
	if (self && !self.isInitialized) {
		// Thread-safe because it called from +sharedInstance
		_isInitialized = YES;
	}
	
	return self;
}

@end
