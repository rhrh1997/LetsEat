//
//  DEMOHomeViewController.m
// defEAT
//

#import "DEMOHomeViewController.h"

@interface DEMOHomeViewController ()



@end

@implementation DEMOHomeViewController

-(void)viewDidLoad
{
    
    NSLog(@"%@", self.navigationController.viewControllers );

    self.title = @"Let's Eat";
   UINavigationController *navCon  = (UINavigationController*) [self.navigationController.viewControllers objectAtIndex:0];
   //navCon.navigationItem.title = @"Hello";
    
    [self.navigationController.navigationBar setBarTintColor:
    [UIColor colorWithRed:0.0f/256.0f green:206.0f/256.0f blue:106.0f/256.0f alpha:1]];
    //[self.navigationController.navigationBar setTranslucent:NO];
    //[self.navigationController.navigationBar setTitleTextAttributes:@{[UIColor whiteColor]:NSBackgroundColorAttributeName}];
    //[self.navigationController.navigationBar setTitleTextAttributes:@{[UIFont fontWithName:@'Avenir'size:16.0]:NSFontAttributeName}];

    self.searchButton.buttonColor = [UIColor turquoiseColor];
    self.searchButton.shadowColor = [UIColor greenSeaColor];
    self.searchButton.shadowHeight = 0.0f;
    self.searchButton.cornerRadius = 6.0f;
    self.searchButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.searchButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.searchButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    self.whatEat.font = [UIFont boldFlatFontOfSize:16];
    self.nearWhere.font = [UIFont boldFlatFontOfSize:16];
    UITextField *searchField = [self.whatSearch valueForKey:@"_searchField"];
    searchField.font = [UIFont flatFontOfSize:16];
    UITextField *searchField1 = [self.nearSearch valueForKey:@"_searchField"];
    searchField1.font = [UIFont flatFontOfSize:16];
    
 

}

- (IBAction)showMenu
{
    [self.frostedViewController presentMenuViewController];
}


- (IBAction)pressed:(id)sender {
    NSLog(@"Pressy Pressy");

}
@end
