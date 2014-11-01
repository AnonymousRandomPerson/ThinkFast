//
//  RotateViewController.m
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/8/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "RotateViewController.h"
#import "ThinkFastViewController.h"

@implementation RotateViewController

@synthesize image, wrongWay;

CGFloat netRotation=1;

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
    UIRotationGestureRecognizer *rotateGesture;
    rotateGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self 
                                                                 action:@selector(handleRotateGesture:)];
    [image addGestureRecognizer:rotateGesture];
    wrongWay.text=nil;
    netRotation=0;
}

-(IBAction) handleRotateGesture: (UIRotationGestureRecognizer *) sender {
    CGFloat rotation = [(UIRotationGestureRecognizer *) sender rotation];
    CGAffineTransform transform = CGAffineTransformMakeRotation(rotation+netRotation);
    sender.view.transform = transform;
    if (sender.state == UIGestureRecognizerStateEnded) {
        netRotation += rotation;
    }
    if (netRotation <= -3.1415926535||rotation <= -3.1415926535) {
        points++;
        pointLabel.text=[NSString stringWithFormat:@"Points: %i", points];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" 
                                                             bundle:nil];
        UIViewController *randomVC = [storyboard instantiateViewControllerWithIdentifier:[ParentViewController randomChallenge:@"A"]];
        [self presentViewController:randomVC
                           animated:YES
                         completion:nil];
    }
    if (netRotation >= 3.1415926535||rotation >= 3.1415926535) {
        wrongWay.text=@"WRONG WAY!";
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
