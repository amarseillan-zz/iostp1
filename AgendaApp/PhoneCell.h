//
//  PhoneCell.h
//  AgendaApp
//
//  Created by AdminMacLC04 on 8/22/13.
//  Copyright (c) 2013 AdminMacLC04. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Phone.h"
#import "NewContactViewController.h"

@interface PhoneCell : UITableViewCell <UITextFieldDelegate>

@property (strong, nonatomic) Phone *phone;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) NewContactViewController *ncvc;

- (void) setPhone:(Phone *)phone;
- (void) textFieldDidChange:(UITextField *)textfield;

@end
