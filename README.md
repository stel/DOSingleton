# DOSingleton

`DOSingleton` is a subclassable Objective-C singleton for Mac OSX and iOS.

## Ussage

### Copy files

Copy the following files to your project:

* `DOSingleton/DOSingleton.h`
* `DOSingleton/DOSingleton.m`

`DOSingleton` is also available on [CocoaPods](http://cocoapods.org/?q=DOSingleton)

### Subclass

`DOSingleton` is designed for subclassing, you should subclass it to make your own singleton:

``` objective-c
#import "DOSingleton.h"

@interface MySingleton : DOSingleton {
	NSString *foo;
}

- (void)printFoo;	

@end
```

When subclassing `DOSingleton` you should think about your subclass as an ordinary class, `DOSingleton` makes sure that there is only one instance of your class.
 
If you want to make your own initializer or override `-init` method your should check whether your singleton has already been initialized with `isInitialized` property to prevent repeated initialization.


``` objective-c
#import "MySingleton.h"

@implementation MySingleton

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

- (void)printFoo
{
	NSLog(@"%@", foo);
}

@end
```

Then you can get the shared instance of your singleton with `+sharedInstance` methods:

``` objective-c
[[MySingleton sharedInstance] printFoo];
```

## Requirements

`DOSingleton` uses ARC.

## Documentation

http://cocoadocs.org/docsets/DOSingleton

## License

DOSingleton is available under the MIT license. See the [LICENSE.md](LICENSE.md) file for more info.

Feel free to use it and contribute!
