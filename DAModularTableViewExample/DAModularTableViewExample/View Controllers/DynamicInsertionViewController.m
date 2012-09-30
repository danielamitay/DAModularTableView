//
//  DynamicInsertionViewController.m
//  DAModularTableViewExample
//
//  Created by Daniel Amitay on 9/18/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import "DynamicInsertionViewController.h"

@interface DynamicInsertionViewController ()

@end

@implementation DynamicInsertionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Dynamic Insertion";
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(insertNewObject)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    DAModularTableSection *tableSection = [DAModularTableSection section];
    [self.tableView insertSection:tableSection];
}

- (void)insertNewObject
{
    DAModularTableRow *newRow = [DAModularTableRow row];
    newRow.text = [[NSDate date] description];
    newRow.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
        DAModularTableRow *tableRow = [self.tableView rowAtIndexPath:indexPath];
        [self.tableView removeRow:tableRow animated:YES];
    };
    [self.tableView insertRow:newRow atIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES];
}

@end
