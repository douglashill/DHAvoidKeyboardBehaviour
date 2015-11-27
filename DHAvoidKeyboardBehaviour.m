// Douglas Hill, January 2015

#import "DHAvoidKeyboardBehaviour.h"

@interface DHAvoidKeyboardBehaviour ()

@property (nonatomic) CGFloat lastInsetForKeyboard;

@end

@implementation DHAvoidKeyboardBehaviour

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidChangeFrameNotification object:nil];
}

- (instancetype)init {
	self = [super init];
	if (self == nil) return nil;
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateInsetForKeyboardFrameChange:) name:UIKeyboardDidChangeFrameNotification object:nil];
	
	return self;
}

- (void)updateInsetForKeyboardFrameChange:(NSNotification *)notification {
	CGRect const keyboardFrameInScreenCoordinates = [[notification userInfo][UIKeyboardFrameEndUserInfoKey] CGRectValue];
	CGRect const keyboardFrame = [[self scrollView] convertRect:keyboardFrameInScreenCoordinates fromView:nil];
	
	CGFloat const insetForKeyboard = MAX(0, CGRectGetMaxY([[self scrollView] bounds]) - CGRectGetMinY(keyboardFrame));
	CGFloat const insetChange = insetForKeyboard - [self lastInsetForKeyboard];
	
	UIEdgeInsets contentInset = [[self scrollView] contentInset];
	contentInset.bottom += insetChange;
	[[self scrollView] setContentInset:contentInset];
	
	UIEdgeInsets scrollIndicatorInsets = [[self scrollView] scrollIndicatorInsets];
	scrollIndicatorInsets.bottom += insetChange;
	[[self scrollView] setScrollIndicatorInsets:scrollIndicatorInsets];
	
	[self setLastInsetForKeyboard:insetForKeyboard];
}

@end
