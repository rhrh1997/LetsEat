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
   //UINavigationController *navCon  = (UINavigationController*) [self.navigationController.viewControllers objectAtIndex:0];
   //navCon.navigationItem.title = @"Hello";
    
    [self.navigationController.navigationBar setBarTintColor:
    [UIColor colorWithRed:0.0f/256.0f green:206.0f/256.0f blue:106.0f/256.0f alpha:1]];
    //[self.navigationController.navigationBar setTranslucent:NO];
    //[self.navigationController.navigationBar setTitleTextAttributes:@{[UIColor whiteColor]:NSBackgroundColorAttributeName}];
    //[self.navigationController.navigationBar setTitleTextAttributes:@{[UIFont fontWithName:@'Avenir'size:16.0]:NSFontAttributeName}];

    self.searchButton.buttonColor = [UIColor emerlandColor];
    self.searchButton.shadowColor = [UIColor greenSeaColor];
    self.searchButton.shadowHeight = 0.0f;
    self.searchButton.cornerRadius = 6.0f;
    self.searchButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.searchButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.searchButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
   
    //Current Location button
    self.curLoc.buttonColor = [UIColor emerlandColor];
    self.curLoc.shadowColor = [UIColor greenSeaColor];
    self.curLoc.shadowHeight = 0.0f;
    self.curLoc.cornerRadius = 6.0f;
    self.curLoc.titleLabel.font = [UIFont boldFlatFontOfSize:9];
    [self.curLoc setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.curLoc setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    //
    
    self.whatEat.font = [UIFont boldFlatFontOfSize:16];
    
    self.nearWhere.font = [UIFont boldFlatFontOfSize:16];
    
    UITextField *searchField = [self.whatSearch valueForKey:@"_searchField"];
    searchField.font = [UIFont flatFontOfSize:16];
    searchField.textColor = [UIColor whiteColor];
    
    UITextField *searchField1 = [self.nearSearch valueForKey:@"_searchField"];
    searchField1.textColor = [UIColor whiteColor];
    searchField1.font = [UIFont flatFontOfSize:16];

    [self.mileage setSelectedFont:[UIFont flatFontOfSize:9]];
    [self.mileage setDeselectedFont:[UIFont flatFontOfSize:9]];
    [self.mileage setSelectedColor:[UIColor emerlandColor]];
    [self.mileage setCornerRadius:10.0f];
    
    
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
    
        
    
 

}

- (IBAction)showMenu
{
    [self.frostedViewController presentMenuViewController];
}


- (IBAction)pressed:(id)sender {
    NSLog(@"Pressy Pressy");

}
@end
