//
//  ParentViewController.m
//  ThinkFast
//
//  Created by Cheng Hann Gan on 12/1/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ParentViewController.h"
#import "ThinkFastViewController.h"

@implementation ParentViewController

@synthesize timer, pointLabel, timeLabel;

- (void)timeDec:(NSTimer*)timer
{
    timeLabel.text=[NSString stringWithFormat:@"Time: %i", timeLeft/1000+1];
    if (timeLeft<=0)
    {
        [timer invalidate];
        NSTimer *timer2;
        timer2=[NSTimer scheduledTimerWithTimeInterval:.75
                                                target:self
                                              selector:@selector(startOver:)
                                              userInfo:nil 
                                               repeats:NO];
    }
}

-(void)startOver:(NSTimer*)timer2
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" 
                                                         bundle:nil];
    UIViewController *mainVC = [storyboard instantiateViewControllerWithIdentifier:@"end"];
    [self presentViewController:mainVC 
                       animated:NO
                     completion:nil];
}

+(NSString*)randomChallenge:(NSString*)string
{
    NSInteger challengeNumber;
    if (difficulty) {
        challengeNumber = 17;
    }
    else {
        challengeNumber = 11;
    }
    NSString *challenge;
    NSInteger randNum=arc4random()%challengeNumber;
    //randNum=20;
    switch (randNum) {
        case 0:
            challenge=@"PushMe";
            break;
        case 1:
            challenge=@"Slide";
            break;
        case 2:
            challenge=@"SmallButton";
            break;
        case 3:
            challenge=@"TripleSwitch";
            break;
        case 4:
            challenge=@"Hold";
            break;
        case 5:
            challenge=@"Enlarge";
            break;
        case 6:
            challenge=@"Wait";
            break;
        case 7:
            challenge=@"CatchIt";
            break;
        case 8:
            challenge=@"SelectCorrect";
            break;
        case 9:
            challenge=@"Rotate";
            break;
        case 10:
            challenge=@"Shake";
            break;
        case 11:
            challenge=@"HardHold";
            break;
        case 12:
            challenge=@"HardCatchIt";
            break;
        case 13:
            challenge=@"HardSelectCorrect";
            break;
        case 14:
            challenge=@"HardPushMe";
            break;
        case 15:
            challenge=@"HardSlide";
            break;
        /*case 16:
            challenge=@"Tilt";
            break;*/
        default:
            challenge=@"PushMe";
            break;
    }
    return challenge;
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
    pointLabel.text=[NSString stringWithFormat:@"Points: %i", points];
    timeLabel.text=[NSString stringWithFormat:@"Time: %i", timeLeft/1000];
    [timer invalidate];
    timer = nil;
    timer = [NSTimer scheduledTimerWithTimeInterval:.001
                                             target:self
                                           selector:@selector(timeDec:)
                                           userInfo:nil 
                                            repeats:YES];
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
