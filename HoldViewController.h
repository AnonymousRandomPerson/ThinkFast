//
//  HoldViewController.h
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ParentViewController.h"

@interface HoldViewController : ParentViewController {
    IBOutlet UIButton *button;
    IBOutlet UIProgressView *progressBar;
    bool done;
}

@property (nonatomic) bool done;
-(IBAction)buttonPress:(id)sender;
-(IBAction)buttonRelease:(id)sender;

@end
