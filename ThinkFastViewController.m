//
//  ThinkFastViewController.m
//  ThinkFast
//
//  Created by Cheng Hann Gan on 11/13/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ThinkFastViewController.h"
#import <AVFoundation/AVFoundation.h>

@implementation ThinkFastViewController

@synthesize easyButton, hardButton, timer;

NSInteger points;
NSInteger timeLeft;
bool difficulty;

-(IBAction)easyButton:(id)sender
{
    difficulty=0;
    timer = [NSTimer scheduledTimerWithTimeInterval:.001
                                             target:self
                                           selector:@selector(timeDec:)
                                           userInfo:nil 
                                            repeats:YES];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" 
                                                         bundle:nil];
    UIViewController *easyVC = [storyboard instantiateViewControllerWithIdentifier:@"PushMe"];
    [self presentViewController:easyVC 
                       animated:YES
                     completion:nil];
}

- (void)timeDec:(NSTimer*)timer
{
    timeLeft--;
    if (timeLeft<=0)
        [timer invalidate];
}

-(IBAction)hardButton:(id)sender
{
    difficulty=1;
    timer = [NSTimer scheduledTimerWithTimeInterval:.001
                                             target:self
                                           selector:@selector(timeDec:)
                                           userInfo:nil 
                                            repeats:YES];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" 
                                                         bundle:nil];
    UIViewController *hardVC = [storyboard instantiateViewControllerWithIdentifier:@"SmallButton"];
    [self presentViewController:hardVC 
                       animated:YES
                     completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    points=0;
    timeLeft=5000;
    [timer invalidate];
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/Endurance.wav", [[NSBundle mainBundle] resourcePath]]];
	
	NSError *error;
	audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	audioPlayer.numberOfLoops = -1;
	
	if (audioPlayer == nil)
		NSLog([error description]);
	else
		[audioPlayer play];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
