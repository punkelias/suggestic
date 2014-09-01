//
//  searchCell.m
//  suggestic
//
//  Created by Elias on 27/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "searchCell.h"

@implementation searchCell

@synthesize foodImage, foodName, restaurantName, detailsButton, makeItBig, bigFoodImage, myView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		foodName.font = [UIFont fontWithName:@"Roboto-Bold" size:15];
		restaurantName.font = [UIFont fontWithName:@"Roboto-Regular" size:13];
		detailsButton.hidden = YES;
		detailsButton.userInteractionEnabled = NO;
		makeItBig = NO;
		bigFoodImage.hidden = YES;
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
	foodName.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
	restaurantName.font = [UIFont fontWithName:@"Roboto-Regular" size:13];
	detailsButton.hidden = YES;
	detailsButton.userInteractionEnabled = NO;
	makeItBig = NO;
	bigFoodImage.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)changeImageViewWith:(NSString*)imageName {
	
	bigFoodImage.image = [UIImage imageNamed:imageName];
}

-(void)goToDetails {
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
	
    UIViewController * otherViewController = [storyboard instantiateViewControllerWithIdentifier:@"detailsView"];
	[myView.navigationController pushViewController:otherViewController animated:YES];
}

@end
