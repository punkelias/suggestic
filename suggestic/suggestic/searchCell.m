//
//  searchCell.m
//  suggestic
//
//  Created by Elias on 27/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "searchCell.h"

@implementation searchCell

@synthesize foodImage, foodName, restaurantName, detailsButton;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		foodName.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
		restaurantName.font = [UIFont fontWithName:@"Roboto-Regular" size:13];
		detailsButton.hidden = YES;
		detailsButton.userInteractionEnabled = NO;
		NSLog(@"TEST");
    }
    return self;
}

-(void)initCell {
	
}

-(void)setMyFoodImage:(UIImage*)image {
	foodImage.image = image;
}

- (void)awakeFromNib
{
    // Initialization code
	foodName.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
	restaurantName.font = [UIFont fontWithName:@"Roboto-Regular" size:13];
	detailsButton.hidden = YES;
	detailsButton.userInteractionEnabled = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)zoomCell {
	detailsButton.hidden = NO;
	detailsButton.userInteractionEnabled = YES;
	foodImage.frame = CGRectMake(foodImage.frame.origin.x, foodImage.frame.origin.y, foodImage.frame.size.width, 175);
}

-(void)unzoomCell {
	detailsButton.hidden = YES;
	detailsButton.userInteractionEnabled = NO;
	foodImage.frame = CGRectMake(foodImage.frame.origin.x, foodImage.frame.origin.y, foodImage.frame.size.width, 88);
}

@end
