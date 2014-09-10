//
//  rateCell.h
//  suggestic
//
//  Created by Elias on 09/09/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "rateView.h"

@interface rateCell : UICollectionViewCell <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) int myIndexPath;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) rateView * myView;

-(void)initCell;

@end
