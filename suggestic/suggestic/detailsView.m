//
//  detailsView.m
//  suggestic
//
//  Created by Elias on 30/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "detailsView.h"
#import "detailsCell.h"
#import <stdlib.h>

@interface detailsView ()

@end

@implementation detailsView

@synthesize buttonsScroll, dessertsButton, saladsButton, mainCourseButton, soupsButton, drinksButton, nameLabel, adressLabel, phoneLabel, reservationButton, viewMenuButton, dessertsCollection, saladsCollectionView, collectionsContainer, mainCourseCollectionView, soupsCollectionView, drinksCollectionView, titleLabel;

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
	dessertsButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:18];
	saladsButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:18];
	mainCourseButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:18];
	soupsButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:18];
	drinksButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:18];
	reservationButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:14];
	viewMenuButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:14];
	nameLabel.font = [UIFont fontWithName:@"Roboto-Bold" size:18];
	adressLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
	phoneLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
	titleLabel.font = [UIFont fontWithName:@"Roboto-Bold" size:18];
	
	dessertsCollection.delegate = self;
	dessertsCollection.dataSource = self;
	saladsCollectionView.delegate = self;
	saladsCollectionView.dataSource = self;
	mainCourseCollectionView.delegate = self;
	mainCourseCollectionView.dataSource = self;
	drinksCollectionView.dataSource = self;
	soupsCollectionView.dataSource = self;
	drinksCollectionView.delegate = self;
	soupsCollectionView.delegate = self;
    
	selectedIndex = 0;
	[self changeTableTo:selectedIndex];
	
	UISwipeGestureRecognizer *leftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeRecognizer:)];
    leftRecognizer.direction=UISwipeGestureRecognizerDirectionLeft;
    leftRecognizer.numberOfTouchesRequired = 1;
	leftRecognizer.cancelsTouchesInView = NO;
    leftRecognizer.delegate = self;
    [buttonsScroll addGestureRecognizer:leftRecognizer];
	
	UISwipeGestureRecognizer *rightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(SwipeRecognizer:)];
    rightRecognizer.direction=UISwipeGestureRecognizerDirectionRight;
    rightRecognizer.numberOfTouchesRequired = 1;
	rightRecognizer.cancelsTouchesInView = NO;
    rightRecognizer.delegate = self;
    [buttonsScroll addGestureRecognizer:rightRecognizer];
	
    self.navigationController.navigationBar.hidden = YES;
	self.navigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
}

