//
//  Phone.h
//  AgendaApp
//
//  Created by AdminMacLC04 on 8/22/13.
//  Copyright (c) 2013 AdminMacLC04. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Phone : NSObject

@property (nonatomic, strong) NSNumber *phoneId;
@property (nonatomic, strong) NSString *phone;

+ (Phone *) phoneFromJson:(NSDictionary *)json;

- (NSDictionary*) json;

@end
