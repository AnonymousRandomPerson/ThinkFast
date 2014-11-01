//
//  WaitViewController.h
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ParentViewController.h"

@interface WaitViewController : ParentViewController {
    NSTimer *waitTimer;
}

@property (nonatomic, retain) NSTimer *waitTimer;

@end
