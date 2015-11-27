// Douglas Hill, April 2015

#import "DHContentSizeCategoryObserver.h"

@implementation DHContentSizeCategoryObserver

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
}

+ (instancetype)contentSizeCategoryObserverWithDelegate:(nullable id<DHContentSizeCategoryObserverDelegate>)delegate {
	DHContentSizeCategoryObserver *const observer = [[self alloc] init];
	[observer setDelegate:delegate];
	[observer notifyDelegate];
	return observer;
}

- (instancetype)init {
	self = [super init];
	if (self == nil) return nil;
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contentSizeCategoryDidChange:) name:UIContentSizeCategoryDidChangeNotification object:nil];
	
	return self;
}

- (void)contentSizeCategoryDidChange:(NSNotification *)notification {
	[self notifyDelegate];
}

- (void)notifyDelegate {
	[[self delegate] preferredContentSizeCategoryDidChangeToContentSizeCategory:[[UIApplication sharedApplication] preferredContentSizeCategory]];
}

@end
