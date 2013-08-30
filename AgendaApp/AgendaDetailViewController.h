//
//  AgendaDetailViewController.h
//  AgendaApp
//
//  Created by AdminMacLC04 on 8/15/13.
//  Copyright (c) 2013 AdminMacLC04. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface AgendaDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *numberTable;
@property (strong, nonatomic) Contact *contact;

@end
