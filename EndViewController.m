//
//  EndViewController.m
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/7/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "EndViewController.h"
#import "ThinkFastViewController.h"

@implementation EndViewController

@synthesize finalScore, highScoreText, ok;

-(IBAction)ok:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" 
                                                         bundle:nil];
    UIViewController *mainVC = [storyboard instantiateViewControllerWithIdentifier:@"ThinkFast"];
    [self presentViewController:mainVC 
                       animated:NO
                     completion:nil];
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
    finalScore.text = [NSString stringWithFormat:@"%i", points];
    NSURL *URL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/HS.txt", [[NSBundle mainBundle] resourcePath]]];
    NSError *error;
    NSString *highScore = [[NSString alloc] initWithContentsOfURL:URL
                                                         encoding:NSUTF8StringEncoding
                                                            error:&error];
    NSLog(@"%@", highScore);
    if (highScore == nil) {
        // an error occurred
        NSLog(@"Error reading file at %@\n%@",
              URL, [error localizedFailureReason]);
        // implementation continues ...
    }
    if (highScore == nil || [highScore intValue] < points)
    {
        NSLog(@"AAA");
        highScore = [NSString stringWithFormat:@"%i", points];
        BOOL ok2 = [highScore writeToFile:@"HS.txt"
                               atomically:YES
                                 encoding:NSUTF8StringEncoding
                                    error:&error];
        if (!ok2) {
            // an error occurred
            NSLog(@"Error writing file at %@\n%@",
                  URL, [error localizedFailureReason]);
            // implementation continues ...
        }
    }
    highScoreText.text = [@"High Score: " stringByAppendingString:highScore];
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
