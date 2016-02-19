//
//  ContactStore.h
//  test
//
//  Created by Dana Neyra on 2/18/16.
//  Copyright © 2016 Dana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactModel.h"
#import "PhoneBookAddress.h"
@import ReactiveCocoa;

@protocol ContactStoreType <NSObject>

    @property(nonatomic, readonly) RACSignal* contactFavoriteChanged;

    - (RACSignal*) updateFavorite:(ContactModel*)contact withFavorite:(BOOL)favorite;

    - (RACSignal*) hydrateContacts:(NSArray<CNContact*>*)contacts;

@end


@interface ContactStore : NSObject <ContactStoreType>



@end
