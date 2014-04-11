//
//  DEMOHomeViewController.m
// defEAT
//

#import "DEMOHomeViewController.h"
#import <MapKit/MapKit.h>
#import "SPGooglePlacesAutocomplete.h"
#import "CMQMasterViewController.h"



@interface DEMOHomeViewController ()



@end

@implementation DEMOHomeViewController


static NSString *kCellIdentifier = @"SPGooglePlacesAutocompleteCell";

CLLocationManager *locationManager;
CLLocationCoordinate2D userLocation;




-(void)viewDidLoad
{
    
    //Current Order setup
    self.curOrder.buttonColor = [UIColor redColor];
    self.curOrder.shadowColor = [UIColor greenSeaColor];
    self.curOrder.shadowHeight = 0.0f;
    self.curOrder.cornerRadius = 0.0f;
    self.curOrder.titleLabel.font = [UIFont flatFontOfSize:16];
    [self.curOrder setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.curOrder setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    
    //Loading set stop
    //DELETED
    
    //Initiating location manager
    locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    [locationManager startUpdatingLocation];
    
    //Checking navigation controller
    //NSLog(@"%@", self.navigationController.viewControllers );

    //Navigation Bar
    self.title = @"Let's Eat";
       //UINavigationController *navCon  = (UINavigationController*) [self.navigationController.viewControllers objectAtIndex:0];
       //navCon.navigationItem.title = @"Hello";
    
    [self.navigationController.navigationBar setBarTintColor: [UIColor emerlandColor]];
    //[UIColor colorWithRed:0.0f/256.0f green:206.0f/256.0f blue:106.0f/256.0f alpha:1]];
    //[self.navigationController.navigationBar setTranslucent:NO];
       //[self.navigationController.navigationBar setTitleTextAttributes:@{[UIColor whiteColor]:NSBackgroundColorAttributeName}];
       //[self.navigationController.navigationBar setTitleTextAttributes:@{[UIFont fontWithName:@"Avenir"size:16.0]:NSFontAttributeName}];

    //Search Button
    self.searchButton.buttonColor = [UIColor emerlandColor];
    self.searchButton.shadowColor = [UIColor greenSeaColor];
    self.searchButton.shadowHeight = 0.0f;
    self.searchButton.cornerRadius = 0.0f;
    self.searchButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.searchButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.searchButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
   
    //Current Location button
    self.curLoc.buttonColor = [UIColor emerlandColor];
    self.curLoc.shadowColor = [UIColor greenSeaColor];
    self.curLoc.shadowHeight = 0.0f;
    self.curLoc.cornerRadius = 0.0f;
    self.curLoc.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.curLoc setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.curLoc setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    //PastOrders Location button
    self.pastOrders.buttonColor = [UIColor sunflowerColor];
    self.pastOrders.shadowColor = [UIColor greenSeaColor];
    self.pastOrders.shadowHeight = 0.0f;
    self.pastOrders.cornerRadius = 0.0f;
    self.pastOrders.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.pastOrders setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.pastOrders setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    //Favorites Location button
    self.favorites.buttonColor = [UIColor sunflowerColor];
    self.favorites.shadowColor = [UIColor greenSeaColor];
    self.favorites.shadowHeight = 0.0f;
    self.favorites.cornerRadius = 0.0f;
    self.favorites.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.favorites setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.favorites setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    
    //AccountSettings Location button
    self.accountSettings.buttonColor = [UIColor pomegranateColor];
    self.accountSettings.shadowColor = [UIColor greenSeaColor];
    self.accountSettings.shadowHeight = 0.0f;
    self.accountSettings.cornerRadius = 0.0f;
    self.accountSettings.titleLabel.font = [UIFont boldFlatFontOfSize:20];
    [self.accountSettings setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.accountSettings setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    //searchfields
    
    self.whatEat.font = [UIFont boldFlatFontOfSize:16];
    
    self.nearWhere.font = [UIFont boldFlatFontOfSize:16];
    
    UITextField *searchField = [self.whatSearch valueForKey:@"_searchField"];
    searchField.font = [UIFont flatFontOfSize:16];
    searchField.textColor = [UIColor blackColor];
    
    UITextField *searchField1 = [self.nearSearch valueForKey:@"_searchField"];
    searchField1.textColor = [UIColor blackColor];
    searchField1.font = [UIFont flatFontOfSize:16];

    
    
    
    //This is to change the search button to a done button on search  keyboard
    for(UIView *subView in [_nearSearch subviews])
    {
        if([subView conformsToProtocol:@protocol(UITextInputTraits)])
        {
            [(UITextField *)subView setReturnKeyType: UIReturnKeyDone];
        }
        else
        {
            for(UIView *subSubView in [subView subviews])
            {
                if([subSubView conformsToProtocol:@protocol(UITextInputTraits)])
                {
                    [(UITextField *)subSubView setReturnKeyType: UIReturnKeyDone];
                }
            }
            
        }
    }
    for(UIView *subView in [_whatSearch subviews])
    {
        if([subView conformsToProtocol:@protocol(UITextInputTraits)])
        {
            [(UITextField *)subView setReturnKeyType: UIReturnKeyDone];
        }
        else
        {
            for(UIView *subSubView in [subView subviews])
            {
                if([subSubView conformsToProtocol:@protocol(UITextInputTraits)])
                {
                    [(UITextField *)subSubView setReturnKeyType: UIReturnKeyDone];
                }
            }
            
        }
    }
    
        
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
//                                   initWithTarget:self
//                                   action:@selector(dismissKeyboard)];
//
//    
//    
//    [self.view addGestureRecognizer:tap];
 

}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}


- (IBAction)curOrdTouch:(id)sender {
}

- (IBAction)curPress:(id)sender {
    
    //Current Location Button press
    NSLog(@"Pressed curLocs");
    NSString *curLocs =[NSString stringWithFormat:@"latitude: %f longitude: %f", locationManager.location.coordinate.latitude, locationManager.location.coordinate.longitude];
    self.reference = locationManager.location;
    self.nearSearch.text= curLocs;
    NSLog(@"%@", curLocs);

}
-(void)dismissKeyboard {
    [self.whatSearch resignFirstResponder];
    [self.nearSearch resignFirstResponder];

}

- (IBAction)showMenu
{
    //Menu button
    [self.frostedViewController presentMenuViewController];
}


//this is when you press the button

- (IBAction)pressed:(id)sender {
    //Search button
    NSLog(@"Pressy Pressy");
    [self performSegueWithIdentifier:@"toResults"sender:nil];
 //   NSString *what = self.whatSearch.text;
  //  NSString *where = self.nearSearch.text;
 //   NSString *mileage = @"5";
    //self.mileage.selectedSegmentIndex;
  //  NSArray  * search = [NSArray arrayWithObjects:what,where,mileage,nil];
    //PFQuery *query = [PFQuery queryWithClassName:@"Restauraunt"];
    
}




//this is starting the suggestions stuff
#pragma mark -
#pragma mark UITableViewDataSource

- (CLGeocoder *)geocoder {
    if (!geocoder) {
        geocoder = [[CLGeocoder alloc] init];
    }
    return geocoder;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"toResults"])
    {
        NSLog(@"Segue Intensifed");
        CMQMasterViewController *controller = (CMQMasterViewController *)segue.destinationViewController;
        controller.nearThis = self.reference.coordinate;
        NSLog(@"Check controller %f, %f", controller.nearThis.latitude, controller.nearThis.longitude);

        
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  //  NSLog(@"Call 1");
   // NSLog(@"%lu", (unsigned long)[searchResultPlaces count]);
    return [searchResultPlaces count];
    
    
}



