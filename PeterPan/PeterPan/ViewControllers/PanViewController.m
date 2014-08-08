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
@property (strong) UITapGestureRecognizer *tapGestureRecognizer;

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
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTaps:)];
    
    /* The number of fingers that must be on the screen */
    self.tapGestureRecognizer.numberOfTouchesRequired = 1;
    /* The total number of taps to be performed before the gesture is recognized */
    self.tapGestureRecognizer.numberOfTapsRequired = 1;
    
    /* Add this gesture recognizer to our view */
    [self.view addGestureRecognizer:self.tapGestureRecognizer];
    UIImage* image = [UIImage imageNamed:@"Ansh_Thomas.jpg"];
    self.panView.panImage = image;
    panView.panDuration = 5.0f;
    [panView animateImage];
}

- (void) handleTaps:(UITapGestureRecognizer*)paramSender{
    NSUInteger touchCounter = 0;
    for (touchCounter = 0; touchCounter < paramSender.numberOfTouchesRequired; touchCounter++)
    {
        CGPoint touchPoint = [paramSender locationOfTouch:touchCounter inView:paramSender.view];
        
        self.panView.focusPoint = touchPoint;
        
        // Crop image to required height and width at the center
        CGFloat cropWidth = MIN(abs(self.panView.bounds.size.width - touchPoint.x), touchPoint.x);
        CGFloat cropHeight = MIN(abs(self.panView.bounds.size.height - touchPoint.y), touchPoint.y);
        CGFloat x = touchPoint.x - cropWidth/2;
        CGFloat y = touchPoint.y - cropHeight/2;
        
        CGRect zoomOutFrame = CGRectMake(-x, -y, cropWidth, cropHeight);
        UIImage *croppedBackgroundImage = [self cropImage:self.panView.panImage toRect:zoomOutFrame];
        self.panView.panImage = croppedBackgroundImage;
        //[panView animateImage];
        NSLog(@"Touch #%lu: %@", (unsigned long)touchCounter+1, NSStringFromCGPoint(touchPoint));
    }
}

- (UIImage *)cropImage:(UIImage *)image toRect:(CGRect)cropRect {
    // if image size or cropRect.size passed in are 0, return nil
    if (image.size.width == 0.0 || image.size.height == 0.0 || cropRect.size.width <= 0.0 || cropRect.size.height <= 0.0) {
        return nil;
    }
    @autoreleasepool {
        UIGraphicsBeginImageContextWithOptions(cropRect.size, NO, 0);
        [image drawInRect:CGRectMake(cropRect.origin.x, cropRect.origin.y, image.size.width, image.size.height)];
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    }
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
