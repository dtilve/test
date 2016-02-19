//
//  PhoneBookAddress.h
//  test
//
//  Created by Dana Neyra on 2/17/16.
//  Copyright © 2016 Dana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNContactStore+CSFetch.h"
@import ReactiveCocoa;
@import Contacts;


@interface PhoneBookAddress : NSObject

@property(nonatomic, readonly) RACSignal * contactsChanged;

- (RACSignal *)fetchContacts:(CNContactFetchRequest *)request;

@end

