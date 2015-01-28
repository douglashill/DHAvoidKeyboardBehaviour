// Douglas Hill, January 2015

#import "AKAppDelegate.h"

#import "AKNotesViewController.h"

@implementation AKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	[self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
	[[self window] setRootViewController:[[UINavigationController alloc] initWithRootViewController:[[AKNotesViewController alloc] init]]];
	[[self window] makeKeyAndVisible];
	
	return YES;
}

@end
