//
//  Contact.h
//  AgendaApp
//
//  Created by AdminMacLC04 on 8/15/13.
//  Copyright (c) 2013 AdminMacLC04. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic, strong) NSNumber* contactId;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSMutableArray* phoneNumbers;

+ (NSMutableArray *) contactsFromJson:(NSArray *)json;
+ (NSMutableArray *) contactFromJson:(NSArray *)json;

- (id) init:(NSString*)name withPhones:(NSMutableArray*)phoneNumbers;

@end
