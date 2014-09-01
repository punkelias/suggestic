//
//  searchView.m
//  suggestic
//
//  Created by Elias on 27/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "searchView.h"

@interface searchView ()

@end

@implementation searchView

@synthesize pamperMeTable, bestForYouTable, budgetTable, favoritesTable, addFriendLabel, pamperMeButton, bestForYouButton, budgetButton, favoritesButton, socialView, tablesView, buttonsScroll, tablesContainer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	addFriendLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
	pamperMeButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:16];
	bestForYouButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:16];
	budgetButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:16];
	favoritesButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:16];
	
	favoritesTable.dataSource = self;
	favoritesTable.delegate = self;
	pamperMeTable.dataSource = self;
	pamperMeTable.delegate = self;
	bestForYouTable.dataSource = self;
	bestForYouTable.delegate = self;
	budgetTable.dataSource = self;
	budgetTable.delegate = self;
	
	numCells = [NSMutableArray array];
	bigNumCells = [NSMutableArray array];
	
    for (int cv = 0; cv < 7; cv++) {
        [numCells addObject:[NSString stringWithFormat:@"th_%d", (cv%8)+1]];
        [bigNumCells addObject:[NSString stringWithFormat:@"big_%d", (cv%8)+1]];
    }
	
	[self changeTableTo:0];
    
    self.navigationController.navigationBar.hidden = YES;
	self.navigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	
	buttonsScroll.contentSize = CGSizeMake(450, buttonsScroll.contentSize.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [numCells count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"searchCell";
    searchCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (cell == nil) {
        cell = [[searchCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
	
	switch (indexPath.row) {
		case 0: {
			cell.foodName.text = @"Cereal";
			cell.restaurantName.text = @"IHOP";
		} break;
		case 1: {
			cell.foodName.text = @"Gluten free waffles";
			cell.restaurantName.text = @"Padem Cafe";
		} break;
		case 2: {
			cell.foodName.text = @"Eggs with black beans";
			cell.restaurantName.text = @"Savora";
		} break;
		case 3: {
			cell.foodName.text = @"Ranchman eggs";
			cell.restaurantName.text = @"Mexican House";
		} break;
		case 4: {
			cell.foodName.text = @"Cinnamon rolls";
			cell.restaurantName.text = @"Savage Garden";
		} break;
		case 5: {
			cell.foodName.text = @"Fruit";
			cell.restaurantName.text = @"All Fresh";
		} break;
		case 6: {
			cell.foodName.text = @"Granola bars";
			cell.restaurantName.text = @"Blue Coffee shop";
		} break;
		case 7: {
			cell.foodName.text = @"Gluten free pancakes";
			cell.restaurantName.text = @"Blue Lagoon";
		} break;
		case 8: {
			cell.foodName.text = @"Cereal";
			cell.restaurantName.text = @"IHOP";
		} break;
		case 9: {
			cell.foodName.text = @"Gluten free waffles";
			cell.restaurantName.text = @"Padem Cafe";
		} break;
		default:
			break;
	}
	
	cell.detailsButton.hidden = YES;
	cell.detailsButton.userInteractionEnabled = NO;
	
	if (selectedTableView == tableView && indexPath.row == selectedIndexPathRow) {
		cell.bigFoodImage.image = [UIImage imageNamed:[bigNumCells objectAtIndex:indexPath.row]];
		cell.bigFoodImage.hidden = NO;
		cell.foodImage.hidden = YES;
		
		cell.detailsButton.hidden = NO;
		cell.detailsButton.userInteractionEnabled = YES;
	} else {
		cell.foodImage.image = [UIImage imageNamed:[numCells objectAtIndex:indexPath.row]];
		cell.foodImage.hidden = NO;
		cell.bigFoodImage.hidden = YES;
		
		cell.detailsButton.hidden = YES;
		cell.detailsButton.userInteractionEnabled = NO;
	}
	
	cell.myView = self;
	
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.row == selectedIndexPathRow) {
		return 175;
	} else {
		return 88;
	}
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	selectedIndexPathRow = indexPath.row;
	
	[UIView animateWithDuration:0.25f
						  delay: 0.15f
						options: UIViewAnimationOptionCurveLinear
					 animations:^{
						 [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
						 
						 [tableView reloadData];
					 }
					 completion:nil];
	
	return indexPath;
}


-(IBAction)changeTable:(id)sender {
	[self changeTableTo:[sender tag]];
}

-(void)changeTableTo:(int)index {
	switch (index) {
		case 0: {
			pamperMeButton.alpha = 1;
			bestForYouButton.alpha = 0.5;
			budgetButton.alpha = 0.5;
			favoritesButton.alpha = 0.5;
			
			selectedTableView = pamperMeTable;
		} break;
		case 1: {
			pamperMeButton.alpha = 0.5;
			bestForYouButton.alpha = 1;
			budgetButton.alpha = 0.5;
			favoritesButton.alpha = 0.5;
			
			selectedTableView = bestForYouTable;
		} break;
		case 2: {
			pamperMeButton.alpha = 0.5;
			bestForYouButton.alpha = 0.5;
			budgetButton.alpha = 1;
			favoritesButton.alpha = 0.5;
			
			selectedTableView = budgetTable;
		} break;
		case 3: {
			pamperMeButton.alpha = 0.5;
			bestForYouButton.alpha = 0.5;
			budgetButton.alpha = 0.5;
			favoritesButton.alpha = 1;
			
			selectedTableView = favoritesTable;
		} break;
		default:
			break;
	}
	
	[UIView animateWithDuration:0.25f
						  delay: 0.15f
						options: UIViewAnimationOptionCurveLinear
					 animations:^{
						 buttonsScroll.frame = CGRectMake(-116*index, buttonsScroll.frame.origin.y, buttonsScroll.frame.size.width, buttonsScroll.frame.size.height);
						 tablesContainer.frame = CGRectMake(-320*index, tablesContainer.frame.origin.y, tablesContainer.frame.size.width, tablesContainer.frame.size.height);
					 }
					 completion:nil];
}

-(void)clickOnTable:(id)sender {
	UIButton * senderButton = sender;
	senderButton.hidden = YES;
	senderButton.userInteractionEnabled = NO;
	
	[UIView animateWithDuration:0.5f
						  delay: 0.15f
						options: UIViewAnimationOptionCurveLinear
					 animations:^{
						 socialView.frame = CGRectMake(socialView.frame.origin.x, socialView.frame.origin.y - 143, socialView.frame.size.width, socialView.frame.size.height);
						 tablesView.frame = CGRectMake(tablesView.frame.origin.x, 42, tablesView.frame.size.width, tablesView.frame.size.height + 143);
					 }
					 completion:nil];
	
	[selectedTableView reloadData];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
