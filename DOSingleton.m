//
//  DOSingleton.m
//  SingletonTest
//
//  Created by Dmitry Obukhov on 03.04.13.
//  Copyright (c) 2013 Dmitry Obukhov. All rights reserved.
//

#import "DOSingleton.h"

static NSMutableDictionary *_sharedInstances = nil;

@implementation DOSingleton

+ (void)initialize
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedInstances = [NSMutableDictionary dictionary];
	});
}

+ (instancetype)sharedInstance
{
	id sharedInstance = nil;
	
	@synchronized(self) {
		NSString *instanceClass = NSStringFromClass(self);
		
		sharedInstance = [_sharedInstances objectForKey:instanceClass];
		
		if (sharedInstance == nil) {
			sharedInstance = [[super allocWithZone:nil] init];
			[_sharedInstances setObject:sharedInstance forKey:instanceClass];
		}
	}
	
	return sharedInstance;
}

+ (id)allocWithZone:(NSZone *)zone
{
	return [self sharedInstance];
}

+ (id)copyWithZone:(NSZone *)zone
{
	return [self sharedInstance];
}

- (id)init
{
	id sharedInstance = [_sharedInstances objectForKey:NSStringFromClass([self class])];
	
	if (sharedInstance != nil) {
		self = sharedInstance;
	} else {
		self = [super init];
	}
	
	return self;
}

@end
