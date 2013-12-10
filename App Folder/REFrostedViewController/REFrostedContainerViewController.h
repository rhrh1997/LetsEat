//
// REFrostedContainerViewController.h
// defEAT
#import <UIKit/UIKit.h>



@class REFrostedViewController;

@interface REFrostedContainerViewController : UIViewController

@property (strong, readwrite, nonatomic) UIImage *screenshotImage;
@property (weak, readwrite, nonatomic) REFrostedViewController *frostedViewController;
@property (assign, readwrite, nonatomic) BOOL animateApperance;

- (void)panGestureRecognized:(UIPanGestureRecognizer *)recognizer;
- (void)hide;
- (void)refreshBackgroundImage;

@end
