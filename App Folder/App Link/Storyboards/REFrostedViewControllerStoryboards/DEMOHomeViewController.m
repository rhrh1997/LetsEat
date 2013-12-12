//
//  DEMOHomeViewController.m
// defEAT
//

#import "DEMOHomeViewController.h"

@interface DEMOHomeViewController ()

@end

@implementation DEMOHomeViewController

- (IBAction)showMenu
{
    [self.frostedViewController presentMenuViewController];
}



- (IBAction)pressed:(id)sender {
    NSLog(@"Pressy Pressy");
}
@end
