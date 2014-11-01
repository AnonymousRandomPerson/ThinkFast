//
//  TripleSwitchViewController.m
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/3/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "TripleSwitchViewController.h"
#import "ThinkFastViewController.h"

@implementation TripleSwitchViewController

@synthesize switch1, switch2, switch3;

-(IBAction)switch1:(id)sender {
    self.view.backgroundColor = [UIColor grayColor];
    if (time>0) {
    if (!(switch1.on||switch2.on||switch3.on)) {
        self.view.backgroundColor = [UIColor blackColor];
        points++;
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" 
                                                             bundle:nil];
        UIViewController *randomVC = [storyboard instantiateViewControllerWithIdentifier:[ParentViewController randomChallenge:@"A"]];
        [self presentViewController:randomVC
                           animated:YES
                         completion:nil];
        
    }
    }
}

-(IBAction)switch2:(id)sender {
    self.view.backgroundColor = [UIColor grayColor];
    if (time>0) {
    if (!(switch1.on||switch2.on||switch3.on)) {
        self.view.backgroundColor = [UIColor blackColor];
        points++;
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" 
                                                             bundle:nil];
        UIViewController *randomVC = [storyboard instantiateViewControllerWithIdentifier:[ParentViewController randomChallenge:@"A"]];
        [self presentViewController:randomVC
                           animated:YES
                         completion:nil];
    }}
}

-(IBAction)switch3:(id)sender {
    self.view.backgroundColor = [UIColor grayColor];
    if (time>0) {
    if (!(switch1.on||switch2.on||switch3.on)) {
        self.view.backgroundColor = [UIColor blackColor];
        points++;
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" 
                                                             bundle:nil];
        UIViewController *randomVC = [storyboard instantiateViewControllerWithIdentifier:[ParentViewController randomChallenge:@"A"]];
        [self presentViewController:randomVC
                           animated:YES
                         completion:nil];
    }}
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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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
