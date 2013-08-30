//
//  PhoneCell.m
//  AgendaApp
//
//  Created by AdminMacLC04 on 8/22/13.
//  Copyright (c) 2013 AdminMacLC04. All rights reserved.
//

#import "PhoneCell.h"

@implementation PhoneCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) awakeFromNib
{
    [_numberTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_numberTextField addTarget:self action:@selector(textFieldFinishedEditing:) forControlEvents:UIControlEventEditingDidEnd | UIControlEventEditingDidEndOnExit];
    _numberTextField.delegate = self;
}

- (void) setPhone:(Phone *)phone
{
    _phone = phone;
    _numberTextField.text = phone.phone;
}

- (void) textFieldDidChange:(UITextField *)textfield
{
    _phone.phone = textfield.text;
    [_ncvc phoneDidChange:_phone];
}

- (void) textFieldFinishedEditing:(UITextField*)textfield
{
    [textfield resignFirstResponder];
    dispatch_async(dispatch_get_main_queue(), ^{
        [_ncvc phoneFinishedEdit:_phone];
    });
}

@end
