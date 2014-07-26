//
//  PanView.m
//  PeterPan
//
//  Created by Ashima Atul on 7/25/14.
//  Copyright (c) 2014 Taneja. All rights reserved.
//

#import "PanView.h"
#import <QuartzCore/QuartzCore.h>

@implementation PanView
@synthesize panImage, panDuration;

-(id) initWithFrame:(CGRect)aFrame
{
    if((self = [super initWithFrame:aFrame])!=nil)
    {
        [self setupPanImageView];
    }
    
    return self;
}

-(void) awakeFromNib
{
    [self setupPanImageView];
}

-(void) dealloc
{
    if(_panImageView != nil)
    {
        [_panImageView removeFromSuperview];
        _panImageView = nil;
    }
}

-(void) setupPanImageView
{
    self.clipsToBounds = YES;
    
    _panImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _panImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self addSubview:_panImageView];
}

-(void) animateImage
{
    //TODO: need to set correct positioning for paning
    if(self.panImage==nil) return;
    
    CGRect zoomOutFrame = CGRectInset(self.bounds,
                        -(self.bounds.size.width * .2),
                        -(self.bounds.size.height * .2));
    
    _panImageView.frame = zoomOutFrame;
    _panImageView.image = self.panImage;
    
    [UIView animateWithDuration:self.panDuration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionNone
                     animations: ^{
                         _panImageView.bounds = self.bounds;
                     }
                     completion:nil];
}

@end

