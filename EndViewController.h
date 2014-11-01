//
//  EndViewController.h
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/7/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EndViewController : UIViewController {
    IBOutlet UILabel *finalScore;
    IBOutlet UILabel *highScoreText;
    IBOutlet UIButton *ok;
}

@property(nonatomic, retain) UILabel *finalScore;
@property(nonatomic, retain) UILabel *highScoreText;
@property(nonatomic, retain) UIButton *ok;

-(IBAction)ok:(id)sender;

@end
