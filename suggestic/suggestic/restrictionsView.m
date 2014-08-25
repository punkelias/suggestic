//
//  restrictionsView.m
//  suggestic
//
//  Created by Elias on 23/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import "restrictionsView.h"
#import "AppDelegate.h"
#import "dragCell.h"

@interface restrictionsView ()
{
    AppDelegate *delegate;
}

@property (nonatomic, retain) dragCell *viewCell;
@property (nonatomic, retain) NSMutableArray *numCells;
@property (nonatomic, retain) NSMutableArray *numCells2;
@property (nonatomic) float initialPos;

@end

@implementation restrictionsView

@synthesize logoImage, topBar, allCollectionView, restrictedCollectionView, menuButton, restrictionsLabel, instructionsLabel, doneButton;

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
	restrictionsLabel.font = [UIFont fontWithName:@"Roboto-Bold" size:18];
	instructionsLabel.font = [UIFont fontWithName:@"Roboto-Regular" size:15];
	
	self.numCells = [NSMutableArray array];
    for (int cv = 0; cv < 9; cv++) {
        [self.numCells addObject:[NSString stringWithFormat:@"CARDS/card_%d", cv + 1]];
    }
    
    self.numCells2 = [NSMutableArray array];
    
	allCollectionView.dataSource = self;
	allCollectionView.delegate = self;
	restrictedCollectionView.dataSource = self;
	restrictedCollectionView.delegate = self;
	
    [allCollectionView registerNib:[UINib nibWithNibName:@"dragCell" bundle:nil] forCellWithReuseIdentifier:@"dragCell"];
    [restrictedCollectionView registerNib:[UINib nibWithNibName:@"dragCell" bundle:nil] forCellWithReuseIdentifier:@"dragCell"];
    
    //Setup cell
    self.viewCell = [[dragCell alloc] initWithFrame:CGRectMake(0, 0, 128, 214)];
    
    self.view.userInteractionEnabled = YES;
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
    [self.view addGestureRecognizer:panRecognizer];
    
    panRecognizer.delegate = self;
	
	[self animatedEnter];
}

-(void)viewDidAppear:(BOOL)animated {
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animatedEnter {
	CGRect originalFrame = logoImage.frame;
	originalFrame.origin.y = originalFrame.origin.y - 44;
	logoImage.transform = CGAffineTransformMakeScale(2.27, 2.27);
	topBar.alpha = 0;
	allCollectionView.alpha = 0;
	menuButton.alpha = 0;
	restrictionsLabel.alpha = 0;
	instructionsLabel.alpha = 0;
	
	[UIView animateWithDuration:1.25
                          delay:0.25
                        options: UIViewAnimationOptionCurveEaseIn
					 animations:^{
						 logoImage.frame = originalFrame;
						 CGAffineTransform move = CGAffineTransformMakeTranslation(-195, -470);
						 CGAffineTransform scale = CGAffineTransformMakeScale(1, 1);
						 CGAffineTransform transform = CGAffineTransformConcat(scale, move);
						 logoImage.transform = transform;
					 }
					 completion:^(BOOL finished){
						 logoImage.image = [UIImage imageNamed:@"log_suggestic_bar"];
						 allCollectionView.alpha = 1;
						 allCollectionView.transform = CGAffineTransformMakeTranslation(320, 0);
						 
						 [UIView animateWithDuration:0.5
											   delay:0
											 options: UIViewAnimationOptionCurveEaseIn
										  animations:^{
											  topBar.alpha = 1;
											  menuButton.alpha = 1;
											  restrictionsLabel.alpha = 1;
											  instructionsLabel.alpha = 1;
											  allCollectionView.transform = CGAffineTransformMakeTranslation(0, 0);
										  }
										  completion:nil];
					 }];
}

#pragma mark - UICollectionViewDataSource methods

- (NSInteger)collectionView:(UICollectionView *)theCollectionView numberOfItemsInSection:(NSInteger)theSectionIndex {
    int number = 0;
    switch (theCollectionView.tag) {
        case 0:
            number = [self.numCells count];
            break;
        case 1:
            number = [self.numCells2 count];
            break;
        default:
            break;
    }
    return number;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    dragCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"dragCell" forIndexPath:indexPath];
    switch (collectionView.tag) {
        case 0: {
            cell.indexPath = indexPath.item;
            [cell initGestures];
			cell.imageview.image = [UIImage imageNamed:[self.numCells objectAtIndex:indexPath.row]];
			} break;
        case 1: {
            cell.indexPath = indexPath.item;
            [cell initGestures];
			cell.imageview.image = [UIImage imageNamed:[self.numCells2 objectAtIndex:indexPath.row]];
			} break;
        default:
            break;
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
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
		NSLog(@"UIGestureRecognizerStateBegan");
		
        CGPoint tapPoint = [panRecognizer locationInView:self.view];
        self.initialPos = tapPoint.y;
        self.viewCell.backgroundColor = delegate.CellFrame.backgroundColor;
		NSLog(@"%@", delegate.cellImage);
		self.viewCell.imageview.image = delegate.cellImage;
        self.viewCell.center = CGPointMake(tapPoint.x, tapPoint.y);
    }
    
    if (panRecognizer.state == UIGestureRecognizerStateChanged) {
		NSLog(@"UIGestureRecognizerStateChanged");
        
        CGPoint translation = [panRecognizer translationInView:self.view];
        [self.view addSubview:self.viewCell];
	
        CGPoint imageViewPosition = self.viewCell.center;
        imageViewPosition.x += translation.x;
        imageViewPosition.y += translation.y;
        
        self.viewCell.center = imageViewPosition;
        [panRecognizer setTranslation:CGPointZero inView:self.view];
    }
    
    if (panRecognizer.state == UIGestureRecognizerStateEnded) {
		NSLog(@"UIGestureRecognizerStateEnded");
		
        CGPoint finalPoint = [panRecognizer locationInView:self.view];
        [self changeTheElements:finalPoint.y];
    }
}

-(void)changeTheElements:(float)posY
{
    [self.viewCell removeFromSuperview];
    if (self.initialPos < 300 & posY >= 350) {
        if ([self.numCells count] != 0) {
			instructionsLabel.hidden = YES;
			doneButton.hidden = NO;
			doneButton.userInteractionEnabled = YES;
			
            NSString *pass = [self.numCells objectAtIndex:delegate.CellFrame.indexPath];
            [self.numCells removeObjectAtIndex:delegate.CellFrame.indexPath];
            [self.numCells2 addObject:pass];
            [self.allCollectionView reloadData];
            [self.restrictedCollectionView reloadData];
        }
    }
    if (self.initialPos > 350 & posY < 300) {
        if ([self.numCells2 count] != 0) {
            NSString *pass = [self.numCells2 objectAtIndex:delegate.CellFrame.indexPath];
            [self.numCells2 removeObjectAtIndex:delegate.CellFrame.indexPath];
            [self.numCells addObject:pass];
            [self.restrictedCollectionView reloadData];
            [self.allCollectionView reloadData];
        }
    }
}

@end
