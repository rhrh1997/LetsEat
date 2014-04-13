//
//  CMQDetailViewController.h
//  CodeMashQuotes
//
//  Created by William Dages on 1/9/13.
//  Copyright (c) 2013 Tevsi LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <FlatUIKit.h>

@interface CMQDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) IBOutlet FUIButton *curOrder;
@property (strong, nonatomic) IBOutlet UILabel *RestarauntName;
@property (strong, nonatomic) IBOutlet UILabel *Phone;
@property (strong, nonatomic) IBOutlet UILabel *Address;
@property (strong, nonatomic) IBOutlet FUIButton *goMenu;

@property (strong, nonatomic) IBOutlet UILabel *Hours;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
-(void)loadParseImage:(PFObject *)parseObject forImageColumn:(NSString *)columnName andCompletionBlock:(void (^)(UIImage *imageFile, NSError *error))completionBlock;
@end
