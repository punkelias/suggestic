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

@synthesize pamperMeTable, bestForYouTable, budgetTable, favoritesTable, addFriendLabel, pamperMeButton, bestForYouButton, budgetButton, favoritesButton, socialView, tablesView, buttonsScroll;

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
	cell.foodImage.image = [UIImage imageNamed:[numCells objectAtIndex:indexPath.row]];
	cell.bigFoodImage.image = [UIImage imageNamed:[bigNumCells objectAtIndex:indexPath.row]];
	[cell changeImageViewWith:[bigNumCells objectAtIndex:indexPath.row]];
	cell.bigFoodImage.hidden = YES;
//	cell.imageView.image = [UIImage imageNamed:[bigNumCells objectAtIndex:indexPath.row]];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (currentCell != nil) {
		if (indexPath.row == selectedIndexPathRow) {
			return 175;
		} else {
			return 88;
		}
	} else {
		return 88;
	}
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
	
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (currentCell != nil) {
		currentCell.makeItBig = NO;
		currentCell.foodImage.hidden = NO;
		currentCell.bigFoodImage.hidden = YES;
	}
	
	currentCell = (searchCell*)[tableView cellForRowAtIndexPath:indexPath];
	currentCell.foodImage.hidden = YES;
	currentCell.bigFoodImage.hidden = NO;
	NSLog(@"IMV %@, IMAGEN %@", currentCell.bigFoodImage, currentCell.bigFoodImage.image );
	
	selectedIndexPathRow = indexPath.row;
	
	tableView.frame = CGRectMake(tableView.frame.origin.x, tableView.frame.origin.y, tableView.frame.size.width, 488);
	
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
			
			[UIView animateWithDuration:0.25f
								  delay: 0.15f
								options: UIViewAnimationOptionCurveLinear
							 animations:^{
								 pamperMeTable.hidden = NO;
							 }
							 completion:nil];
			
			selectedTableView = pamperMeTable;
			pamperMeTable.userInteractionEnabled = YES;
			bestForYouTable.hidden = YES;
			bestForYouTable.userInteractionEnabled = NO;
			budgetTable.hidden = YES;
			budgetTable.userInteractionEnabled = NO;
			favoritesTable.hidden = YES;
			favoritesTable.userInteractionEnabled = NO;
		} break;
		case 1: {
			pamperMeButton.alpha = 0.5;
			bestForYouButton.alpha = 1;
			budgetButton.alpha = 0.5;
			favoritesButton.alpha = 0.5;
			
			[UIView animateWithDuration:0.25f
								  delay: 0.15f
								options: UIViewAnimationOptionCurveLinear
							 animations:^{
								 bestForYouTable.hidden = NO;
							 }
							 completion:nil];
			
			selectedTableView = bestForYouTable;
			pamperMeTable.hidden = YES;
			pamperMeTable.userInteractionEnabled = NO;
			bestForYouTable.userInteractionEnabled = YES;
			budgetTable.hidden = YES;
			budgetTable.userInteractionEnabled = NO;
			favoritesTable.hidden = YES;
			favoritesTable.userInteractionEnabled = NO;
		} break;
		case 2: {
			pamperMeButton.alpha = 0.5;
			bestForYouButton.alpha = 0.5;
			budgetButton.alpha = 1;
			favoritesButton.alpha = 0.5;
			
			[UIView animateWithDuration:0.25f
								  delay: 0.15f
								options: UIViewAnimationOptionCurveLinear
							 animations:^{
								 budgetTable.hidden = NO;
							 }
							 completion:nil];
			
			selectedTableView = budgetTable;
			pamperMeTable.hidden = YES;
			pamperMeTable.userInteractionEnabled = NO;
			bestForYouTable.hidden = YES;
			bestForYouTable.userInteractionEnabled = NO;
			budgetTable.userInteractionEnabled = YES;
			favoritesTable.hidden = YES;
			favoritesTable.userInteractionEnabled = NO;
		} break;
		case 3: {
			pamperMeButton.alpha = 0.5;
			bestForYouButton.alpha = 0.5;
			budgetButton.alpha = 0.5;
			favoritesButton.alpha = 1;
			
			[UIView animateWithDuration:0.25f
								  delay: 0.15f
								options: UIViewAnimationOptionCurveLinear
							 animations:^{
								 favoritesTable.hidden = NO;
							 }
							 completion:nil];
			
			selectedTableView = favoritesTable;
			pamperMeTable.hidden = YES;
			pamperMeTable.userInteractionEnabled = NO;
			bestForYouTable.hidden = YES;
			bestForYouTable.userInteractionEnabled = NO;
			budgetTable.hidden = YES;
			budgetTable.userInteractionEnabled = NO;
			favoritesTable.userInteractionEnabled = YES;
		} break;
		default:
			break;
	}
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
					 completion:^(BOOL finished){
						 [UIView animateWithDuration:0.25f
										  animations:^{
											  pamperMeTable.frame = CGRectMake(pamperMeTable.frame.origin.x, pamperMeTable.frame.origin.y, pamperMeTable.frame.size.width, pamperMeTable.frame.size.height + 143);
											  bestForYouTable.frame = CGRectMake(bestForYouTable.frame.origin.x, bestForYouTable.frame.origin.y, bestForYouTable.frame.size.width, bestForYouTable.frame.size.height + 143);
											  budgetTable.frame = CGRectMake(budgetTable.frame.origin.x, budgetTable.frame.origin.y, budgetTable.frame.size.width, budgetTable.frame.size.height + 143);
											  favoritesTable.frame = CGRectMake(favoritesTable.frame.origin.x, favoritesTable.frame.origin.y, favoritesTable.frame.size.width, favoritesTable.frame.size.height + 143);
										  }
										  completion:nil];
					 }];
	
	[selectedTableView reloadData];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
