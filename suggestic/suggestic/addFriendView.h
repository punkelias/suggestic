//
//  addFriendView.h
//  suggestic
//
//  Created by Elias on 07/09/14.
//  Copyright (c) 2014 Kokonut Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addFriendView : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UITableView *friendsTable;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

-(IBAction)friendsSelected:(id)sender;

@end
