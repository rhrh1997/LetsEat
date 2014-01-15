//
//  LoginLogoutViewController.m
//  REFrostedViewControllerStoryboards
//
//  Created by RAZA on 12/19/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "LoginLogoutViewController.h"

@interface LoginLogoutViewController ()

@end

@implementation LoginLogoutViewController

- (IBAction)showMenu
{
    [self.frostedViewController presentMenuViewController];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
