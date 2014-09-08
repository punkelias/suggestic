//
//  friendCell.m
//  suggestic
//
//  Created by Elias on 07/09/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "friendCell.h"

@implementation friendCell

@synthesize nameLabel, pohotImage, logoImage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		nameLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
	nameLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