- (SPGooglePlacesAutocompletePlace *)placeAtIndexPath:(NSIndexPath *)indexPath {
   // NSLog(@"Call 2");
    return searchResultPlaces[indexPath.row];
    
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"Call 5");
    self.searchButton.titleLabel.text = @"Wait..";
    SPGooglePlacesAutocompletePlace *place = [self placeAtIndexPath:indexPath];
    [self.searchDisplayController.searchResultsTableView deselectRowAtIndexPath:indexPath animated:NO];
    NSString *selectedCell = place.name;
    [self dismissSearchControllerWhileStayingActive];
    //CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [self.geocoder geocodeAddressString:selectedCell completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if(error)
         {
             NSLog(@"Geocode failed with error: %@", error);
             return;
         }
         if([placemarks count] > 0)
         {
             CLPlacemark *placemark = [placemarks objectAtIndex:0];
             CLLocation *location = placemark.location;
             CLLocationCoordinate2D coordinate = location.coordinate;
             NSLog(@"%f, %f", coordinate.latitude, coordinate.longitude);
             self.reference = location;
         }
     }];
    self.searchButton.titleLabel.text = @"Search";
    
    self.nearSearch.text = place.name;
    //[self dismissKeyboard];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // NSLog(@"Call 5b");
    static NSString *cellIdentifier = @"SPGooglePlacesAutocompleteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.font = [UIFont flatFontOfSize:16];
    cell.textLabel.text = [self placeAtIndexPath:indexPath].name;
    return cell;
}

