//
//  ContactListView.h
//  test
//
//  Created by Dana Neyra on 2/12/16.
//  Copyright © 2016 Dana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactModel.h"
#import "ContactView.h"

@interface ContactListView : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray* contacts;
@property NSMutableArray* favorites;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *contactTableView;

@end
