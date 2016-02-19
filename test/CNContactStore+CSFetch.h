//
//  CNContactStore+CSFetch.h
//  test
//
//  Created by Dana Neyra on 2/12/16.
//  Copyright © 2016 Dana. All rights reserved.
//

#import <Contacts/Contacts.h>
@import ReactiveCocoa;

@interface CNContactStore (CSFetch)

    - (RACSignal*) fetchContacts:(CNContactFetchRequest*) request;

@end
