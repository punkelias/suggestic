//
//  restrictionsView.h
//  suggestic
//
//  Created by Elias on 23/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "ViewController.h"

@interface restrictionsView : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *logoImage;
@property (weak, nonatomic) IBOutlet UILabel *topBar;
@property (weak, nonatomic) IBOutlet UICollectionView *allCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *restrictedCollectionView;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UILabel *restrictionsLabel;
@property (weak, nonatomic) IBOutlet UILabel *instructionsLabel;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end
