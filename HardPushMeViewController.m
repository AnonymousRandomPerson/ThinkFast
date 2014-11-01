//
//  HardPushMeViewController.m
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/8/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "HardPushMeViewController.h"
#import "ThinkFastViewController.h"

@implementation HardPushMeViewController

@synthesize pushMeButton, andMe1, andMe2, andMe3, andMe4;

bool push0;
bool push1;
bool push2;
bool push3;
bool push4;

-(IBAction)pushMeButton:(id)sender
{
    push0=1;
    if (timeLeft>0) {
        if (push0&&push1&&push2&&push3&&push4) {
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

-(IBAction)andMe1:(id)sender
{
    push1=1;
    if (timeLeft>0) {
        if (push0&&push1&&push2&&push3&&push4) {
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

-(IBAction)andMe2:(id)sender
{
    push2=1;
    if (timeLeft>0) {
        if (push0&&push1&&push2&&push3&&push4) {
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

-(IBAction)andMe3:(id)sender
{
    push3=1;
    if (timeLeft>0) {
        if (push0&&push1&&push2&&push3&&push4) {
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

-(IBAction)andMe4:(id)sender
{
    push4=1;
    if (timeLeft>0) {
        if (push0&&push1&&push2&&push3&&push4) {
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
    push0=0;
    push1=0;
    push2=0;
    push3=0;
    push4=0;
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
