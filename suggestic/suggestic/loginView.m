//
//  loginView.m
//  suggestic
//
//  Created by Elias on 23/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "loginView.h"

@implementation loginView

@synthesize nameField, emailField, passwordField, repeatField, stepButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.hidden = YES;
	
	[stepButton addTarget:self action:@selector(nextStep:) forControlEvents:UIControlEventTouchUpInside];
	
	nameField.font = [UIFont fontWithName:@"Roboto-Regular" size:17];
	emailField.font = [UIFont fontWithName:@"Roboto-Regular" size:17];
	passwordField.font = [UIFont fontWithName:@"Roboto-Regular" size:17];
	repeatField.font = [UIFont fontWithName:@"Roboto-Regular" size:17];
	
	nameField.delegate = self;
	emailField.delegate = self;
	passwordField.delegate = self;
	repeatField.delegate = self;
	
	passwordField.secureTextEntry = YES;
	repeatField.secureTextEntry = YES;
    
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

-(void)nextStep:(id)sender {
	[stepButton removeTarget:self action:@selector(nextStep:) forControlEvents:UIControlEventTouchUpInside];
	[stepButton addTarget:self action:@selector(finishStep:) forControlEvents:UIControlEventTouchUpInside];
	
	[UIView animateWithDuration:0.25f
					 animations:^{
						 nameField.frame = CGRectMake(-236, nameField.frame.origin.y, nameField.frame.size.width, nameField.frame.size.height);
					 }
					 completion:^(BOOL finished){
						 [UIView animateWithDuration:0.25f
										  animations:^{
											  passwordField.frame = CGRectMake(42, passwordField.frame.origin.y, passwordField.frame.size.width, passwordField.frame.size.height);
										  }
										  completion:nil];
					 }];
	
	[UIView animateWithDuration:0.25f
						  delay: 0.15f
						options: UIViewAnimationOptionCurveLinear
					 animations:^{
						 emailField.frame = CGRectMake(-236, emailField.frame.origin.y, emailField.frame.size.width, emailField.frame.size.height);
					 }
					 completion:^(BOOL finished){
						 [UIView animateWithDuration:0.25f
										  animations:^{
											  repeatField.frame = CGRectMake(42, repeatField.frame.origin.y, repeatField.frame.size.width, repeatField.frame.size.height);
											  
											  [stepButton setBackgroundImage:[UIImage imageNamed:@"ok_btn_inicio"] forState:UIControlStateNormal];
										  }
										  completion:nil];
					 }];
}

-(void)finishStep:(id)sender {
	UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
	
	UIViewController * otherView = [storyboard instantiateViewControllerWithIdentifier:@"Restrictions"];
    
	//[self presentViewController:otherView animated:YES completion:nil];
	[self.navigationController pushViewController:otherView animated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
	NSInteger nextTag = textField.tag + 1;
	UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
	
	if (textField.tag == 0 || textField.tag == 2) {
		[nextResponder becomeFirstResponder];
	} else {
		[textField resignFirstResponder];
	}
	return NO;
}

@end
