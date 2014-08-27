//
//  scoreCell.h
//  suggestic
//
//  Created by Elias on 26/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "ViewController.h"
#import "likesView.h"

@interface scoreCell : UICollectionViewCell <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) int myIndexPath;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) likesView * myView;

-(void)initCell;

@end
