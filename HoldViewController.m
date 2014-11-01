//
//  HoldViewController.m
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "HoldViewController.h"
#import "ThinkFastViewController.h"

@implementation HoldViewController

NSTimer *holdTimer;

@synthesize done;

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
    UILongPressGestureRecognizer *longPressGesture;
    longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGesture:)];
    longPressGesture.minimumPressDuration = 2;
    longPressGesture.allowableMovement = 15;
    longPressGesture.numberOfTouchesRequired = 1;
    [button addGestureRecognizer:longPressGesture];
    done=1;
    progressBar.progress=0;
}

-(IBAction)handleLongPressGesture:(id)sender {
    if (timeLeft>0) {
        if (done) {
            done=0;
            points++;
        }
        pointLabel.text=[NSString stringWithFormat:@"Points: %i", points];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" 
                                                             bundle:nil];
        UIViewController *randomVC = [storyboard instantiateViewControllerWithIdentifier:[ParentViewController randomChallenge:@"A"]];
        [self presentViewController:randomVC
                           animated:YES
                         completion:nil];
    }
}

-(IBAction)buttonPress:(id)sender {
    holdTimer = [NSTimer scheduledTimerWithTimeInterval:.001
                                             target:self
                                               selector:@selector(progressed:)
                                           userInfo:nil 
                                            repeats:YES];
}

-(IBAction)buttonRelease:(id)sender {
    [holdTimer invalidate];
    progressBar.progress=0;
}

-(void)progressed:(NSTimer*)holdTimer {
    progressBar.progress+=.0005;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [holdTimer invalidate];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
