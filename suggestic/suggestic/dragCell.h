#import <UIKit/UIKit.h>

@interface dragCell : UICollectionViewCell

@property (nonatomic) int indexPath;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

-(void)initGestures;
@end
