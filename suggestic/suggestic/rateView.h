//
//  rateView.h
//  suggestic
//
//  Created by Elias on 09/09/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface rateView : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
	NSMutableArray * numCells;
}

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
