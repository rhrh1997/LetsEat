//
//  DEMOHomeViewController.m
// defEAT
//

#import "DEMOHomeViewController.h"
#import <MapKit/MapKit.h>


@interface DEMOHomeViewController ()



@end

@implementation DEMOHomeViewController

static NSString *kCellIdentifier = @"cellIdentifier";

CLLocationManager *locationManager;
CLLocationCoordinate2D userLocation;


-(void)viewDidLoad
{
    [self.navigationController setNavigationBarHidden:YES];
    //Current Order setup
    self.nearSuggest.hidden = true;
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
    self.nearSuggest.hidden = true;
}

- (IBAction)showMenu
{
    //Menu button
    [self.frostedViewController presentMenuViewController];
}


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
    
    PFQuery *query = [PFQuery queryWithClassName:@"Restauraunt"];
    
}

- (NSInteger)tableView:nearSuggest numberOfRowsInSection:(NSInteger)section
{
	return [self.places count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    MKMapItem *mapItem = [self.places objectAtIndex:indexPath.row];
    cell.textLabel.text = mapItem.name;
    
	return cell;
}

- (void)tableView:nearSuggest didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    // pass the individual place to our map destination view controller
    NSIndexPath *selectedItem = [nearSuggest indexPathForSelectedRow];
  
}

- (void)searchBarTextDidEndEditing:nearSearch
{
    NSLog(@"End");
    self.nearSuggest.hidden = true;
}



- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
    
    //
    if (searchBar == self.nearSearch)
    {
        NSLog(@"SearchPresse");
        NSString *causeStr = nil;
        self.nearSuggest.hidden = false;
        
        // check whether location services are enabled on the device
        
        if ([CLLocationManager locationServicesEnabled] == NO)
        {
            causeStr = @"device";
        }
        // check the application’s explicit authorization status:
        else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)
        {
            causeStr = @"app";
        }
        else
        {
            // we are good to go, start the search
            //[self startSearch:searchBar.text];
        }
        
        if (causeStr != nil)
        {
            NSString *alertMessage = [NSString stringWithFormat:@"Youcurrently have location services disabled for this %@. Please refer to \"Settings\" app to turn on Location Services.", causeStr];
            
            UIAlertView *servicesDisabledAlert = [[UIAlertView alloc] initWithTitle:@"Location Services Disabled"
                                                                            message:alertMessage
                                                                           delegate:nil
                                                                  cancelButtonTitle:@"OK"
                                                                  otherButtonTitles:nil];
            [servicesDisabledAlert show];
            
        }

    }
    else if (searchBar == self.whatSearch)
    {
        [self.nearSearch resignFirstResponder];
        self.nearSuggest.hidden = true;
    }
    
       // Do the search...

}







@end
