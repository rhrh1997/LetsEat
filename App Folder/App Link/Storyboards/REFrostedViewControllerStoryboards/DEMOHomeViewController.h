//
//  DEMOHomeViewController.h
//  defEAT
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import <FlatUIKit.h>

@interface DEMOHomeViewController : UIViewController

@property (strong, nonatomic) IBOutlet FUIButton *searchButton;
@property (strong, nonatomic) IBOutlet UILabel *whatEat;
@property (strong, nonatomic) IBOutlet UILabel *nearWhere;
@property (strong, nonatomic) IBOutlet UISearchBar *whatSearch;
@property (strong, nonatomic) IBOutlet UISearchBar *nearSearch;



- (IBAction)showMenu;

- (IBAction)pressed:(id)sender;






@end
