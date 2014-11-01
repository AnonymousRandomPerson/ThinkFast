//
//  HardHoldViewController.h
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/8/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ParentViewController.h"

@interface HardHoldViewController : ParentViewController {
    IBOutlet UIButton *button;
    IBOutlet UIButton *button2;
    bool done;
    IBOutlet UIProgressView *progressBar;
}

@property (nonatomic) bool done;
-(IBAction)button1Press:(id)sender;
-(IBAction)button2Press:(id)sender;
-(IBAction)button1Release:(id)sender;
-(IBAction)button2Release:(id)sender;

@end