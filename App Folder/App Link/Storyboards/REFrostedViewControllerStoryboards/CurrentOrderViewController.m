//
//  CurrentOrderViewController.m
//  REFrostedViewControllerStoryboards
//
//  Created by RAZA on 12/17/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "CurrentOrderViewController.h"

@interface CurrentOrderViewController ()

@end

@implementation CurrentOrderViewController

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
    //Return Button
    self.ReturnButton.buttonColor = [UIColor emerlandColor];
    self.ReturnButton.shadowColor = [UIColor greenSeaColor];
    self.ReturnButton.shadowHeight = 0.0f;
    self.ReturnButton.cornerRadius = 6.0f;
    self.ReturnButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.ReturnButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.ReturnButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    self.view.opaque = YES;
    self.view.backgroundColor = [UIColor turquoiseColor];
    
    
    self.connectButton.buttonColor = [UIColor emerlandColor];
    self.connectButton.shadowColor = [UIColor greenSeaColor];
    self.connectButton.shadowHeight = 0.0f;
    self.connectButton.cornerRadius = 6.0f;
    self.connectButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.connectButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.connectButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    self.cancelButton.buttonColor = [UIColor pomegranateColor];
    self.cancelButton.shadowColor = [UIColor alizarinColor];
    self.cancelButton.shadowHeight = 1.0f;
    self.cancelButton.cornerRadius = 6.0f;
    self.cancelButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.cancelButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    self.subtotalLabel.font = [UIFont flatFontOfSize:16];
    self.subtotalLabel.text = @"Subtotal: $0.00";
    
    
    self.view.opaque = YES;
    self.view.backgroundColor = [UIColor turquoiseColor];
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ReturnPressed:(id)sender {
    //for the return button
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
