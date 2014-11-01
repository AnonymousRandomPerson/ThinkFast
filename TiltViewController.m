//
//  TiltViewController.m
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "TiltViewController.h"
#import "ThinkFastViewController.h"

@implementation TiltViewController

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
    UIAccelerometer *accel = [UIAccelerometer sharedAccelerometer];
    accel.delegate = self;
    accel.updateInterval = 1.0f/60.0f;
    NSInteger randX = arc4random()%245+25;
    NSInteger randY = arc4random()%385+25;
    image.center = CGPointMake(randX, randY);
    NSInteger flagX = arc4random()%230+30;
    NSInteger flagY = arc4random()%325+45;
    flag.center = CGPointMake(flagX, flagY);
    while (image.center.x > flag.center.x-30 && image.center.x < flag.center.y+30 &&
        image.center.y > flag.center.y-45 && image.center.y < flag.center.y+45) {
        randX = arc4random()%245+25;
        randY = arc4random()%385+25;
        image.center = CGPointMake(randX, randY);
    }
    NSLog(@"%f", flag.center.x);
    NSLog(@"%f", flag.center.y);
}

-(void) accelerometer:(UIAccelerometer *)accelerometer
        didAccelerate:(UIAcceleration *)acceleration {
    delta.x = acceleration.y*5;
    delta.y = acceleration.x*5;
    image.center = CGPointMake(image.center.x + delta.x, image.center.y + delta.y);
    if (image.center.x < 0)
        image.center = CGPointMake(320, image.center.y);
    if (image.center.x > 320)
        image.center = CGPointMake(0, image.center.y);
    if (image.center.y < 0)
        image.center = CGPointMake(image.center.x, 460);
    if (image.center.y > 460)
        image.center = CGPointMake(image.center.x, 0);
    if (image.center.x > flag.center.x-30 && image.center.x < flag.center.x+30 &&
        image.center.y > flag.center.y-45 && image.center.y < flag.center.y+45) {
        if (timeLeft>0) {
            NSLog(@"%f", image.center.x);
            NSLog(@"%f", image.center.y);
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
