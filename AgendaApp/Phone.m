//
//  Phone.m
//  AgendaApp
//
//  Created by AdminMacLC04 on 8/22/13.
//  Copyright (c) 2013 AdminMacLC04. All rights reserved.
//

#import "Phone.h"

@implementation Phone

+ (Phone *) phoneFromJson:(NSDictionary *)json
{
    Phone *phone = [[Phone alloc] init];
    phone.phoneId = [json objectForKey:@"id"];
    phone.phone = [json objectForKey:@"phone"];
    return phone;
}

- (NSDictionary*) json
{
    return @{@"id": _phoneId == nil? [NSNull null] : _phoneId, @"phone": _phone};
}

@end
