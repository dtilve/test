//
//  ContactTableViewModel.h
//  test
//
//  Created by Dana Neyra on 2/17/16.
//  Copyright © 2016 Dana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhoneBookAddress.h"
#import "ContactStore.h"
#import "ContactModel.h"
@import Contacts;
@import ReactiveCocoa;

enum FilterType{
    all,
    favorites
};

@interface ContactTableViewModel : NSObject

    @property NSMutableArray<ContactModel*>* contacts;
    @property NSMutableArray<ContactModel*>* favorites;

    @property RACCommand* fetchContacts;
    @property RACSignal* reloadContactList;

    @property enum FilterType activeFilter;

    - (id) init;

//   - (void) reloadTableViewContacts:(UITableView*)tableView;

@end
