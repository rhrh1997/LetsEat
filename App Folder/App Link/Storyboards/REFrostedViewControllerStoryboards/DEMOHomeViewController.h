//
//  DEMOHomeViewController.h
//  defEAT
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import <FlatUIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface DEMOHomeViewController : UIViewController <UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet FUIButton *searchButton;
@property (strong, nonatomic) IBOutlet UILabel *whatEat;
@property (strong, nonatomic) IBOutlet UILabel *nearWhere;
@property (strong, nonatomic) IBOutlet UISearchBar *whatSearch;
@property (strong, nonatomic) IBOutlet UISearchBar *nearSearch;
@property (strong, nonatomic) IBOutlet FUISegmentedControl *mileage;
@property (strong, nonatomic) IBOutlet FUIButton *curLoc;

- (IBAction)curPress:(id)sender;

- (IBAction)showMenu;

- (IBAction)pressed:(id)sender;






@end
