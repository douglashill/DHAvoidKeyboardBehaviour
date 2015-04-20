// Douglas Hill, April 2015

@import UIKit;

@protocol DHContentSizeCategoryObserverDelegate <NSObject>

- (void)preferredContentSizeCategoryDidChangeToContentSizeCategory:(nonnull NSString *)contentSizeCategory;

@end

@interface DHContentSizeCategoryObserver : NSObject

+ (nonnull instancetype)contentSizeCategoryObserverWithDelegate:(nullable id <DHContentSizeCategoryObserverDelegate>)delegate;

@property (nonatomic, nullable, weak) id <DHContentSizeCategoryObserverDelegate> delegate;

@end
