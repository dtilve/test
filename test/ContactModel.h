//
//  ContactModel.h
//  test
//
//  Created by Dana Neyra on 2/12/16.
//  Copyright © 2016 Dana. All rights reserved.
//

#import <Foundation/Foundation.h>
@import Contacts;

@interface ContactModel : NSObject

@property (readwrite) BOOL favorite;
@property int position;
@property NSString* identifier;
@property NSString* name;
@property NSString* phoneNumber;
@property NSString* email;
@property NSData* image;

- (id) initWithFavorite:(BOOL)favorite fromContact:(CNContact*)contact;
- (id) init;

@end
