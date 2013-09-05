//
//  NewContactViewController.h
//  AgendaApp
//
//  Created by AdminMacLC04 on 8/22/13.
//  Copyright (c) 2013 AdminMacLC04. All rights reserved.
//

#import "ViewController.h"
#import "Phone.h"
#import "Contact.h"

@interface NewContactViewController : ViewController <UITableViewDelegate, UITableViewDataSource>

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@property (strong, nonatomic) Contact* contact;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITableView *phonesTableView;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void) phoneDidChange:(Phone *)phone;
- (void) phoneFinishedEdit:(Phone *)phone;

@end
