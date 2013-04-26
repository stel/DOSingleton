//
//  DOSingletonTests.m
//  DOSingletonTests
//
//  Created by Dmitry Obukhov on 25.04.13.
//
//

#import "DOSingletonTests.h"
#import "DOSingleton.h"
#import "FooSingleton.h"
#import "BarSingleton.h"

@implementation DOSingletonTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testInstantiate
{
	DOSingleton *s = [DOSingleton sharedInstance];
	
	STAssertNotNil(s, @"Object must not be nil");
}

- (void)testUnique
{
	DOSingleton *s1 = [DOSingleton sharedInstance];
	DOSingleton *s2 = [DOSingleton sharedInstance];
	
	STAssertEqualObjects(s1, s2, @"Objects must be equal");
	
	DOSingleton *s3 = [[DOSingleton alloc] init];
	
	STAssertEqualObjects(s1, s3, @"Objects must be equal");
}

- (void)testIsInitialized
{
	DOSingleton *s = [DOSingleton sharedInstance];
	
	STAssertTrue(s.isInitialized, @"Singleton must be initialized");
}

- (void)testSubclassing
{
	FooSingleton *foo = [FooSingleton sharedInstance];
	BarSingleton *bar = [BarSingleton sharedInstance];
	
	STAssertNotNil(foo, @"Object must not be nil");
	STAssertNotNil(bar, @"Object must not be nil");
	
	STAssertTrue([foo isKindOfClass:[FooSingleton class]], @"");
	STAssertTrue([bar isKindOfClass:[BarSingleton class]], @"");
	
	STAssertFalse([foo isEqual:bar], @"Objects must not be equal");
	
	FooSingleton *foo2 = [[FooSingleton alloc] init];
	
	STAssertEqualObjects(foo, foo2, @"Objects must be equal");
}

@end
