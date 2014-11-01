//
//  HardSelectCorrectViewController.h
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/8/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ParentViewController.h"

@interface HardSelectCorrectViewController : ParentViewController {
    IBOutlet UILabel *directionText;
    IBOutlet UIImageView *blank;
}
@property(nonatomic) NSInteger randDirection;
@property(nonatomic, retain) UILabel *directionText;
@property(nonatomic, retain) UIImageView *blank;

@end
