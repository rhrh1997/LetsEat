//
//  CurrentOrderViewController.h
//  REFrostedViewControllerStoryboards
//
//  Created by RAZA on 12/17/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
#import <FlatUIKit.h>


@interface CurrentOrderViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *subtotalLabel;
@property (strong, nonatomic) IBOutlet FUIButton *connectButton;
@property (strong, nonatomic) IBOutlet FUIButton *cancelButton;
@property (strong, nonatomic) IBOutlet FUIButton *ReturnButton;
- (IBAction)ReturnPressed:(id)sender;

@end
