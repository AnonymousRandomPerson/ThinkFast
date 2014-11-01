//
//  TripleSwitchViewController.h
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/3/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ParentViewController.h"

@interface TripleSwitchViewController : ParentViewController {
    IBOutlet UISwitch *switch1;
    IBOutlet UISwitch *switch2;
    IBOutlet UISwitch *switch3;
}

@property(nonatomic, retain) UISwitch *switch1;
@property(nonatomic, retain) UISwitch *switch2;
@property(nonatomic, retain) UISwitch *switch3;

-(IBAction)switch1:(id)sender;
-(IBAction)switch2:(id)sender;
-(IBAction)switch3:(id)sender;

@end
