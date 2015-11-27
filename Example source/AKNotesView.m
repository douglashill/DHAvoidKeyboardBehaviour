// Douglas Hill, January 2015

#import "AKNotesView.h"

#import "DHContentSizeCategoryObserver.h"
#import "DHAvoidKeyboardBehaviour.h"

@interface AKNotesView () <DHContentSizeCategoryObserverDelegate>

@property (nonatomic, readonly) DHContentSizeCategoryObserver *contentSizeCategoryObserver;
@property (nonatomic, readonly) DHAvoidKeyboardBehaviour *avoidKeyboardBehaviour;

@end

@implementation AKNotesView

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self == nil) return nil;
	
	_textView = [[UITextView alloc] init];
	[_textView setAlwaysBounceVertical:YES];
	[_textView setKeyboardDismissMode:UIScrollViewKeyboardDismissModeInteractive];
	[self addSubview:_textView];
	
	_contentSizeCategoryObserver = [DHContentSizeCategoryObserver contentSizeCategoryObserverWithDelegate:self];
	
	_avoidKeyboardBehaviour = [[DHAvoidKeyboardBehaviour alloc] init];
	[_avoidKeyboardBehaviour setScrollView:_textView];
	
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	[[self textView] setFrame:[self bounds]];
	
	CGFloat const fontSize = [[[self textView] font] pointSize];
	CGFloat const minInset = fontSize;
	CGFloat const maxTextWidth = 30 * fontSize;
	CGFloat const sideInset = MAX(minInset, 0.5 * (CGRectGetWidth([[self textView] bounds]) - maxTextWidth));
	[[self textView] setTextContainerInset:UIEdgeInsetsMake(minInset, sideInset, minInset, sideInset)];
}

#pragma mark - AKContentSizeCategoryObserverDelegate

- (void)preferredContentSizeCategoryDidChangeToContentSizeCategory:(NSString *)contentSizeCategory {
	[[self textView] setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
	[self setNeedsLayout];
}

@end
