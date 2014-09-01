//
//  detailsCell.m
//  suggestic
//
//  Created by Elias on 31/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "detailsCell.h"
#import "AppDelegate.h"

@implementation detailsCell {
    AppDelegate *delegate;
}

@synthesize imageView, foodName, mayContainLabel, ingredient1, ingredient2, ingredient3, ingredient4;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)initCell {
	foodName.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
	mayContainLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:11];
	ingredient1.font = [UIFont fontWithName:@"Roboto-Regular" size:13];
	ingredient2.font = [UIFont fontWithName:@"Roboto-Regular" size:13];
	ingredient3.font = [UIFont fontWithName:@"Roboto-Regular" size:13];
	ingredient4.font = [UIFont fontWithName:@"Roboto-Regular" size:13];
}

-(void)initGestures
{
	foodName.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
	mayContainLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:11];
	ingredient1.font = [UIFont fontWithName:@"Roboto-Regular" size:13];
	ingredient2.font = [UIFont fontWithName:@"Roboto-Regular" size:13];
	ingredient3.font = [UIFont fontWithName:@"Roboto-Regular" size:13];
	ingredient4.font = [UIFont fontWithName:@"Roboto-Regular" size:13];
	self.backgroundColor = [UIColor grayColor];
	
    delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.userInteractionEnabled = YES;
    
    UILongPressGestureRecognizer *pressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressDetected:)];
    pressRecognizer.numberOfTapsRequired = 0;
    pressRecognizer.minimumPressDuration = 0.1;
    [self addGestureRecognizer:pressRecognizer];
}

- (void)pressDetected:(UILongPressGestureRecognizer *)pressRecognizer
{
    if (pressRecognizer.state == UIGestureRecognizerStateBegan) {
        NSLog(@"<<<<<<<<<< Tab en Cell");
        delegate.GestureDetect = YES;
        delegate.detailsFrame = self;
		delegate.cellImage = imageView.image;
    }
    if (pressRecognizer.state == UIGestureRecognizerStateEnded) {
        delegate.GestureDetect = NO;
		delegate.cellImage = nil;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
