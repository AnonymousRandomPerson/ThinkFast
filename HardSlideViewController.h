//
//  HardSlideViewController.h
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/8/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentViewController.h"

@interface HardSlideViewController : ParentViewController {
    IBOutlet UISlider *slider;
    IBOutlet UILabel *boundsLabel;
}

@property(nonatomic, retain) UISlider *slider;
@property(nonatomic, retain) UILabel *boundsLabel;
-(IBAction)slider:(id)sender;

@end
