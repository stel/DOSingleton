# DOSingleton

DOSingleton is a subclassable Objective-C singleton for Mac OSX and iOS.

## Ussage

You should subclass DOSingleton to make your own singleton:

MySingleton.h

``` objective-c
#import "DOSingleton.h"

@interface MySingleton : DOSingleton {
	NSString *foo;
}

- (void)printFoo;	

@end
```

MySingleton.m

``` objective-c
#import "MySingleton.h"
	
@implementation MySingleton
	
- (id)init
{
	self = [super init];
	if (self != nil) {
		fooo = @"Foo";
	}
	return self;
}
	
- (void)printFoo
{
	NSLog(@"%@", foo);
}
	
@end
```

Then you can use your singleton like this:
``` objective-c
[[MySingleton sharedInstance] printFoo];
```

## Requirements

DOSingleton uses ARC.

## License

DOSingleton is available under the MIT license. See the LICENSE file for more info.
