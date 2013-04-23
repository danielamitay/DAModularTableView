//
//  DynamicModificationViewController.m
//  DAModularTableViewExample
//
//  Created by Daniel Amitay on 9/18/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import "DynamicModificationViewController.h"

@interface DynamicModificationViewController ()

@end

@implementation DynamicModificationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Dynamic Modification";
    
    self.tableView.rowHeight = 60.0f;
    
    DAModularTableRow *heightChangeRow = [DAModularTableRow row];
    heightChangeRow.text = @"Height Change";
    heightChangeRow.rowHeight = 60.0f;
    heightChangeRow.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
        DAModularTableRow *tableRow = [self.tableView rowAtIndexPath:indexPath];
        tableRow.rowHeight = (tableRow.rowHeight == 60.0f ? 120.0f : 60.0f);
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
    };
    [self.tableView insertRow:heightChangeRow];
    
    DAModularTableRow *textChangeRow = [DAModularTableRow row];
    textChangeRow.text = @"Text Change";
    textChangeRow.didSelectBlock = ^(NSIndexPath *indexPath){
        self.view.tag += 1;
        DAModularTableRow *tableRow = [self.tableView rowAtIndexPath:indexPath];
        tableRow.text = [NSString stringWithFormat:@"Text Change (%d)", self.view.tag];
        [self.tableView reloadRow:tableRow animated:YES];
    };
    [self.tableView insertRow:textChangeRow];
    
    DAModularTableRow *styleChangeRow = [DAModularTableRow row];
    styleChangeRow.text = @"Style Change";
    styleChangeRow.detailText = @"Detail Text";
    styleChangeRow.cellStyle = UITableViewCellStyleValue1;
    styleChangeRow.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    styleChangeRow.didSelectBlock = ^(NSIndexPath *indexPath){
        
        DAModularTableRow *tableRow = [self.tableView rowAtIndexPath:indexPath];
        tableRow.cellStyle = (tableRow.cellStyle == UITableViewCellStyleValue1 ? UITableViewCellStyleSubtitle : UITableViewCellStyleValue1);
        tableRow.accessoryType = (tableRow.accessoryType == UITableViewCellAccessoryDisclosureIndicator ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryDisclosureIndicator);
        
        [self.tableView reloadRow:tableRow animated:YES];
    };
    [self.tableView insertRow:styleChangeRow];
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
