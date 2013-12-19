//
//  OrderSummaryAndPayment.h
//  REFrostedViewControllerStoryboards
//
//  Created by RAZA on 12/19/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FlatUIKit.h>
#import <FlatUIKit/FUIPopoverBackgroundView.h>

@interface OrderSummaryAndPayment : UIViewController
@property (strong, nonatomic) IBOutlet FUIButton *payButton;
@property (strong, nonatomic) IBOutlet FUIButton *payCash;
@property (strong, nonatomic) IBOutlet FUIButton *payPayPal;
@property (strong, nonatomic) IBOutlet FUIButton *payCard;
@property (strong, nonatomic) IBOutlet FUIPopoverBackgroundView *payPopover;
- (IBAction)pressPay:(id)sender;

@end
