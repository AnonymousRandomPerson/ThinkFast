//
//  TiltViewController.h
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ParentViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface TiltViewController : ParentViewController {
    IBOutlet UIImageView *image;
    IBOutlet UIImageView *flag;
    CGPoint delta;
    NSTimer *catchTimer;
    float imageLimit;
    CGPoint translation;
}

@end
