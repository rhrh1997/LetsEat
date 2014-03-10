//
//  DEMOHomeViewController.h
//  defEAT
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import <FlatUIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <Parse/Parse.h>
#import <MapKit/MapKit.h>


@class SPGooglePlacesAutocompleteQuery;


@interface DEMOHomeViewController : UIViewController <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate> {

    NSArray *searchResultPlaces;
    SPGooglePlacesAutocompleteQuery *searchQuery;
    MKPointAnnotation *selectedPlaceAnnotation;
    
    BOOL shouldBeginEditing;
}

@property (strong, nonatomic) IBOutlet FUIButton *searchButton;
@property (strong, nonatomic) IBOutlet UILabel *whatEat;
@property (strong, nonatomic) IBOutlet UILabel *nearWhere;
@property (strong, nonatomic) IBOutlet UISearchBar *whatSearch;
@property (strong, nonatomic) IBOutlet FUIButton *curLoc;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *afterSearchload;
@property (strong, nonatomic) IBOutlet UILabel *afterSearchlabel;
@property (strong, nonatomic) IBOutlet FUIButton *curOrder;
@property (strong, nonatomic) IBOutlet UISearchBar *nearSearch;

@property (nonatomic, strong) NSArray *places;
@property (strong, nonatomic) IBOutlet UITableView *nearSuggest;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;


- (IBAction)curOrdTouch:(id)sender;

- (IBAction)curPress:(id)sender;

- (IBAction)showMenu;

- (IBAction)pressed:(id)sender;






@end
