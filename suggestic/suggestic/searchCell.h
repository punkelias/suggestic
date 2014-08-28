//
//  searchCell.h
//  suggestic
//
//  Created by Elias on 27/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface searchCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *foodName;
@property (weak, nonatomic) IBOutlet UILabel *restaurantName;
@property (weak, nonatomic) IBOutlet UIImageView *foodImage;
@property (weak, nonatomic) IBOutlet UIImageView *bigFoodImage;
@property (weak, nonatomic) IBOutlet UIButton *detailsButton;
@property (nonatomic) bool makeItBig;

-(void)changeImageViewWith:(NSString*)imageName;

@end
