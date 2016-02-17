//
//  ContactListView.m
//  test
//
//  Created by Dana Neyra on 2/12/16.
//  Copyright © 2016 Dana. All rights reserved.
//

#import "ContactListView.h"
#import "CNContactStore+CSFetch.h"

@implementation ContactListView

    - (void)viewDidLoad{
        [super viewDidLoad];
        NSLog(@"viewDidLoad");
        
        CNContactStore* contactStore = [[CNContactStore alloc] init];
        CNContactFetchRequest* request = [CNContactFetchRequest alloc];
        NSArray* keys = [NSArray alloc];
        keys = @[CNContactEmailAddressesKey,
                 CNContactPhoneNumbersKey,
                 CNContactGivenNameKey,
                 CNContactFamilyNameKey,
                 CNContactMiddleNameKey,
                 CNContactThumbnailImageDataKey];
        NSLog(@"Count for keys: %lu", (unsigned long)[keys count]);
        request = [request initWithKeysToFetch:keys];
        NSLog(@"Keys for request: %@", [request keysToFetch]);
        NSArray <CNContact *> * allContacts = [contactStore fetchContacts:request];
        NSMutableArray<ContactModel*> * contacts = [[NSMutableArray alloc] init];
        self.favorites = [[NSMutableArray alloc] init];
        for (int i = 0; i < allContacts.count; i++) {
            ContactModel* b = [[ContactModel alloc] initWithFavorite:false fromContact:allContacts[i]];
            b.position = i;
            NSLog(@"Adding contact");
            [contacts addObject:b];
        }

        self.contacts = contacts;
        NSLog(@"%lu contacts found in total",(unsigned long)[self.contacts count]);
        [[self contactTableView] reloadData];
    
    }

    - (IBAction)changeFavorited:(id)sender {
        NSLog(@"Button has been pressed");
        NSInteger i = [sender tag];
        NSLog(@"The sender tag is %ld", (long)i);
        ContactModel* contact = self.contacts[i];
        NSLog(@"The name of the contact to be changed is %@", contact.name);
        BOOL oldFav = contact.favorite;
        [self contacts][i].favorite = !oldFav;
        if (oldFav) {
            NSLog(@"The contact was a favorite before - Removing from favorites");
            [self.favorites removeObject:contact];
        } else {
            NSLog(@"The contact wasn't a favorite before - Adding to favorites");
            [self.favorites addObject:contact];
        }
        NSLog(@"There are now %lu favorite contacts", (unsigned long)[self.favorites count]);
        [[self contactTableView] reloadData];

    }


    - (IBAction)switchContacts:(id)sender {
        [[self contactTableView] reloadData];
    }



    - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
        return 1;
    }

    - (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
        NSInteger count = 0;
        if ([[self segmentedControl] selectedSegmentIndex]== 0 ){
            count = [self.contacts count];
            NSLog(@"Value of all count: %ld", (long)count);
        }
        else {
            count = [self.favorites count];
            NSLog(@"Value of favorites count: %ld", (long)count);
        }
        return count;
    }

    - (ContactView*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath{
        ContactView *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
        
        if (cell == nil) {
            cell = [[ContactView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CustomCell"];
        }
        
        if ([[self segmentedControl] selectedSegmentIndex] == 0){
            cell.name.text = [[self.contacts objectAtIndex:indexPath.item] name];
            cell.photo.image =  [UIImage imageWithData:[[self.contacts objectAtIndex:indexPath.item] image]];
            cell.phone.text = [[self.contacts objectAtIndex:indexPath.item] phoneNumber];
            cell.email.text = [[self.contacts objectAtIndex:indexPath.item] email];
            cell.favorited.tag = indexPath.item;
        } else {
            cell.name.text = [[self.favorites objectAtIndex:indexPath.item] name];
            cell.photo.image = [UIImage imageWithData:[[self.favorites objectAtIndex:indexPath.item] image]];
            cell.phone.text = [[self.favorites objectAtIndex:indexPath.item] phoneNumber];
            cell.email.text = [[self.favorites objectAtIndex:indexPath.item] email];
            cell.favorited.tag = ([[self.favorites objectAtIndex:indexPath.item] position]);
        }

        return cell;
    }

@end