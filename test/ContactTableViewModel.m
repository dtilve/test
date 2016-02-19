//
//  ContactViewModel.m
//  test
//
//  Created by Dana Neyra on 2/17/16.
//  Copyright © 2016 Dana. All rights reserved.
//

#import "ContactTableViewModel.h"

@interface ContactTableViewModel()

@property(nonatomic, readonly) NSMutableArray* privateContacts;

@end

@implementation ContactTableViewModel

    - (id) init {
        
        PhoneBookAddress * addressBook = [[PhoneBookAddress alloc] init];
        ContactStore * contactStore = [[ContactStore alloc] init];
        
        self.contacts = [[NSMutableArray alloc] init];
        self.favorites = [[NSMutableArray alloc] init];
        
        NSArray* keys = [NSArray alloc];
        keys = @[CNContactEmailAddressesKey,
                 CNContactPhoneNumbersKey,
                 CNContactGivenNameKey,
                 CNContactFamilyNameKey,
                 CNContactMiddleNameKey,
                 CNContactThumbnailImageDataKey];
        CNContactFetchRequest* request = [[CNContactFetchRequest alloc] initWithKeysToFetch:keys];
     
        self.fetchContacts = [[RACCommand alloc] initWithSignalBlock:^RACSignal * (id _){
            return [[[addressBook fetchContacts:request] flattenMap: ^RACStream *(id value){
                return [contactStore hydrateContacts:value];
            }] concat];
        }];
        
//        self.reloadContactList
        
        self.contacts = RACObserve(self, fetchContacts);
        
        NSString * favorited = @"favorite";
        NSPredicate* predicate = [NSPredicate predicateWithFormat:favorited];
        self.favorites = [NSMutableArray arrayWithArray:[self.contacts filteredArrayUsingPredicate:predicate]];
        
    /*    [addressBook.contactsChanged subscribeNext:^(id x) {
            // table reload
        }];
        
        [contactStore.contactFavoriteChanged subscribeNext:^(id x) {
         // table reload
        }];
      */
        return self;
    }


@end
