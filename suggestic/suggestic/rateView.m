//
//  rateView.m
//  suggestic
//
//  Created by Elias on 09/09/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "rateView.h"
#import "rateCell.h"

@interface rateView ()

@end

@implementation rateView

@synthesize collectionView, titleLabel;

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
	
	numCells = [NSMutableArray array];
	
    for (int cv = 0; cv < 20; cv++) {
        [numCells addObject:[NSString stringWithFormat:@"CARDS/rate food/%d", (cv%8)+1]];
    }
	
	collectionView.delegate = self;
	collectionView.dataSource = self;
    
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
	
    rateCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"rateCell" forIndexPath:indexPath];
	
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
    rateCell * cell = (rateCell*)[collectionView cellForItemAtIndexPath:indexPath];
	cell.tableview.hidden = NO;
	cell.tableview.userInteractionEnabled = YES;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
