//
//  PhoneBookAddress.m
//  test
//
//  Created by Dana Neyra on 2/17/16.
//  Copyright © 2016 Dana. All rights reserved.
//

#import "PhoneBookAddress.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface PhoneBookAddress ()

@property(nonatomic, readonly) CNContactStore * contactStore;

@end

@implementation PhoneBookAddress

- (id)init {
    self = [super init];
    _contactStore = [[CNContactStore alloc] init];
    _contactsChanged = [[RACSubject alloc] init];
    [self subscribeToNotifications];
    return self;
}

- (void)subscribeToNotifications {
    NSNotificationCenter * notificationCenter = [NSNotificationCenter defaultCenter];
    RACSignal * didChangeNotificationSignal = [notificationCenter rac_addObserverForName:CNContactStoreDidChangeNotification object:nil];
    [[didChangeNotificationSignal takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSNotification * notification) {
        [((RACSubject *)_contactsChanged) sendNext:[RACUnit defaultUnit]];
    }];
}


- (RACSignal *)fetchContacts:(CNContactFetchRequest *)request {
    return [_contactStore fetchContacts:request];
}

@end
