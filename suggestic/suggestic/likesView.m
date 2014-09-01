//
//  likesView.m
//  suggestic
//
//  Created by Elias on 26/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "likesView.h"
#import "scoreCell.h"

@interface likesView ()

@end

@implementation likesView

@synthesize titleLabel, instructionsLabel, fadeLabel, thankYouTitle, thankYouMessage, thankYouView, collectionView;

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
	titleLabel.font = [UIFont fontWithName:@"Roboto-Bold" size:18];
	instructionsLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
	thankYouTitle.font = [UIFont fontWithName:@"Roboto-Bold" size:18];
	thankYouMessage.font = [UIFont fontWithName:@"Roboto-Regular" size:14];
	
	numCells = [NSMutableArray array];
	
    for (int cv = 0; cv < 20; cv++) {
        [numCells addObject:[NSString stringWithFormat:@"CARDS/rate food/%d", (cv%8)+1]];
    }
	
	fadeLabel.hidden = YES;
	thankYouView.hidden = YES;
	
	collectionView.delegate = self;
	collectionView.dataSource = self;
	
	[collectionView registerNib:[UINib nibWithNibName:@"scoreCell" bundle:nil] forCellWithReuseIdentifier:@"scoreCell"];
    
    self.navigationController.navigationBar.hidden = YES;
	self.navigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)theCollectionView numberOfItemsInSection:(NSInteger)theSectionIndex {
    return 20;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
    scoreCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"scoreCell" forIndexPath:indexPath];
	
	cell.imageview.image = [UIImage imageNamed:[numCells objectAtIndex:indexPath.row]];
	cell.tableview.hidden = YES;
	cell.tableview.userInteractionEnabled = NO;
	cell.myView = self;
	[cell initCell];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    scoreCell * cell = (scoreCell*)[collectionView cellForItemAtIndexPath:indexPath];
	cell.tableview.hidden = NO;
	cell.tableview.userInteractionEnabled = YES;
}

-(void)likesCountReached {
	fadeLabel.hidden = NO;
	thankYouView.hidden = NO;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)goBack:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

@end
