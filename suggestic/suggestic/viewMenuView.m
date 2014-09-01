//
//  viewMenuView.m
//  suggestic
//
//  Created by Elias on 01/09/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "viewMenuView.h"
#import "detailsCell.h"
#import "AppDelegate.h"

@interface viewMenuView () {
	AppDelegate * delegate;
}

@property (nonatomic, retain) detailsCell *viewCell;
@property (nonatomic, retain) NSMutableArray *saladsCells;
@property (nonatomic, retain) NSMutableArray *dessertsCells;
@property (nonatomic, retain) NSMutableArray *mainCourseCells;
@property (nonatomic, retain) NSMutableArray *drinksCells;
@property (nonatomic, retain) NSMutableArray *soupsCells;
@property (nonatomic, retain) NSMutableArray *savedCells;
@property (nonatomic, retain) UICollectionView *selectedCollection;
@property (nonatomic) float initialPos;

@end

@implementation viewMenuView

@synthesize titleLabel, dessertsCollection, saladsCollectionView, mainCourseCollectionView, drinksCollectionView, soupsCollectionView, buttonsScroll, collectionsContainer, dessertsButton, saladsButton, mainCourseButton, drinksButton, soupsButton, subtitleLabel, saveButton, warningLabel, fadeLabel, savedView, savedSelectionLabel, enjoyLabel, messageLabel, allCollectionView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	if (!delegate || delegate == nil) {
		delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
	}
	
	dessertsButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:18];
	saladsButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:18];
	mainCourseButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:18];
	soupsButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:18];
	drinksButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:18];
	saveButton.titleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
	titleLabel.font = [UIFont fontWithName:@"Roboto-Bold" size:16];
	subtitleLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:12];
	warningLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:13];
	savedSelectionLabel.font = [UIFont fontWithName:@"Roboto-Bold" size:18];
	enjoyLabel.font = [UIFont fontWithName:@"Roboto-Bold" size:18];
	messageLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
	warningLabel.hidden = YES;
	saveButton.hidden = YES;
	saveButton.userInteractionEnabled = NO;
	
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
	allCollectionView.dataSource = self;
	allCollectionView.delegate = self;
	
    
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
	
	//Setup cell
    self.viewCell = [[detailsCell alloc] initWithFrame:CGRectMake(0, 0, 160, 233)];
	
	self.savedCells = [[NSMutableArray alloc] init];
	self.dessertsCells = [[NSMutableArray alloc] init];
	self.saladsCells = [[NSMutableArray alloc] init];
	self.mainCourseCells = [[NSMutableArray alloc] init];
	self.drinksCells = [[NSMutableArray alloc] init];
	self.soupsCells = [[NSMutableArray alloc] init];
	
	for (int i = 0; i < 4; i++) {
		int rand = arc4random() % 8;
		
		[self.dessertsCells addObject:[NSNumber numberWithInt:rand]];
	}
	
	for (int i = 0; i < 4; i++) {
		int rand = arc4random() % 8;
		
		[self.saladsCells addObject:[NSNumber numberWithInt:rand]];
	}
	
	for (int i = 0; i < 4; i++) {
		int rand = arc4random() % 8;
		
		[self.mainCourseCells addObject:[NSNumber numberWithInt:rand]];
	}
	
	for (int i = 0; i < 4; i++) {
		int rand = arc4random() % 8;
		
		[self.drinksCells addObject:[NSNumber numberWithInt:rand]];
	}
	
	for (int i = 0; i < 4; i++) {
		int rand = arc4random() % 8;
		
		[self.soupsCells addObject:[NSNumber numberWithInt:rand]];
	}
    
    self.view.userInteractionEnabled = YES;
	
	savedView.hidden = YES;
	fadeLabel.hidden = YES;
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
    [self.view addGestureRecognizer:panRecognizer];
    
    panRecognizer.delegate = self;
	
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

