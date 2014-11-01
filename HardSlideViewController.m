//
//  HardSlideViewController.m
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/8/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "HardSlideViewController.h"
#import "ThinkFastViewController.h"

@implementation HardSlideViewController

@synthesize slider, boundsLabel;

NSInteger bounds;

-(IBAction)slider:(id)sender
{
    if (timeLeft>0) {
        if (slider.value>=bounds && slider.value<=bounds+10)
        {
            points+=2;
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
    bounds = arc4random()%91;
    boundsLabel.text = [NSString stringWithFormat:@"%i to %i", bounds, bounds+10];
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
