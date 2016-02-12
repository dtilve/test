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
        NSMutableArray* contacts = [NSMutableArray alloc];
        NSError* error = [NSError alloc];
        
        void (^addContact)(CNContact*, BOOL*) = ^(CNContact* contact, BOOL* stop) {
            [contacts addObject:contact];
            printf("contact fetched");
        };
        
        [self enumerateContactsWithFetchRequest:request error:&error usingBlock:addContact];
        
        return contacts;
    }

@end
