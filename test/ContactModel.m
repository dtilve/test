//
//  ContactModel.m
//  test
//
//  Created by Dana Neyra on 2/12/16.
//  Copyright © 2016 Dana. All rights reserved.
//

#import "ContactModel.h"

@interface ContactModel()
@end

@implementation ContactModel

- (id) init {
    self.favorite = false;
    self.identifier = @"";
    self.name = @"";
    self.phoneNumber = @"";
    self.email = @"";
    return self;
}

- (id) initWithFavorite:(BOOL)favorite fromContact:(CNContact*)contact{
    self.identifier = contact.identifier;
    self.name = [[NSString alloc] initWithFormat:@"%@ %@ %@",contact.givenName, contact.middleName, contact.familyName];
    self.favorite = favorite;
    self.phoneNumber = [self extractFirstPhoneNumber:contact];
    self.email = [self extractFirstEmail:contact];
    return self;
}

- (NSString*) extractFirstPhoneNumber:(CNContact*)contact {
    NSString *phoneNumber = @"";
    if (contact.phoneNumbers.firstObject == nil){
        printf("No phone number found");
    } else {
        phoneNumber = contact.phoneNumbers.firstObject.value.stringValue;
    }
    return phoneNumber;
}

- (NSString*) extractFirstEmail:(CNContact*)contact {
    NSString *email = @"";
    if (contact.emailAddresses.firstObject == nil){
        printf("No email address found");
    } else {
        email = contact.emailAddresses.firstObject.value;
    }
    return email;
}

@end