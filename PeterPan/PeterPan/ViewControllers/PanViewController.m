//
//  PanViewController.m
//  PeterPan
//
//  Created by Ashima Atul on 7/25/14.
//  Copyright (c) 2014 Taneja. All rights reserved.
//

#import "PanViewController.h"
#import "PanView.h"

@interface PanViewController ()

@end

@implementation PanViewController

@synthesize panView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    // Return the address of the new object
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage* image = [UIImage imageNamed:@"Ansh_Thomas.jpg"];
    self.panView.panImage = image;
    panView.panDuration = 5.0f;
    [panView animateImage];
}

- (void)viewDidUnload
{
    [self setPanView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)animate:(id)sender {
    [panView animateImage];
}
@end
