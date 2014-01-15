//
//  LoginLogoutViewController.h
//  REFrostedViewControllerStoryboards
//
//  Created by RAZA on 12/19/13.
//  Copyright (c) 2013
//

#import <UIKit/UIKit.h>
#import <FlatUIKit.h>
#import <Parse/Parse.h>
#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"

@interface LoginLogoutViewController : UIViewController
@property (strong, nonatomic) IBOutlet FUIButton *registerButton;
@property (strong, nonatomic) IBOutlet FUIButton *loginButton;
@property (strong, nonatomic) IBOutlet FUIButton *forgotButton;

- (IBAction)showMenu;


@end
