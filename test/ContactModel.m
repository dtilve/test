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
    NSURL* placeholder = [NSURL URLWithString:@"http://bsccongress.com/im3/grey-silhouette-of-man2-clip-art.png"];
    self.image = [[NSData alloc] initWithContentsOfURL:placeholder];
    return self;
}

- (id) initWithFavorite:(BOOL)favorite fromContact:(CNContact*)contact{
    self.identifier = contact.identifier;
    self.name = [[NSString alloc] initWithFormat:@"%@ %@ %@",contact.givenName, contact.middleName, contact.familyName];
    self.favorite = favorite;
    self.phoneNumber = [self extractFirstPhoneNumber:contact];
    self.email = [self extractFirstEmail:contact];
    NSData* image = [contact thumbnailImageData];
    if (image != nil) {
        self.image = image;
        NSLog(@"Setting customed picture");
    } else {
        NSLog(@"Setting placeholder picture");
        NSURL* placeholder = [NSURL URLWithString:@"http://bsccongress.com/im3/grey-silhouette-of-man2-clip-art.png"];
        self.image = [[NSData alloc] initWithContentsOfURL:placeholder];
    }
    return self;
}

- (NSString*) extractFirstPhoneNumber:(CNContact*)contact {
    NSArray* phoneNumbers = [contact phoneNumbers];
    
    if (phoneNumbers.firstObject != nil) {
        CNLabeledValue* firstPhoneNumber = phoneNumbers.firstObject;
        CNPhoneNumber* phone = [firstPhoneNumber value];
        NSString* phoneNumber = [phone stringValue];
        return phoneNumber;
    } else {
        return @"";
    }
}

- (NSString*) extractFirstEmail:(CNContact*)contact {
    NSArray* emailAddresses = [contact emailAddresses];
    if (emailAddresses.firstObject != nil) {
        CNLabeledValue* email = [emailAddresses firstObject];
        NSString* emailAddress = [email value];
        return emailAddress;
    }
    else {
        return @"";
    }
}

@end