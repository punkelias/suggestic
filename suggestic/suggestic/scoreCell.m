//
//  scoreCell.m
//  suggestic
//
//  Created by Elias on 26/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "scoreCell.h"
#import "AppDelegate.h"

@interface scoreCell ()
{
    AppDelegate *delegate;
}

@end

@implementation scoreCell

@synthesize imageview, tableview, myView, myIndexPath;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)initCell {
	delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	tableview.delegate = self;
	tableview.dataSource = self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
	
	switch (indexPath.row) {
		case 0:
			cell.textLabel.text = @"I love it";
			break;
		case 1:
			cell.textLabel.text = @"I like it";
			break;
		case 2:
			cell.textLabel.text = @"Mehh";
			break;
		case 3:
			cell.textLabel.text = @"I didn't like it";
			break;
			
		default:
			break;
	}
	
	cell.backgroundColor = [UIColor clearColor];
	
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 55;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
	delegate.likesCount++;
	
	if (delegate.likesCount >= 10) {
		[myView likesCountReached];
	}
}

@end
