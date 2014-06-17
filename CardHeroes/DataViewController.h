//
//  MasterViewController.h
//  SpinCity
//
//  Created by Dan Pilone on 11/11/12.
//  Copyright (c) 2012 Element 84, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataDetailViewController.h"
@interface DataViewController : UITableViewController
@property (strong, nonatomic) DataDetailViewController *detailViewController;

@end
