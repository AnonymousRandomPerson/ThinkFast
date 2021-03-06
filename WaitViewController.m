//
//  WaitViewController.m
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "WaitViewController.h"
#import "ThinkFastViewController.h"

@implementation WaitViewController

@synthesize waitTimer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [waitTimer invalidate];
    waitTimer=nil;
    waitTimer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                             target:self
                                           selector:@selector(finishedWaiting:)
                                           userInfo:nil 
                                            repeats:NO];
}

-(void)finishedWaiting:(NSTimer*)waitTimer {
    if (timeLeft>0) {
        points++;
        pointLabel.text=[NSString stringWithFormat:@"Points: %i", points];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" 
                                                             bundle:nil];
        UIViewController *randomVC = [storyboard instantiateViewControllerWithIdentifier:[ParentViewController randomChallenge:@"A"]];
        [self presentViewController:randomVC
                           animated:YES
                         completion:nil];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
