//
//  searchView.m
//  suggestic
//
//  Created by Elias on 27/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "searchView.h"
#import "searchCell.h"

@interface searchView ()

@end

@implementation searchView

@synthesize pamperMeTable, bestForYouTable, budgetTable, favoritesTable, addFriendLabel, pamperMeButton, bestForYouButton, budgetButton, favoritesButton;

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
	
	if (indexPath.row == selectedIndexPath.row) {
		[cell zoomCell];
	} else {
		[cell unzoomCell];
	}
	
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (selectedIndexPath.row == indexPath.row) {
		return 175;
	} else {
		return 88;
	}
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	searchCell * oldCell = (searchCell*)[selectedTableView cellForRowAtIndexPath:selectedIndexPath];
	
	oldCell.foodImage.image = [UIImage imageNamed:[numCells objectAtIndex:indexPath.row]];
	oldCell.detailsButton.hidden = YES;
	oldCell.detailsButton.userInteractionEnabled = NO;
	oldCell.foodImage.frame = CGRectMake(oldCell.foodImage.frame.origin.x, oldCell.foodImage.frame.origin.y, oldCell.foodImage.frame.size.width, 88);
	
	[oldCell unzoomCell];
	
	selectedIndexPath = indexPath;
	
	[selectedTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
	searchCell * cell = (searchCell*)[selectedTableView cellForRowAtIndexPath:indexPath];
	
	cell.foodImage.image = [UIImage imageNamed:[bigNumCells objectAtIndex:indexPath.row]];
	
	cell.foodImage.frame = CGRectMake(cell.foodImage.frame.origin.x, cell.foodImage.frame.origin.y, cell.foodImage.frame.size.width, 175);
				
	[cell zoomCell];
	
	[selectedTableView reloadData];
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
			pamperMeTable.hidden = NO;
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
			
			selectedTableView = bestForYouTable;
			pamperMeTable.hidden = YES;
			pamperMeTable.userInteractionEnabled = NO;
			bestForYouTable.hidden = NO;
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
			
			selectedTableView = budgetTable;
			pamperMeTable.hidden = YES;
			pamperMeTable.userInteractionEnabled = NO;
			bestForYouTable.hidden = YES;
			bestForYouTable.userInteractionEnabled = NO;
			budgetTable.hidden = NO;
			budgetTable.userInteractionEnabled = YES;
			favoritesTable.hidden = YES;
			favoritesTable.userInteractionEnabled = NO;
		} break;
		case 3: {
			pamperMeButton.alpha = 0.5;
			bestForYouButton.alpha = 0.5;
			budgetButton.alpha = 0.5;
			favoritesButton.alpha = 1;
			
			selectedTableView = favoritesTable;
			pamperMeTable.hidden = YES;
			pamperMeTable.userInteractionEnabled = NO;
			bestForYouTable.hidden = YES;
			bestForYouTable.userInteractionEnabled = NO;
			budgetTable.hidden = YES;
			budgetTable.userInteractionEnabled = NO;
			favoritesTable.hidden = NO;
			favoritesTable.userInteractionEnabled = YES;
		} break;
		default:
			break;
	}
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
