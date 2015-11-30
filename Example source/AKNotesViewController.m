// Douglas Hill, January 2015

#import "AKNotesViewController.h"

#import "AKNotesView.h"

static NSString *const crazyOnes = @"Here’s to the crazy ones. The misfits. The rebels. The troublemakers. The round pegs in the square holes.\n\n"
@"The ones who see things differently. They’re not fond of rules. And they have no respect for the status quo. You can quote them, disagree with them, glorify or vilify them.\n\n"
@"About the only thing you can’t do is ignore them. Because they change things. They invent. They imagine. They heal. They explore. They create. They inspire. They push the human race forward.\n\n"
@"Maybe they have to be crazy.\n\n"
@"How else can you stare at an empty canvas and see a work of art? Or sit in silence and hear a song that’s never been written? Or gaze at a red planet and see a laboratory on wheels?\n\n"
@"We make tools for these kinds of people.\n\n"
@"While some see them as the crazy ones, we see genius. Because the people who are crazy enough to think they can change the world, are the ones who do.";

@interface AKNotesViewController () <UITextViewDelegate>

@property (nonatomic) AKNotesView *view;
@property (nonatomic, readonly) UIBarButtonItem *keyboardDismissButton;

@end

@implementation AKNotesViewController

@dynamic view; // Implemented by UIViewController.

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	NSLog(@"Incorrect initialiser “%s” sent to %@", __PRETTY_FUNCTION__, [self class]);
	return [self init];
}

- (instancetype)init {
	return sharedInit([super initWithNibName:nil bundle:nil]);
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
	return sharedInit([super initWithCoder:decoder]);
}

static AKNotesViewController *sharedInit(AKNotesViewController *self) {
	[self setTitle:NSLocalizedString(@"NOTES TITLE",)];
	return self;
}

- (void)loadView {
	AKNotesView *const notesView = [[AKNotesView alloc] init];
	[[notesView textView] setText:crazyOnes];

	[self setView:notesView];
}

- (void)viewDidLoad {
	[super viewDidLoad];

    [[[self view] textView] setDelegate:self];
	[self updateKeyboardDismissButtonAnimated:NO];
}

#pragma mark - UITextViewDelegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
	[self updateKeyboardDismissButtonAnimated:YES];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
	[self updateKeyboardDismissButtonAnimated:YES];
}

#pragma mark - Keyboard dismiss button

- (void)updateKeyboardDismissButtonAnimated:(BOOL)animated {
	UIBarButtonItem *const rightItem = [[[self view] textView] isFirstResponder] ? [self keyboardDismissButton] : nil;
	[[self navigationItem] setRightBarButtonItem:rightItem animated:animated];
}

- (void)dismissKeyboard:(id)sender {
	[[[self view] textView] resignFirstResponder];
}

@synthesize keyboardDismissButton = _keyboardDismissButton;

- (UIBarButtonItem *)keyboardDismissButton {
	return _keyboardDismissButton ?: (_keyboardDismissButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissKeyboard:)]);
}

@end
