//
//  EnlargeViewController.m
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "EnlargeViewController.h"
#import "ThinkFastViewController.h"

CGFloat lastScaleFactor = 1;

@implementation EnlargeViewController

@synthesize image, done;

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
    UIPinchGestureRecognizer *pinchGesture;
    pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self 
                                                             action:@selector(handlePinchGesture:)];
    [image addGestureRecognizer:pinchGesture];
    done=1;
}

-(IBAction)handlePinchGesture:(UIPinchGestureRecognizer *)sender {
    CGFloat factor = [(UIPinchGestureRecognizer *)sender scale];
    if (factor > 1) {
        // zoom in
        sender.view.transform = CGAffineTransformMakeScale(lastScaleFactor + (factor-1), lastScaleFactor + (factor-1));
    }
    else {
        // zoom out
        sender.view.transform = CGAffineTransformMakeScale(lastScaleFactor*factor, lastScaleFactor*1);
    }
    // need to know when gesture ends
    if (sender.state == UIGestureRecognizerStateEnded) {
        if (factor > 1) {
            lastScaleFactor += (factor-1);
        }
        else {
            lastScaleFactor *= factor;
        }
    }
    if (timeLeft>0) {
        if (factor > 3) {
            if (done) {
                done=0;
                points++;
            }
            pointLabel.text=[NSString stringWithFormat:@"Points: %i", points];
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" 
                                                                     bundle:nil];
            UIViewController *randomVC = [storyboard instantiateViewControllerWithIdentifier:   [ParentViewController randomChallenge:@"A"]];
            [self presentViewController:randomVC
                               animated:YES
                             completion:nil];
        }
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
