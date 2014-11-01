//
//  HardCatchItViewController.m
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/8/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "HardCatchItViewController.h"
#import "ThinkFastViewController.h"

@implementation HardCatchItViewController

@synthesize image;

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
	// Do any additional setup after loading the view, typically from a nib.
    imageLimit = 25;
    translation = CGPointMake(0, 0);
    NSInteger randX = arc4random()%220+50;
    NSInteger randY = arc4random()%360+50;
    image.center = CGPointMake(randX, randY);
    NSInteger randXD = arc4random()%10 - 5;
    NSInteger randYD = arc4random()%10 - 5;
    delta = CGPointMake(randXD, randYD);
    catchTimer = [NSTimer scheduledTimerWithTimeInterval:.03
                                                  target:self 
                                                selector:@selector(animating) 
                                                userInfo:nil
                                                 repeats:YES];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    tapGesture.numberOfTapsRequired = 1;
    [image addGestureRecognizer:tapGesture];
    //NSLog(@"%f", image.center.x);
    //NSLog(@"%f", image.center.y);
}

-(void) animating {
    image.center = CGPointMake(image.center.x + delta.x, image.center.y + delta.y);
    image.transform = CGAffineTransformMakeTranslation(translation.x, translation.y);
    translation.x = translation.x + delta.x;
    translation.y = translation.y + delta.y;
    if (image.center.x + translation.x > self.view.bounds.size.width - imageLimit || (image.center.x + translation.x < imageLimit)) {
        delta.x = -delta.x;
    }
    if ((image.center.y + translation.y > self.view.bounds.size.height - imageLimit) || (image.center.y + translation.y < imageLimit)) {
        delta.y = -delta.y;
    }
    if (image.center.x > self.view.bounds.size.width - imageLimit || image.center.x < imageLimit) {
        delta.x = -delta.x;
    }
    if (image.center.y > self.view.bounds.size.height - imageLimit || image.center.y < imageLimit) {
        delta.y = -delta.y;
    }
}

-(IBAction)handleTapGesture:(UIGestureRecognizer *)sender {
    if (timeLeft>0) {
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
