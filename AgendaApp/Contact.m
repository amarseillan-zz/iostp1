//
//  Contact.m
//  AgendaApp
//
//  Created by AdminMacLC04 on 8/15/13.
//  Copyright (c) 2013 AdminMacLC04. All rights reserved.
//

#import "Contact.h"
#import "Phone.h"

@implementation Contact

+ (NSMutableArray *) contactsFromJson:(NSArray *)json
{
    NSMutableArray *contacts = [[NSMutableArray alloc] init];
    for(NSDictionary *contactDict in json){
        [contacts addObject:[Contact contactFromJson:contactDict]];
    }
    return contacts;
}

+ (Contact *) contactFromJson:(NSDictionary *)json
{
    Contact *contact = [[Contact alloc] init];
    contact.contactId = [json objectForKey:@"id"];
    contact.name = [json objectForKey:@"name"];
    
    NSMutableArray *phones = [[NSMutableArray alloc] init];
    for(NSDictionary *phoneDict in [json objectForKey:@"phones"]){
        [phones addObject:[Phone phoneFromJson:phoneDict]];
    }
    contact.phoneNumbers = phones;
    return contact;
}

- (id) init:(NSString*)name withPhones:(NSMutableArray*)phoneNumbers
{
    self = [super init];
    
    if (self) {
        _name = name;
        _phoneNumbers = phoneNumbers;
    }
    
    return self;
}

@end
