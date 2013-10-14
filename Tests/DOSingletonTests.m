//
//  DOSingletonTests.m
//  DOSingletonTests
//
//  Created by Dmitry Obukhov on 25.04.13.
//
//


#import <SenTestingKit/SenTestingKit.h>
#import "DOSingleton.h"

@interface 		 FooSingleton : DOSingleton	@end
@implementation FooSingleton 						@end
@interface 		 BarSingleton : DOSingleton   @end
@implementation BarSingleton						@end


@interface DOSingletonTests : SenTestCase		@end


@implementation DOSingletonTests

- (void)testInstantiate	{

	STAssertNotNil			(DOSingleton.sharedInstance, @"Object must not be nil"); }

- (void)testUnique
{
	DOSingleton *s1 = DOSingleton.sharedInstance,
					*s2 = DOSingleton.sharedInstance;
	
	STAssertEqualObjects	(s1, s2, @"Objects must be equal");
	
	DOSingleton *s3 = DOSingleton.new;

	STAssertEqualObjects	(s1, s3, @"Objects must be equal");
}
- (void)testIsInitialized
{
	DOSingleton *s = DOSingleton.sharedInstance;
	STAssertTrue			(s.isInitialized, @"Singleton must be initialized");
}

- (void)testSubclassing
{
	FooSingleton *foo = FooSingleton.sharedInstance;
	BarSingleton *bar = BarSingleton.sharedInstance;
	
	STAssertNotNil 		(foo, @"Object must not be nil");
	STAssertNotNil 		(bar, @"Object must not be nil");
	
	STAssertTrue   		([foo isKindOfClass:FooSingleton.class], @"");
	STAssertTrue   		([bar isKindOfClass:BarSingleton.class], @"");
	STAssertFalse 			([foo isEqual:bar], @"Objects must not be equal");
	
	FooSingleton *foo2 = FooSingleton.new;

	STAssertEqualObjects (foo, foo2, @"Objects must be equal");
}

@end
