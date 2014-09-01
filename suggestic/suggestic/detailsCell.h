//
//  detailsCell.h
//  suggestic
//
//  Created by Elias on 31/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailsCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *foodName;
@property (weak, nonatomic) IBOutlet UILabel *mayContainLabel;
@property (weak, nonatomic) IBOutlet UILabel *ingredient1;
@property (weak, nonatomic) IBOutlet UILabel *ingredient2;
@property (weak, nonatomic) IBOutlet UILabel *ingredient3;
@property (weak, nonatomic) IBOutlet UILabel *ingredient4;

@property (nonatomic) int indexPath;

-(void)initGestures;

-(void)initCell;

@end