- (void) SwipeRecognizer:(UISwipeGestureRecognizer *)sender {
    if ( sender.direction == UISwipeGestureRecognizerDirectionLeft ){
        if (selectedIndex < 4) {
			[self changeTableTo:selectedIndex+1];
		}
    }
    if ( sender.direction == UISwipeGestureRecognizerDirectionRight ){
        if (selectedIndex > 0) {
			[self changeTableTo:selectedIndex-1];
		}
    }
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[UIView class]])
    {
        return YES;
    }
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)goBack:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)collectionView:(UICollectionView *)theCollectionView numberOfItemsInSection:(NSInteger)theSectionIndex {
    return 4;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
    detailsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"detailsCell" forIndexPath:indexPath];
	int rand = arc4random() % 8;
	
	switch (rand) {
		case 0: {
			cell.foodName.text = @"Cereal";
			cell.ingredient1.text = @"Milk";
			cell.ingredient2.text = @"Berries";
			cell.ingredient3.text = @"";
			cell.ingredient4.text = @"";
			cell.ingredient1.hidden = NO;
			cell.ingredient2.hidden = NO;
			cell.ingredient3.hidden = YES;
			cell.ingredient4.hidden = YES;
		} break;
		case 1: {
			cell.foodName.text = @"Gluten free waffles";
			cell.ingredient1.text = @"Milk";
			cell.ingredient2.text = @"Honey";
			cell.ingredient3.text = @"Hen's egg";
			cell.ingredient4.text = @"";
			cell.ingredient1.hidden = NO;
			cell.ingredient2.hidden = NO;
			cell.ingredient3.hidden = NO;
			cell.ingredient4.hidden = YES;
		} break;
		case 2: {
			cell.foodName.text = @"Eggs with black beans";
			cell.ingredient1.text = @"Hen's egg";
			cell.ingredient2.text = @"";
			cell.ingredient3.text = @"";
			cell.ingredient4.text = @"";
			cell.ingredient1.hidden = NO;
			cell.ingredient2.hidden = YES;
			cell.ingredient3.hidden = YES;
			cell.ingredient4.hidden = YES;
		} break;
		case 3: {
			cell.foodName.text = @"Ranchman eggs";
			cell.ingredient1.text = @"Hen's egg";
			cell.ingredient2.text = @"";
			cell.ingredient3.text = @"";
			cell.ingredient4.text = @"";
			cell.ingredient1.hidden = NO;
			cell.ingredient2.hidden = YES;
			cell.ingredient3.hidden = YES;
			cell.ingredient4.hidden = YES;
		} break;
		case 4: {
			cell.foodName.text = @"Cinnamon rolls";
			cell.ingredient1.text = @"Hen's egg";
			cell.ingredient2.text = @"Milk";
			cell.ingredient3.text = @"";
			cell.ingredient4.text = @"";
			cell.ingredient1.hidden = NO;
			cell.ingredient2.hidden = NO;
			cell.ingredient3.hidden = YES;
			cell.ingredient4.hidden = YES;
		} break;
		case 5: {
			cell.foodName.text = @"Fruit";
			cell.ingredient1.text = @"Granola";
			cell.ingredient2.text = @"Yogurt";
			cell.ingredient3.text = @"Berries";
			cell.ingredient4.text = @"";
			cell.ingredient1.hidden = NO;
			cell.ingredient2.hidden = NO;
			cell.ingredient3.hidden = NO;
			cell.ingredient4.hidden = YES;
		} break;
		case 6: {
			cell.foodName.text = @"Granola bars";
			cell.ingredient1.text = @"Granola";
			cell.ingredient2.text = @"Hen's egg";
			cell.ingredient3.text = @"Honey";
			cell.ingredient4.text = @"";
			cell.ingredient1.hidden = NO;
			cell.ingredient2.hidden = NO;
			cell.ingredient3.hidden = NO;
			cell.ingredient4.hidden = YES;
		} break;
		case 7: {
			cell.foodName.text = @"Gluten free pancakes";
			cell.ingredient1.text = @"Milk";
			cell.ingredient2.text = @"Honey";
			cell.ingredient3.text = @"Hen's egg";
			cell.ingredient4.text = @"";
			cell.ingredient1.hidden = NO;
			cell.ingredient2.hidden = NO;
			cell.ingredient3.hidden = NO;
			cell.ingredient4.hidden = YES;
		} break;
		default:
			break;
	}
	
	cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"details_%d", rand + 1]];
	[cell initCell];
    
    return cell;
}

-(IBAction)changeTable:(id)sender {
	[self changeTableTo:[sender tag]];
}

-(void)changeTableTo:(int)index {
	if (index < 0) {
		index = 0;
	}
	
	if (index > 4) {
		index = 4;
	}
	
	selectedIndex = index;
	
	switch (index) {
		case 0: {
			dessertsButton.alpha = 1;
			saladsButton.alpha = 0.5;
			mainCourseButton.alpha = 0.5;
			soupsButton.alpha = 0.5;
			drinksButton.alpha = 0.5;
		} break;
		case 1: {
			dessertsButton.alpha = 0.5;
			saladsButton.alpha = 1;
			mainCourseButton.alpha = 0.5;
			soupsButton.alpha = 0.5;
			drinksButton.alpha = 0.5;
		} break;
		case 2: {
			dessertsButton.alpha = 0.5;
			saladsButton.alpha = 0.5;
			mainCourseButton.alpha = 1;
			soupsButton.alpha = 0.5;
			drinksButton.alpha = 0.5;
		} break;
		case 3: {
			dessertsButton.alpha = 0.5;
			saladsButton.alpha = 0.5;
			mainCourseButton.alpha = 0.5;
			soupsButton.alpha = 1;
			drinksButton.alpha = 0.5;
		} break;
		case 4: {
			dessertsButton.alpha = 0.5;
			saladsButton.alpha = 0.5;
			mainCourseButton.alpha = 0.5;
			soupsButton.alpha = 0.5;
			drinksButton.alpha = 1;
		} break;
		default:
			break;
	}
	
	[UIView animateWithDuration:0.25f
						  delay: 0.15f
						options: UIViewAnimationOptionCurveLinear
					 animations:^{
						 buttonsScroll.frame = CGRectMake(-116*index, buttonsScroll.frame.origin.y, buttonsScroll.frame.size.width, buttonsScroll.frame.size.height);
						 collectionsContainer.frame = CGRectMake(-320*index, collectionsContainer.frame.origin.y, collectionsContainer.frame.size.width, collectionsContainer.frame.size.height);
					 }
					 completion:nil];
}

@end
