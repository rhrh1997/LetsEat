//
//  CMQDetailViewController.m
//  CodeMashQuotes
//
//  Created by William Dages on 1/9/13.
//  Copyright (c) 2013 Tevsi LLC. All rights reserved.
//

#import "CMQDetailViewController.h"

@interface CMQDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation CMQDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.title = [self.detailItem objectForKey:@"Name"];
        self.RestarauntName.text = [self.detailItem objectForKey:@"Name"];
        self.Hours.text = [self.detailItem objectForKey:@"Hours"];
        self.Address.text = [self.detailItem objectForKey:@"Address"];
        self.Phone.text = [self.detailItem objectForKey:@"Phone"];
        [self loadParseImage:self.detailItem forImageColumn:@"Logo" andCompletionBlock:^(UIImage *imageFile, NSError *error)
             {
                 if (!error)
                 {
                     self.imageView.image = imageFile;
                 }
                 else
                 {
                     // Image file did not load correctly. Handle the error as you see fit.
                 }
             }];

    }
    
//    PFQuery *query = [PFQuery queryWithClassName:@"Restaraunt"];
//    [query selectKeys:@[@"student_no"]];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        // iterate through the objects array, which contains PFObjects for each Student
//    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    self.curOrder.buttonColor = [UIColor redColor];
    self.curOrder.shadowColor = [UIColor greenSeaColor];
    self.curOrder.shadowHeight = 0.0f;
    self.curOrder.cornerRadius = 0.0f;
    self.curOrder.titleLabel.font = [UIFont flatFontOfSize:16];
    [self.curOrder setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.curOrder setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    self.goMenu.buttonColor = [UIColor emerlandColor];
    self.goMenu.shadowColor = [UIColor greenSeaColor];
    self.goMenu.shadowHeight = 0.0f;
    self.goMenu.cornerRadius = 0.0f;
    self.goMenu.titleLabel.font = [UIFont flatFontOfSize:16];
    [self.goMenu setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [self.goMenu setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view
//
//- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
//{
//    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
//    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
//    self.masterPopoverController = popoverController;
//}
//
//- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
//{
//    // Called when the view is shown again in the split view, invalidating the button and popover controller.
//    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
//    self.masterPopoverController = nil;
//}

-(void)loadParseImage:(PFObject *)parseObject forImageColumn:(NSString *)columnName  andCompletionBlock:(void (^)(UIImage *imageFile, NSError *error))completionBlock
{
    NSString *parseFileName = [NSString stringWithFormat:@"%@", [[parseObject objectForKey:columnName] name]];
    // Get a path to the place in the local documents directory on the iOS device where the image file should be stored.
    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    // You can change the path as you see fit by altering the stringByAppendingPathComponent call here.
    NSString *imagesDirectory = [documentsDirectory stringByAppendingPathComponent:@"Images"];
    NSString *storePath = [imagesDirectory stringByAppendingPathComponent:parseFileName];

    // Image data from Parse.com is retrieved in the background.
    [[parseObject objectForKey:columnName] getDataInBackgroundWithBlock:^(NSData *data, NSError *error)
     {
         if (!error)
         {
             NSData *fileData = [[NSData alloc] initWithData:data];
             if (![[NSFileManager defaultManager] fileExistsAtPath:imagesDirectory])
             {
                 // Create the folder if it doesn't already exist.
                 [[NSFileManager defaultManager] createDirectoryAtPath:imagesDirectory
                                           withIntermediateDirectories:NO
                                                            attributes:nil
                                                                 error:&error];
             }
             // Write the PFFile data to the local file.
             [fileData writeToFile:storePath atomically:YES];
             
             UIImage *showcaseImage;
             if ([[NSFileManager defaultManager] fileExistsAtPath:imagesDirectory])
             {
                 showcaseImage = [UIImage imageWithContentsOfFile:storePath];
             }
             else // No file exists at the expected path. Perhaps the disk is full, etc.?
             {
                 NSLog(@"Unable to find image file where we expected it: %@", storePath);
             }
             completionBlock(showcaseImage, error);
             // This may be a good place to clean up the target directory.
         }
         else // Unable to pull the image data from Parse.com. Consider more robust error handling.
         {
             NSLog(@"Error getting image data.");
             completionBlock(nil, error);
         }
     }
                                                          progressBlock:^(int percentDone)
     {
       
     }];
}

@end
