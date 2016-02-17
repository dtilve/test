//
//  CNContactStore+CSFetch.m
//  test
//
//  Created by Dana Neyra on 2/12/16.
//  Copyright © 2016 Dana. All rights reserved.
//

#import "CNContactStore+CSFetch.h"

@implementation CNContactStore (CSFetch)

    -(NSMutableArray*) fetchContacts:(CNContactFetchRequest*)request {
        NSLog(@"fetching contacts");
        NSMutableArray* contacts = [[NSMutableArray alloc] init];
        NSError* error = [NSError alloc];
        
        void (^addContact)(CNContact*, BOOL*) = ^(CNContact* contact, BOOL* stop) {
            [contacts addObject:contact];
            NSLog(@"contact %@ fetched", [contact givenName]);
        };
        
        [self enumerateContactsWithFetchRequest:request error:&error usingBlock:addContact];
        
        return contacts;
    }

@end