- (void)handleSearchForSearchString:(NSString *)searchString {
   // NSLog(@"Call 6");
       searchQuery = [[SPGooglePlacesAutocompleteQuery alloc] initWithApiKey:@"AIzaSyCjdfWfKP87-XuMczSFMZIATrYeVr9Ciic"];
    searchQuery.location = self.mapView.userLocation.coordinate;
    searchQuery.input = searchString;
    [searchQuery fetchPlaces:^(NSArray *places, NSError *error) {
        if (error) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Could not fetch Places"
                                                            message:error.localizedDescription
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
            [alert show];
        } else {
            searchResultPlaces = places;
            [self.searchDisplayController.searchResultsTableView reloadData];
        }
    }];
    //NSLog(@"Call 6a");
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
   // NSLog(@"Call 7");
    [self handleSearchForSearchString:searchString];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}




- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if(searchBar == self.nearSearch)
    {
   // NSLog(@"Call 8");
   if (![searchBar isFirstResponder]) {
        // User tapped the 'clear' button.
        //NSLog(@"Call 8a");
        shouldBeginEditing = NO;
        [self.searchDisplayController setActive:NO];
    }
    }
}


- (void)dismissSearchControllerWhileStayingActive {
    // Animate out the table view.
    NSTimeInterval animationDuration = 0.3;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    self.searchDisplayController.searchResultsTableView.alpha = 0.0;
    [UIView commitAnimations];
    [self.searchDisplayController.searchBar setShowsCancelButton:NO animated:YES];
    [self.searchDisplayController.searchBar resignFirstResponder];
    [self.searchDisplayController.searchResultsTableView resignFirstResponder];
    [self.searchDisplayController.searchContentsController resignFirstResponder];
    [self.searchDisplayController setActive:NO];

}



- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
   
    //this is checking if it is the nearSearch bar beggining to be searched or the whatSearch
    if(searchBar == self.nearSearch)
   {
   // NSLog(@"Call 9a");
    if (shouldBeginEditing) {
        // Animate in the table view.
        [self.searchDisplayController.searchBar setShowsCancelButton:NO animated:NO];
        NSTimeInterval animationDuration = 0.3;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:animationDuration];
        self.searchDisplayController.searchResultsTableView.alpha = 0.75;
        [UIView commitAnimations];
        
        
    }
    BOOL boolToReturn = shouldBeginEditing;
    shouldBeginEditing = YES;
    return boolToReturn;
   }
   else
   {
        //basically allowing the keyboard to come up
        return true;
   }
}









@end
