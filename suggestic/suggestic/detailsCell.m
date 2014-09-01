//
//  detailsCell.m
//  suggestic
//
//  Created by Elias on 31/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "detailsCell.h"

@implementation detailsCell

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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
