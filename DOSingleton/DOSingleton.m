//
//  DOSingleton.m
//  DOSingleton
//
//  Created by Dmitry Obukhov on 03.04.13.
//  Copyright (c) 2013 Dmitry Obukhov. All rights reserved.
//

#import "DOSingleton.h"

// Dictionary that holds all instances of DOSingleton subclasses
static NSMutableDictionary *_sharedInstances = nil;

@implementation DOSingleton

+ (void)initialize
{
	if (_sharedInstances == nil) {
		_sharedInstances = [NSMutableDictionary dictionary];
	}
}

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

- (id)init
{
	// Looking for existing instance
	id sharedInstance = [_sharedInstances objectForKey:NSStringFromClass([self class])];
	
	if (sharedInstance != nil) {
		self = sharedInstance;
	} else {
		self = [super init];
	}
	
	return self;
}

@end
