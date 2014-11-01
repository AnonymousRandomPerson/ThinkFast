//
//  HardHoldViewController.m
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/8/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "HardHoldViewController.h"
#import "ThinkFastViewController.h"

@implementation HardHoldViewController

@synthesize done;

bool button1Pressed, button2Pressed, timerOn;
NSTimer *holdTimer;

-(IBAction)button1Press:(id)sender {
    button1Pressed=1;
    if (button2Pressed&&!timerOn) {
        holdTimer = [NSTimer scheduledTimerWithTimeInterval:.001
                                                     target:self
                                                   selector:@selector(progressed:)
                                                   userInfo:nil 
                                                    repeats:YES];
        timerOn=1;
    }
}

-(IBAction)button2Press:(id)sender {
    button2Pressed=1;
    if (button1Pressed&&!timerOn) {
        holdTimer = [NSTimer scheduledTimerWithTimeInterval:.001
                                                     target:self
                                                   selector:@selector(progressed:)
                                                   userInfo:nil 
                                                    repeats:YES];
        timerOn=1;
    }
}

-(IBAction)button1Release:(id)sender {
    button1Pressed=0;
    [holdTimer invalidate];
    progressBar.progress=0;
    timerOn=0;
}

-(IBAction)button2Release:(id)sender {
    button2Pressed=0;
    [holdTimer invalidate];
    progressBar.progress=0;
    timerOn=0;
}

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
    [button2 addGestureRecognizer:longPressGesture];
    done=1;
    button1Pressed=0;
    button2Pressed=0;
    progressBar.progress=0;
    timerOn=0;
}

-(IBAction)handleLongPressGesture:(id)sender {
    if (timeLeft>0) {
        if (button1Pressed&&button2Pressed) {
            if (done) {
                done=0;
                points+=2;
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
