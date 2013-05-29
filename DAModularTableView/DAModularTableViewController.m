//
//  DAModularTableViewController.m
//  DAModularTableView
//
//  Created by Daniel Amitay on 8/5/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import "DAModularTableViewController.h"

@interface DAModularTableViewController ()

@property (nonatomic) UITableViewStyle style;

@end

@implementation DAModularTableViewController
@synthesize style = _style;
@synthesize tableView = _tableView;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        self.style = style;
        self.frame = [[UIScreen mainScreen] applicationFrame];
    }
    return self;
}

- (id)initWithFrame:(CGRect)aFrame style:(UITableViewStyle)aStyle
{
    self = [super initWithStyle:aStyle];
    if (self)
    {
        self.style = aStyle;
        self.frame = aFrame;
    }
    return self;
}

- (void)loadView
{
    if(!self.tableView)
        self.tableView = [[DAModularTableView alloc] initWithFrame:self.frame style:self.style];
    
    self.view = self.tableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(self.viewDidLoadBlock)
        self.viewDidLoadBlock();
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
