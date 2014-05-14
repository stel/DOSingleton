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
	
	XCTAssertNotNil(s, @"Object must not be nil");
}

- (void)testUnique
{
	DOSingleton *s1 = [DOSingleton sharedInstance];
	DOSingleton *s2 = [DOSingleton sharedInstance];
	
	XCTAssertEqualObjects(s1, s2, @"Objects must be equal");
	
	DOSingleton *s3 = [[DOSingleton alloc] init];
	
	XCTAssertEqualObjects(s1, s3, @"Objects must be equal");
}

- (void)testIsInitialized
{
	DOSingleton *s = [DOSingleton sharedInstance];
	
	XCTAssertTrue(s.isInitialized, @"Singleton must be initialized");
}

- (void)testSubclassing
{
	FooSingleton *foo = [FooSingleton sharedInstance];
	BarSingleton *bar = [BarSingleton sharedInstance];
	
	XCTAssertNotNil(foo, @"Object must not be nil");
	XCTAssertNotNil(bar, @"Object must not be nil");
	
	XCTAssertTrue([foo isKindOfClass:[FooSingleton class]], @"");
	XCTAssertTrue([bar isKindOfClass:[BarSingleton class]], @"");
	
	XCTAssertFalse([foo isEqual:bar], @"Objects must not be equal");
	
	FooSingleton *foo2 = [[FooSingleton alloc] init];
	
	XCTAssertEqualObjects(foo, foo2, @"Objects must be equal");
}

@end
