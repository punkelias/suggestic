//
//  viewMenuView.h
//  suggestic
//
//  Created by Elias on 01/09/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface viewMenuView : UIViewController <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , UIGestureRecognizerDelegate> {
	int selectedIndex;
}

@property (weak, nonatomic) IBOutlet UICollectionView *allCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *dessertsCollection;
@property (weak, nonatomic) IBOutlet UICollectionView *saladsCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *mainCourseCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *soupsCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *drinksCollectionView;
@property (weak, nonatomic) IBOutlet UIScrollView *collectionsContainer;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *buttonsScroll;
@property (weak, nonatomic) IBOutlet UIButton *dessertsButton;
@property (weak, nonatomic) IBOutlet UIButton *saladsButton;
@property (weak, nonatomic) IBOutlet UIButton *mainCourseButton;
@property (weak, nonatomic) IBOutlet UIButton *soupsButton;
@property (weak, nonatomic) IBOutlet UIButton *drinksButton;
@property (weak, nonatomic) IBOutlet UILabel *warningLabel;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UILabel *fadeLabel;
@property (weak, nonatomic) IBOutlet UIView *savedView;
@property (weak, nonatomic) IBOutlet UILabel *enjoyLabel;
@property (weak, nonatomic) IBOutlet UILabel *savedSelectionLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

-(IBAction)goBack:(id)sender;
-(IBAction)displaySave:(id)sender;
-(IBAction)changeTable:(id)sender;

@end
