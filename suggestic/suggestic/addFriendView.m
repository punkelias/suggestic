//
//  addFriendView.m
//  suggestic
//
//  Created by Elias on 07/09/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "addFriendView.h"
#import "friendCell.h"
#import "searchView.h"

@interface addFriendView ()

@end

@implementation addFriendView

@synthesize messageLabel, friendsTable, doneButton;

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
	friendsTable.dataSource = self;
	friendsTable.delegate = self;
	messageLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:18];
	
	doneButton.hidden = YES;
	doneButton.userInteractionEnabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"friendCell";
    friendCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (cell == nil) {
        cell = [[friendCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
	
	switch (indexPath.row) {
		case 0: {
			cell.nameLabel.text = @"Robert Benson";
			cell.pohotImage.image = [UIImage imageNamed:@"facebook_male"];
			cell.logoImage.hidden = YES;
		} break;
		case 1: {
			cell.nameLabel.text = @"Haley Dunphy";
			cell.pohotImage.image = [UIImage imageNamed:@"facebook_female"];
		} break;
		case 2: {
			cell.nameLabel.text = @"Jon Ham";
			cell.pohotImage.image = [UIImage imageNamed:@"facebook_male"];
			cell.logoImage.hidden = YES;
		} break;
		case 3: {
			cell.nameLabel.text = @"Robert Benson";
			cell.pohotImage.image = [UIImage imageNamed:@"facebook_male"];
		} break;
		case 4: {
			cell.nameLabel.text = @"Robert Benson";
			cell.pohotImage.image = [UIImage imageNamed:@"facebook_male"];
		} break;
		case 5: {
			cell.nameLabel.text = @"Haley Dunphy";
			cell.pohotImage.image = [UIImage imageNamed:@"facebook_female"];
			cell.logoImage.hidden = YES;
		} break;
		case 6: {
			cell.nameLabel.text = @"Jon Ham";
			cell.pohotImage.image = [UIImage imageNamed:@"facebook_male"];
			cell.logoImage.hidden = YES;
		} break;
		default:
			break;
	}
	
    return cell;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	doneButton.userInteractionEnabled = YES;
	doneButton.hidden = NO;
	
	return indexPath;
}

-(void)friendsSelected:(id)sender {
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
	
    searchView * otherViewController = [storyboard instantiateViewControllerWithIdentifier:@"searchView"];
	otherViewController.friendsChosen = [[friendsTable indexPathsForSelectedRows] count];
	[self.navigationController pushViewController:otherViewController animated:YES];
}

@end
