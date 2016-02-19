//
//  ContactStore.m
//  test
//
//  Created by Dana Neyra on 2/18/16.
//  Copyright © 2016 Dana. All rights reserved.
//

#import "ContactStore.h"

@implementation ContactStore 

    @synthesize contactFavoriteChanged = _contactFavoriteChanged;

    NSMutableDictionary* database;

    - (RACSignal*) updateFavorite:(ContactModel*)contact withFavorite:(BOOL)favorite{
        NSNumber* numberWithBool = [NSNumber numberWithBool:favorite];
        [database setObject:numberWithBool forKey:contact.name];
        [((RACSubject *)_contactFavoriteChanged) sendNext:[RACUnit defaultUnit]];
        return [RACSignal return:contact];
    }

    - (RACSignal*) hydrateContacts:(NSArray*)contacts{
        [contacts.rac_sequence map:^id(CNContact * contact){
            return [[ContactModel alloc] initWithFavorite:NO fromContact:contact];
        }];
        return [RACSignal return:contacts];
    }


@end
