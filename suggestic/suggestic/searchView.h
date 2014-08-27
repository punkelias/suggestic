//
//  searchView.h
//  suggestic
//
//  Created by Elias on 27/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "ViewController.h"

@interface searchView : UIViewController <UITableViewDataSource, UITableViewDelegate> {
	NSMutableArray * numCells;
	NSMutableArray * bigNumCells;
	UITableView * selectedTableView;
	NSIndexPath * selectedIndexPath;
}

@property (weak, nonatomic) IBOutlet UITableView *favoritesTable;
@property (weak, nonatomic) IBOutlet UITableView *pamperMeTable;
@property (weak, nonatomic) IBOutlet UITableView *budgetTable;
@property (weak, nonatomic) IBOutlet UITableView *bestForYouTable;
@property (weak, nonatomic) IBOutlet UILabel *addFriendLabel;
@property (weak, nonatomic) IBOutlet UIButton *pamperMeButton;
@property (weak, nonatomic) IBOutlet UIButton *bestForYouButton;
@property (weak, nonatomic) IBOutlet UIButton *budgetButton;
@property (weak, nonatomic) IBOutlet UIButton *favoritesButton;

-(IBAction)changeTable:(id)sender;

@end
