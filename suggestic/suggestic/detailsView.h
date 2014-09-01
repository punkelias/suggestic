//
//  detailsView.h
//  suggestic
//
//  Created by Elias on 30/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailsView : UIViewController <UIGestureRecognizerDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
	int selectedIndex;
}

@property (weak, nonatomic) IBOutlet UIScrollView *buttonsScroll;
@property (weak, nonatomic) IBOutlet UIButton *dessertsButton;
@property (weak, nonatomic) IBOutlet UIButton *saladsButton;
@property (weak, nonatomic) IBOutlet UIButton *mainCourseButton;
@property (weak, nonatomic) IBOutlet UIButton *soupsButton;
@property (weak, nonatomic) IBOutlet UIButton *drinksButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *adressLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UIButton *reservationButton;
@property (weak, nonatomic) IBOutlet UIButton *viewMenuButton;
@property (weak, nonatomic) IBOutlet UICollectionView *dessertsCollection;
@property (weak, nonatomic) IBOutlet UICollectionView *saladsCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *mainCourseCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *soupsCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *drinksCollectionView;
@property (weak, nonatomic) IBOutlet UIScrollView *collectionsContainer;

-(IBAction)changeTable:(id)sender;
-(IBAction)goBack:(id)sender;

@end
