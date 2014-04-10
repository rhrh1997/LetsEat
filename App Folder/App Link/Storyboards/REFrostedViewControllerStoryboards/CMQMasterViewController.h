//
//  CMQMasterViewController.h
//  CodeMashQuotes
//
//  Created by William Dages on 1/9/13.
//  Copyright (c) 2013 Tevsi LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#include <CoreLocation/CoreLocation.h>


@class CMQDetailViewController;

@interface CMQMasterViewController : PFQueryTableViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) CMQDetailViewController *detailViewController;

@property(readwrite,nonatomic) CLLocationCoordinate2D nearThis;
@end
