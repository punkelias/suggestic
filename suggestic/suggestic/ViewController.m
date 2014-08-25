//
//  ViewController.m
//  suggestic
//
//  Created by Elias on 21/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize signInLael, signUpButton, facebookButton, twitterButton, linkedInButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	signInLael.font = [UIFont fontWithName:@"Roboto-Regular" size:17];
	signUpButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Bold" size:17];
	facebookButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Bold" size:17];
	twitterButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Bold" size:17];
	linkedInButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Bold" size:17];
    
    self.navigationController.navigationBar.hidden = YES;
	self.navigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
