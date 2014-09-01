//
//  AppDelegate.h
//  suggestic
//
//  Created by Alebrije on 21/08/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dragCell.h"
#import "detailsCell.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) dragCell *CellFrame;
@property (nonatomic, retain) detailsCell *detailsFrame;
@property (nonatomic, retain) UIImage *cellImage;
@property (nonatomic) BOOL GestureDetect;
@property (nonatomic) int likesCount;

@end
