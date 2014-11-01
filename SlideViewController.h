//
//  SlideViewController.h
//  ThinkFast
//
//  Created by Cheng Hann Gan on 11/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentViewController.h"

@interface SlideViewController : ParentViewController {
    IBOutlet UISlider *slider;
}

@property(nonatomic, retain) UISlider *slider;
-(IBAction)slider:(id)sender;

@end
