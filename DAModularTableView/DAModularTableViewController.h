//
//  DAModularTableViewController.h
//  DAModularTableView
//
//  Created by Daniel Amitay on 8/5/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAModularTableView.h"

@interface DAModularTableViewController : UITableViewController

@property (nonatomic, strong) DAModularTableView *tableView;
@property (nonatomic, assign) CGRect frame;

@property (nonatomic, copy) void(^viewDidLoadBlock)();

- (id)initWithFrame:(CGRect)aFrame style:(UITableViewStyle)aStyle;

@end
