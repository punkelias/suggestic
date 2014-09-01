//
//  likesView.h
//  suggestic
//
//  Created by Elias on 26/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "ViewController.h"

@interface likesView : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
	NSMutableArray * numCells;
}

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *instructionsLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *fadeLabel;
@property (weak, nonatomic) IBOutlet UIView *thankYouView;
@property (weak, nonatomic) IBOutlet UILabel *thankYouTitle;
@property (weak, nonatomic) IBOutlet UILabel *thankYouMessage;

-(void)likesCountReached;
-(IBAction)goBack:(id)sender;

@end
