//
//  RotateViewController.h
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/8/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ParentViewController.h"

@interface RotateViewController : ParentViewController {
    IBOutlet UIImageView *image;
    IBOutlet UILabel *wrongWay;
    bool done;
}

@property (nonatomic, retain) IBOutlet UIImageView *image;
@property (nonatomic, retain) IBOutlet UILabel *wrongWay;
@property (nonatomic) bool done;

@end