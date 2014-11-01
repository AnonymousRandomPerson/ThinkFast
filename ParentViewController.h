//
//  ParentViewController.h
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/1/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParentViewController : UIViewController {
    NSTimer *timer;
    IBOutlet UILabel *pointLabel;
    IBOutlet UILabel *timeLabel;
}
@property (nonatomic, retain) NSTimer *timer;
@property(nonatomic, retain) UILabel *pointLabel;
@property(nonatomic, retain) UILabel *timeLabel;
-(IBAction)timeLabel:(id)sender;
-(IBAction)pointLabel:(id)sender;
+(NSString*)randomChallenge:(NSString*)string;

@end
