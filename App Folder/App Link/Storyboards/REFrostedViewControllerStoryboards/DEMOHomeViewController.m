//
//  DEMOHomeViewController.m
// defEAT
//

#import "DEMOHomeViewController.h"
#import <MapKit/MapKit.h>
#import "SPGooglePlacesAutocomplete.h"



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
    [self.afterSearchload stopAnimating];
    self.afterSearchlabel.font= [UIFont boldFlatFontOfSize:16];
    
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
    self.curLoc.titleLabel.font = [UIFont boldFlatFontOfSize:20];
    [self.curLoc setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.curLoc setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    //searchfields
    
    self.whatEat.font = [UIFont boldFlatFontOfSize:16];
    
    self.nearWhere.font = [UIFont boldFlatFontOfSize:16];
    
    UITextField *searchField = [self.whatSearch valueForKey:@"_searchField"];
    searchField.font = [UIFont flatFontOfSize:16];
    searchField.textColor = [UIColor blackColor];
    
    UITextField *searchField1 = [self.nearSearch valueForKey:@"_searchField"];
    searchField1.textColor = [UIColor blackColor];
    searchField1.font = [UIFont flatFontOfSize:16];

    [self.mileage setSelectedFont:[UIFont flatFontOfSize:9]];
    [self.mileage setDeselectedFont:[UIFont flatFontOfSize:9]];
    [self.mileage setSelectedColor:[UIColor emerlandColor]];
    self.mileage.cornerRadius = 10.0f;
    //[self.mileage setFrame:CGRectMake(500, 100, 290, 550)];
    //[self.mileage setCornerRadius:0.0f];
    
    
    
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
    
        
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];

    
    
    [self.view addGestureRecognizer:tap];
 

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
    [self.afterSearchload startAnimating];
    [self.afterSearchlabel setHidden:NO];
    NSString *what = self.whatSearch.text;
    NSString *where = self.nearSearch.text;
    NSString *mileage = @"5";
    //self.mileage.selectedSegmentIndex;
    NSArray  * search = [NSArray arrayWithObjects:what,where,mileage,nil];
    [self.afterSearchload stopAnimating];
    [self.afterSearchlabel setHidden:YES];
    
    //PFQuery *query = [PFQuery queryWithClassName:@"Restauraunt"];
    
}




//this is starting the suggestions stuff

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	NSLog(@"Check number of rows");
    return [searchResultPlaces count];
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Call 5");
    SPGooglePlacesAutocompletePlace *place = [self placeAtIndexPath:indexPath];
    [place resolveToPlacemark:^(CLPlacemark *placemark, NSString *addressString, NSError *error) {
        if (error)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Could not map selected Place"
                                  
                                                            message:error.localizedDescription
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil, nil];
            [alert show];
        }
        else if (placemark)
        {
            [self.searchDisplayController.searchResultsTableView deselectRowAtIndexPath:indexPath animated:NO];
        }
    }];
}


- (SPGooglePlacesAutocompletePlace *)placeAtIndexPath:(NSIndexPath *)indexPath {
    return searchResultPlaces[indexPath.row];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Call 5b");
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
    NSLog(@"Call 6");
       searchQuery = [[SPGooglePlacesAutocompleteQuery alloc] initWithApiKey:@"AIzaSyAFsaDn7vyI8pS53zBgYRxu0HfRwYqH-9E"];
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
    NSLog(@"Call 6a");
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    NSLog(@"Call 7");
    [self handleSearchForSearchString:searchString];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}




- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if(searchBar == self.nearSearch)
    {
    NSLog(@"Call 8");
   if (![searchBar isFirstResponder]) {
        // User tapped the 'clear' button.
        NSLog(@"Call 8a");
        shouldBeginEditing = NO;
        [self.searchDisplayController setActive:NO];
    }
    }
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
   
    //this is checking if it is the nearSearch bar beggining to be searched or the whatSearch
    if(searchBar == self.nearSearch)
   {
    NSLog(@"Call 9a");
    if (shouldBeginEditing) {
        // Animate in the table view.
        NSTimeInterval animationDuration = 0.3;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:animationDuration];
        self.searchDisplayController.searchResultsTableView.alpha = 0.75;
        [UIView commitAnimations];
        
        [self.searchDisplayController.searchBar setShowsCancelButton:NO animated:NO];
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
