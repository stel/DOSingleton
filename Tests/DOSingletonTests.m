//
//  DOSingletonTests.m
//  DOSingletonTests
//
//  Created by Dmitry Obukhov on 25.04.13.
//
//

#import "DOSingletonTests.h"
#import "DOSingleton.h"

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

- (void)testUnique
{
	DOSingleton* s1 = [[DOSingleton alloc] init];
	DOSingleton* s2 = [[DOSingleton alloc] init];
	
	STAssertEqualObjects(s1, s2, @"Objects must be equal");
}

@end
