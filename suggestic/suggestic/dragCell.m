#import "dragCell.h"
#import "AppDelegate.h"

@interface dragCell()
{
    AppDelegate *delegate;
}

@end

@implementation dragCell

@synthesize indexPath, imageview;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)initGestures
{
    delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.userInteractionEnabled = YES;
    
    UILongPressGestureRecognizer *pressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(pressDetected:)];
    pressRecognizer.numberOfTapsRequired = 0;
    pressRecognizer.minimumPressDuration = 0.1;
    [self addGestureRecognizer:pressRecognizer];
}

- (void)pressDetected:(UILongPressGestureRecognizer *)pressRecognizer
{
    if (pressRecognizer.state == UIGestureRecognizerStateBegan) {
        NSLog(@"<<<<<<<<<< Tab en Cell");
        delegate.GestureDetect = YES;
        delegate.CellFrame = self;
		delegate.cellImage = imageview.image;
    }
    if (pressRecognizer.state == UIGestureRecognizerStateEnded) {
        delegate.GestureDetect = NO;
		delegate.cellImage = nil;
    }
}

@end
