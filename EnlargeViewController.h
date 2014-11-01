//
//  EnlargeViewController.h
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ParentViewController.h"

@interface EnlargeViewController : ParentViewController {
    IBOutlet UIImageView *image;
    bool done;
}

@property (nonatomic, retain) IBOutlet UIImageView *image;
@property (nonatomic) bool done;

@end
