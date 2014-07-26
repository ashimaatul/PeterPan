//
//  PanView.h
//  PeterPan
//
//  Created by Ashima Atul on 7/25/14.
//  Copyright (c) 2014 Taneja. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanView : UIView
{
    UIImageView* _panImageView;
}
@property(nonatomic, copy) UIImage* panImage;
@property(nonatomic) int panDuration;
-(void) animateImage;

@end