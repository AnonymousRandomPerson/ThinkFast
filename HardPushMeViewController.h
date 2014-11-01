//
//  HardPushMeViewController.h
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/8/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentViewController.h"

@interface HardPushMeViewController : ParentViewController
{
}
@property(nonatomic, retain) UIButton *pushMeButton;
@property(nonatomic, retain) UIButton *andMe1;
@property(nonatomic, retain) UIButton *andMe2;
@property(nonatomic, retain) UIButton *andMe3;
@property(nonatomic, retain) UIButton *andMe4;
-(IBAction)pushMeButton:(id)sender;
-(IBAction)andMe1:(id)sender;
-(IBAction)andMe2:(id)sender;
-(IBAction)andMe3:(id)sender;
-(IBAction)andMe4:(id)sender;

@end