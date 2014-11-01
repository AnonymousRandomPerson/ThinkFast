//
//  ThinkFastViewController.h
//  ThinkFast
//
//  Created by Cheng Hann Gan on 11/13/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ThinkFastViewController : UIViewController {
    NSTimer *timer;
    AVAudioPlayer *audioPlayer;
}
@property(nonatomic, retain) UIButton *easyButton;
@property(nonatomic, retain) UIButton *hardButton;
@property(nonatomic, retain) NSTimer *timer;
-(IBAction)easyButton:(id)sender;
-(IBAction)hardButton:(id)sender;
extern NSInteger points;
extern NSInteger timeLeft;
extern bool difficulty;

@end
