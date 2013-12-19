//
//  OrderSummaryAndPayment.m
//  REFrostedViewControllerStoryboards
//
//  Created by RAZA on 12/19/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "OrderSummaryAndPayment.h"

@interface OrderSummaryAndPayment ()

@end

@implementation OrderSummaryAndPayment

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
    self.payCash.buttonColor = [UIColor alizarinColor];
    self.payCash.shadowColor = [UIColor pomegranateColor];
    self.payCash.shadowHeight = 1.0f;
    self.payCash.cornerRadius = 6.0f;
    self.payCash.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.payCash setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.payCash setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    
    self.payButton.buttonColor = [UIColor emerlandColor];
    self.payButton.shadowColor = [UIColor greenSeaColor];
    self.payButton.shadowHeight = 1.0f;
    self.payButton.cornerRadius = 6.0f;
    self.payButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.payButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.payButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    self.payPayPal.buttonColor = [UIColor alizarinColor];
    self.payPayPal.shadowColor = [UIColor pomegranateColor];
    self.payPayPal.shadowHeight = 1.0f;
    self.payPayPal.cornerRadius = 6.0f;
    self.payPayPal.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.payPayPal setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.payPayPal setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    self.payCard.buttonColor = [UIColor alizarinColor];
    self.payCard.shadowColor = [UIColor pomegranateColor];
    self.payCard.shadowHeight = 1.0f;
    self.payCard.cornerRadius = 6.0f;
    self.payCard.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [self.payCard setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.payCard setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    
    self.payPopover.hidden = YES;
    self.payPopover.backgroundColor = [UIColor peterRiverColor];
    self.payPopover.opaque = NO;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pressPay:(id)sender {
    if(self.payPopover.isHidden)
    {
        NSLog(@"SHOW");
        self.payPopover.hidden = NO;
    }
    else
    {
        NSLog(@"HIDE");
        self.payPopover.hidden = YES;
    }
    //self.payPopover.hidden= NO;
}
@end
