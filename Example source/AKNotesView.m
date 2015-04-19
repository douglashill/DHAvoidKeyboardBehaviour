// Douglas Hill, January 2015

#import "AKNotesView.h"

#import "DHAvoidKeyboardBehaviour.h"

@interface AKNotesView ()

@property (nonatomic, nonnull, strong, readonly) DHAvoidKeyboardBehaviour *avoidKeyboardBehaviour;

@end

@implementation AKNotesView

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self == nil) return nil;
	
	_textView = [[UITextView alloc] init];
	[_textView setAlwaysBounceVertical:YES];
	[_textView setFont:[UIFont systemFontOfSize:16]];
	[_textView setKeyboardDismissMode:UIScrollViewKeyboardDismissModeInteractive];
	[self addSubview:_textView];
	
	_avoidKeyboardBehaviour = [[DHAvoidKeyboardBehaviour alloc] init];
	[_avoidKeyboardBehaviour setScrollView:_textView];
	
	return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	[[self textView] setFrame:[self bounds]];
	
	CGFloat const fontSize = [[[self textView] font] pointSize];
	CGFloat const minInset = fontSize;
	CGFloat const maxTextWidth = 30 * fontSize;
	CGFloat const sideInset = MAX(minInset, 0.5 * (CGRectGetWidth([[self textView] bounds]) - maxTextWidth));
	[[self textView] setTextContainerInset:UIEdgeInsetsMake(minInset, sideInset, minInset, sideInset)];
}

@end
