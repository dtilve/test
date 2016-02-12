//
//  ContactView.h
//  test
//
//  Created by Dana Neyra on 2/12/16.
//  Copyright © 2016 Dana. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Contacts;

@interface ContactView : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UIButton *favorited;
@property (weak, nonatomic) IBOutlet UIImageView *photo;

@end
