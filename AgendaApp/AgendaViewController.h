//
//  AgendaViewController.h
//  AgendaApp
//
//  Created by AdminMacLC04 on 8/15/13.
//  Copyright (c) 2013 AdminMacLC04. All rights reserved.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *kContactAdded;
FOUNDATION_EXPORT NSString *kContactEdited;

@interface AgendaViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray* contacts;

- (void) refreshTableView:(NSNotification *)notification;

@end
