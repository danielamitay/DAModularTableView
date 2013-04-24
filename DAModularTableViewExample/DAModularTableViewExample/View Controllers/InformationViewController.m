//
//  InformationViewController.m
//  DAModularTableViewExample
//
//  Created by Daniel Amitay on 9/18/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import "InformationViewController.h"

@interface InformationViewController ()

@end

@implementation InformationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Information";
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
																   style:UIBarButtonItemStylePlain
																  target:self
																  action:@selector(dismiss)];
	self.navigationItem.leftBarButtonItem = doneButton;
    
    DAModularTableSection *appSection = [DAModularTableSection section];
    appSection.footerHeight = 2.0f;
    [self.tableView insertSection:appSection];
    
    DAModularTableRow *appRow = [DAModularTableRow row];
    appRow.text = @"DAModularTableView";
    appRow.detailText = @"By Daniel Amitay";
    appRow.cellStyle = UITableViewCellStyleSubtitle;
    appRow.selectionStyle = UITableViewCellSelectionStyleNone;
    appRow.image = [UIImage imageNamed:@"icon"];
    appRow.rowHeight = 72.0f;
    [self.tableView insertRow:appRow];
    
    
    DAModularTableSection *settingsSection = [DAModularTableSection section];
    settingsSection.headerTitle = @"Settings";
    settingsSection.headerHeight = 35.0f;
    settingsSection.footerHeight = 2.0f;
    [self.tableView insertSection:settingsSection];
    
    DAModularTableRow *pushRow = [DAModularTableRow row];
    pushRow.text = @"Push Notifications";
    pushRow.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    pushRow.didSelectBlock = ^(NSIndexPath *indexPath){
        DAModularTableRow *tableRow = [self.tableView rowAtIndexPath:indexPath];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:tableRow.text
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:pushRow];
    
    DAModularTableRow *otherRow = [DAModularTableRow row];
    otherRow.text = @"Other Preferences";
    otherRow.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    otherRow.didSelectBlock = ^(NSIndexPath *indexPath){
        DAModularTableRow *tableRow = [self.tableView rowAtIndexPath:indexPath];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:tableRow.text
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:otherRow];
    
    
    DAModularTableSection *shareSection = [DAModularTableSection section];
    shareSection.headerTitle = @"Share";
    shareSection.headerHeight = 35.0f;
    [self.tableView insertSection:shareSection];
    
    DAModularTableRow *emailRow = [DAModularTableRow row];
    emailRow.text = @"Share via Email";
    emailRow.didSelectBlock = ^(NSIndexPath *indexPath){
        DAModularTableRow *tableRow = [self.tableView rowAtIndexPath:indexPath];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:tableRow.text
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:emailRow];
    
    DAModularTableRow *smsRow = [DAModularTableRow row];
    smsRow.text = @"Share via SMS";
    smsRow.didSelectBlock = ^(NSIndexPath *indexPath){
        DAModularTableRow *tableRow = [self.tableView rowAtIndexPath:indexPath];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:tableRow.text
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:smsRow];
    
    DAModularTableRow *twitterRow = [DAModularTableRow row];
    twitterRow.text = @"Share via Twitter";
    twitterRow.didSelectBlock = ^(NSIndexPath *indexPath){
        DAModularTableRow *tableRow = [self.tableView rowAtIndexPath:indexPath];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:twitterRow.text
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:twitterRow];
    
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

@end
