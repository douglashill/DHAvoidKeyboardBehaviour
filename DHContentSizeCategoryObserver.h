// Douglas Hill, April 2015

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@protocol DHContentSizeCategoryObserverDelegate <NSObject>

- (void)preferredContentSizeCategoryDidChangeToContentSizeCategory:(NSString *)contentSizeCategory;

@end

@interface DHContentSizeCategoryObserver : NSObject

+ (instancetype)contentSizeCategoryObserverWithDelegate:(nullable id<DHContentSizeCategoryObserverDelegate>)delegate;

@property (nonatomic, weak) id<DHContentSizeCategoryObserverDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
