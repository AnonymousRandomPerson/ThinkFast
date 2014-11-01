//
//  HardSelectCorrectViewController.m
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/8/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "HardSelectCorrectViewController.h"
#import "ThinkFastViewController.h"

@implementation HardSelectCorrectViewController

@synthesize randDirection, directionText, blank;

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
    directionText.numberOfLines=0;
    randDirection = arc4random()%4;
    switch (randDirection) {
        case 0:
            directionText.text=@"Don't Swipe East,\nSouth,\nWest";
            break;
        case 1:
            directionText.text=@"Don't Swipe North,\nSouth,\nWest";
            break;
        case 2:
            directionText.text=@"Don't Swipe North,\nEast,\nWest";
            break;
        case 3:
            directionText.text=@"Don't Swipe North,\nEast,\nSouth";
            break;
        default:
            directionText.text=@"Don't Swipe East,\nSouth,\nWest";
            break;
    }
    UISwipeGestureRecognizer *swipeGesture;
    swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self 
                                                             action:@selector(handleSwipeGesture:)];
    [blank addGestureRecognizer:swipeGesture];
    UISwipeGestureRecognizer *leftSwipeGesture;
    leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                 action:@selector(handleSwipeGesture:)];
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [blank addGestureRecognizer:leftSwipeGesture];
    UISwipeGestureRecognizer *upSwipeGesture;
    upSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                               action:@selector(handleSwipeGesture:)];
    upSwipeGesture.direction = UISwipeGestureRecognizerDirectionUp;
    [blank addGestureRecognizer:upSwipeGesture];
    UISwipeGestureRecognizer *downSwipeGesture;
    downSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                 action:@selector(handleSwipeGesture:)];
    downSwipeGesture.direction = UISwipeGestureRecognizerDirectionDown;
    [blank addGestureRecognizer:downSwipeGesture];
}

-(IBAction)handleSwipeGesture:(id)sender {
    NSInteger dirNumber;
    UISwipeGestureRecognizerDirection direction = [(UISwipeGestureRecognizer *)sender direction];
    switch (direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            dirNumber=3;
            break;
        case UISwipeGestureRecognizerDirectionRight:
            dirNumber=1;
            break;
        case UISwipeGestureRecognizerDirectionUp:
            dirNumber=0;
            break;
        case UISwipeGestureRecognizerDirectionDown:
            dirNumber=2;
            break;
        default:
            break;
    }
    if (randDirection==dirNumber) {
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
    else {
        self.view.backgroundColor=[UIColor redColor];
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
