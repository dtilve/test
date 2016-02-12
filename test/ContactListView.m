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
        printf("viewDidLoad");
        CNContactStore* contactStore = [CNContactStore alloc];
        CNContactFetchRequest* request;
        NSArray* keys = [NSArray alloc];
        keys = [keys initWithObjects:   CNContactEmailAddressesKey,
                                        CNContactPhoneNumbersKey,
                                        CNContactFormatterStyleFullName, nil];
        request = [request initWithKeysToFetch:keys];
        _contacts = [contactStore fetchContacts:request];
        [[self contactTableView] reloadData];
    }



    - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
        return 1;
    }

    - (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
            NSInteger count = 0;
            if ([[self segmentedControl] selectedSegmentIndex]== 0 ){
                count = [[self contacts] count];
            }
            else count = [[self favorites] count];
            return count;
        }

    - (ContactView*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath{
        ContactView *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
        if (cell == nil) {
            cell = [[ContactView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CustomCell"];
            if ([[self segmentedControl] selectedSegmentIndex] == 0) {
                cell.name.text = [[self contacts] objectAtIndex:indexPath.item];
                cell.email.text = [[self contacts] objectAtIndex:indexPath.item];
                cell.phone.text = [[self contacts] objectAtIndex:indexPath.item];
            }
            else {
                cell.name.text = [[self favorites] objectAtIndex:indexPath.item];
                cell.email.text = [[self favorites] objectAtIndex:indexPath.item];
                cell.phone.text = [[self favorites] objectAtIndex:indexPath.item];
            }
        }
        return cell;
    }

@end