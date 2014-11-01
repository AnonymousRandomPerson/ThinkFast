//
//  SmallButtonViewController.h
//  ThinkFast
//
//  Created by Cheng Hann Gan on 11/26/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentViewController.h"

@interface SmallButtonViewController : ParentViewController {
}

@property(nonatomic, retain) UIButton *smallButton;
-(IBAction)smallButton:(id)sender;

@end
