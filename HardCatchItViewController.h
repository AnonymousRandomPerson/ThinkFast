//
//  HardCatchItViewController.h
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/8/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ParentViewController.h"

@interface HardCatchItViewController : ParentViewController {
    IBOutlet UIImageView *image;
    CGPoint delta;
    NSTimer *catchTimer;
    float imageLimit;
    CGPoint translation;
}

@property(nonatomic, retain) UIImageView *image;

@end