-(void)goBack:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	if (collectionView == dessertsCollection) {
		return [self.dessertsCells count];
	} else if (collectionView == saladsCollectionView) {
		return [self.saladsCells count];
	} else if (collectionView == mainCourseCollectionView) {
		return [self.mainCourseCells count];
	} else if (collectionView == drinksCollectionView) {
		return [self.drinksCells count];
	} else if (collectionView == soupsCollectionView) {
		return [self.soupsCells count];
	} else {
		return [self.savedCells count];
	}
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	
    detailsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"detailsCell" forIndexPath:indexPath];
	int index;
	
	if (collectionView == dessertsCollection) {
		index = [[self.dessertsCells objectAtIndex:indexPath.row] intValue];
	} else if (collectionView == saladsCollectionView) {
		index = [[self.saladsCells objectAtIndex:indexPath.row] intValue];
	} else if (collectionView == mainCourseCollectionView) {
		index = [[self.mainCourseCells objectAtIndex:indexPath.row] intValue];
	} else if (collectionView == drinksCollectionView) {
		index = [[self.drinksCells objectAtIndex:indexPath.row] intValue];
	} else if (collectionView == soupsCollectionView) {
		index = [[self.soupsCells objectAtIndex:indexPath.row] intValue];
	} else {
		index = [[self.savedCells objectAtIndex:indexPath.row] intValue];
	}
	
	switch (index) {
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
	
	cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"details_%d", index + 1]];
	[cell initGestures];
    
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
			self.selectedCollection = dessertsCollection;
			
			dessertsButton.alpha = 1;
			saladsButton.alpha = 0.5;
			mainCourseButton.alpha = 0.5;
			soupsButton.alpha = 0.5;
			drinksButton.alpha = 0.5;
		} break;
		case 1: {
			self.selectedCollection = saladsCollectionView;
			
			dessertsButton.alpha = 0.5;
			saladsButton.alpha = 1;
			mainCourseButton.alpha = 0.5;
			soupsButton.alpha = 0.5;
			drinksButton.alpha = 0.5;
		} break;
		case 2: {
			self.selectedCollection = mainCourseCollectionView;
			
			dessertsButton.alpha = 0.5;
			saladsButton.alpha = 0.5;
			mainCourseButton.alpha = 1;
			soupsButton.alpha = 0.5;
			drinksButton.alpha = 0.5;
		} break;
		case 3: {
			self.selectedCollection = soupsCollectionView;
			
			dessertsButton.alpha = 0.5;
			saladsButton.alpha = 0.5;
			mainCourseButton.alpha = 0.5;
			soupsButton.alpha = 1;
			drinksButton.alpha = 0.5;
		} break;
		case 4: {
			self.selectedCollection = drinksCollectionView;
			
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

-(void)displaySave:(id)sender {
	savedView.hidden = NO;
	fadeLabel.hidden = NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return delegate.GestureDetect;
}

- (void)panDetected:(UIPanGestureRecognizer *)panRecognizer {
    if (panRecognizer.state == UIGestureRecognizerStateBegan) {
		
        CGPoint tapPoint = [panRecognizer locationInView:self.view];
        self.initialPos = tapPoint.y;
        self.viewCell.backgroundColor = delegate.detailsFrame.backgroundColor;
		
		self.viewCell.imageView.image = delegate.cellImage;
        self.viewCell.center = CGPointMake(tapPoint.x, tapPoint.y);
    }
    
    if (panRecognizer.state == UIGestureRecognizerStateChanged) {
        
        CGPoint translation = [panRecognizer translationInView:self.view];
        [self.view addSubview:self.viewCell];
		
        CGPoint imageViewPosition = self.viewCell.center;
        imageViewPosition.x += translation.x;
        imageViewPosition.y += translation.y;
        
        self.viewCell.center = imageViewPosition;
        [panRecognizer setTranslation:CGPointZero inView:self.view];
    }
    
    if (panRecognizer.state == UIGestureRecognizerStateEnded) {
		
        CGPoint finalPoint = [panRecognizer locationInView:self.view];
        [self changeTheElements:finalPoint.y];
    }
}

-(void)changeTheElements:(float)posY
{
    [self.viewCell removeFromSuperview];
	
    if (self.initialPos < 325 & posY >= 400) {
		
		switch (selectedIndex) {
			case 0: {
				if ([self.dessertsCells count] != 0) {
					warningLabel.hidden = NO;
					saveButton.hidden = NO;
					saveButton.userInteractionEnabled = YES;
					
					int pass = [[self.dessertsCells objectAtIndex:delegate.detailsFrame.indexPath] intValue];
					[self.dessertsCells removeObjectAtIndex:delegate.detailsFrame.indexPath];
					[self.savedCells addObject:[NSNumber numberWithInt:pass]];
					[allCollectionView reloadData];
					[dessertsCollection reloadData];
				}
			} break;
			case 1: {
				if ([self.saladsCells count] != 0) {
					warningLabel.hidden = NO;
					saveButton.hidden = NO;
					saveButton.userInteractionEnabled = YES;
					
					int pass = [[self.saladsCells objectAtIndex:delegate.detailsFrame.indexPath] intValue];
					[self.saladsCells removeObjectAtIndex:delegate.detailsFrame.indexPath];
					[self.savedCells addObject:[NSNumber numberWithInt:pass]];
					[allCollectionView reloadData];
					[saladsCollectionView reloadData];
				}
			} break;
			case 2: {
				if ([self.mainCourseCells count] != 0) {
					warningLabel.hidden = NO;
					saveButton.hidden = NO;
					saveButton.userInteractionEnabled = YES;
					
					int pass = [[self.mainCourseCells objectAtIndex:delegate.detailsFrame.indexPath] intValue];
					[self.mainCourseCells removeObjectAtIndex:delegate.detailsFrame.indexPath];
					[self.savedCells addObject:[NSNumber numberWithInt:pass]];
					[allCollectionView reloadData];
					[mainCourseCollectionView reloadData];
				}
			} break;
			case 3: {
				if ([self.soupsCells count] != 0) {
					warningLabel.hidden = NO;
					saveButton.hidden = NO;
					saveButton.userInteractionEnabled = YES;
					
					int pass = [[self.soupsCells objectAtIndex:delegate.detailsFrame.indexPath] intValue];
					[self.soupsCells removeObjectAtIndex:delegate.detailsFrame.indexPath];
					[self.savedCells addObject:[NSNumber numberWithInt:pass]];
					[allCollectionView reloadData];
					[soupsCollectionView reloadData];
				}
			} break;
			case 4: {
				if ([self.drinksCells count] != 0) {
					warningLabel.hidden = NO;
					saveButton.hidden = NO;
					saveButton.userInteractionEnabled = YES;
					
					int pass = [[self.drinksCells objectAtIndex:delegate.detailsFrame.indexPath] intValue];
					[self.drinksCells removeObjectAtIndex:delegate.detailsFrame.indexPath];
					[self.savedCells addObject:[NSNumber numberWithInt:pass]];
					[allCollectionView reloadData];
					[drinksCollectionView reloadData];
				}
			} break;
			default:
				break;
		}
    }
    if (self.initialPos > 400 & posY < 325) {
		switch (selectedIndex) {
			case 0: {
				if ([self.savedCells count] != 0) {
					int pass = [[self.savedCells objectAtIndex:delegate.detailsFrame.indexPath] intValue];
					[self.savedCells removeObjectAtIndex:delegate.detailsFrame.indexPath];
					[self.dessertsCells addObject:[NSNumber numberWithInt:pass]];
					[dessertsCollection reloadData];
					[allCollectionView reloadData];
				}
			} break;
			case 1: {
				if ([self.savedCells count] != 0) {
					int pass = [[self.savedCells objectAtIndex:delegate.detailsFrame.indexPath] intValue];
					[self.savedCells removeObjectAtIndex:delegate.detailsFrame.indexPath];
					[self.saladsCells addObject:[NSNumber numberWithInt:pass]];
					[saladsCollectionView reloadData];
					[allCollectionView reloadData];
				}
			} break;
			case 2: {
				if ([self.savedCells count] != 0) {
					int pass = [[self.savedCells objectAtIndex:delegate.detailsFrame.indexPath] intValue];
					[self.savedCells removeObjectAtIndex:delegate.detailsFrame.indexPath];
					[self.mainCourseCells addObject:[NSNumber numberWithInt:pass]];
					[mainCourseCollectionView reloadData];
					[allCollectionView reloadData];
				}
			} break;
			case 3: {
				if ([self.savedCells count] != 0) {
					int pass = [[self.savedCells objectAtIndex:delegate.detailsFrame.indexPath] intValue];
					[self.savedCells removeObjectAtIndex:delegate.detailsFrame.indexPath];
					[self.soupsCells addObject:[NSNumber numberWithInt:pass]];
					[soupsCollectionView reloadData];
					[allCollectionView reloadData];
				}
			} break;
			case 4: {
				if ([self.savedCells count] != 0) {
					int pass = [[self.savedCells objectAtIndex:delegate.detailsFrame.indexPath] intValue];
					[self.savedCells removeObjectAtIndex:delegate.detailsFrame.indexPath];
					[self.drinksCells addObject:[NSNumber numberWithInt:pass]];
					[drinksCollectionView reloadData];
					[allCollectionView reloadData];
				}
			} break;
			default:
				break;
		}
    }
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
