//
//  MixedCellsViewController.m
//  DAModularTableViewExample
//
//  Created by Daniel Amitay on 9/18/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import "MixedCellsViewController.h"

@interface MixedCellsViewController ()

@end

@implementation MixedCellsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Mixed Cells";
    
    DAModularTableSection *selectionSection = [DAModularTableSection section];
    selectionSection.headerTitle = @"Selection Styles";
    [self.tableView insertSection:selectionSection];
    
    DAModularTableRow *blueSelectionRow = [DAModularTableRow row];
    blueSelectionRow.text = @"Blue";
    blueSelectionRow.selectionStyle = UITableViewCellSelectionStyleBlue;
    blueSelectionRow.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:blueSelectionRow];
    
    DAModularTableRow *graySelectionRow = [DAModularTableRow row];
    graySelectionRow.text = @"Gray";
    graySelectionRow.selectionStyle = UITableViewCellSelectionStyleGray;
    graySelectionRow.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:graySelectionRow];
    
    DAModularTableRow *noneSelectionRow = [DAModularTableRow row];
    noneSelectionRow.text = @"None";
    noneSelectionRow.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.tableView insertRow:noneSelectionRow];
    
    
    DAModularTableSection *cellStyleSection = [DAModularTableSection section];
    cellStyleSection.headerTitle = @"Cell Styles";
    [self.tableView insertSection:cellStyleSection];
    
    DAModularTableRow *defaultStyleRow = [DAModularTableRow row];
    defaultStyleRow.text = @"Default";
    defaultStyleRow.detailText = @"detailText";
    defaultStyleRow.cellStyle = UITableViewCellStyleDefault;
    defaultStyleRow.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:defaultStyleRow];
    
    DAModularTableRow *subtitleStyleRow = [DAModularTableRow row];
    subtitleStyleRow.text = @"Subtitle";
    subtitleStyleRow.detailText = @"detailText";
    subtitleStyleRow.cellStyle = UITableViewCellStyleSubtitle;
    subtitleStyleRow.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:subtitleStyleRow];
    
    DAModularTableRow *value1StyleRow = [DAModularTableRow row];
    value1StyleRow.text = @"Value1";
    value1StyleRow.detailText = @"detailText";
    value1StyleRow.cellStyle = UITableViewCellStyleValue1;
    value1StyleRow.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:value1StyleRow];
    
    DAModularTableRow *value2StyleRow = [DAModularTableRow row];
    value2StyleRow.text = @"Value2";
    value2StyleRow.detailText = @"detailText";
    value2StyleRow.cellStyle = UITableViewCellStyleValue2;
    value2StyleRow.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:value2StyleRow];
    
    
    DAModularTableSection *accessoryTypeSection = [DAModularTableSection section];
    accessoryTypeSection.headerTitle = @"Accessory Types";
    [self.tableView insertSection:accessoryTypeSection];
    
    DAModularTableRow *checkmarkAccessoryRow = [DAModularTableRow row];
    checkmarkAccessoryRow.text = @"Checkmark";
    checkmarkAccessoryRow.accessoryType = UITableViewCellAccessoryCheckmark;
    checkmarkAccessoryRow.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:checkmarkAccessoryRow];
    
    DAModularTableRow *detailDisclosureAccessoryRow = [DAModularTableRow row];
    detailDisclosureAccessoryRow.text = @"Detail Disclosure";
    detailDisclosureAccessoryRow.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    detailDisclosureAccessoryRow.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:detailDisclosureAccessoryRow];
        
    DAModularTableRow *disclosureAccessoryRow = [DAModularTableRow row];
    disclosureAccessoryRow.text = @"Disclosure";
    disclosureAccessoryRow.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    disclosureAccessoryRow.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:disclosureAccessoryRow];
    
    
    DAModularTableSection *cellHeightSection = [DAModularTableSection section];
    cellHeightSection.headerTitle = @"Row Height";
    [self.tableView insertSection:cellHeightSection];
    
    DAModularTableRow *height10Row = [DAModularTableRow row];
    height10Row.text = @"10 points";
    height10Row.rowHeight = 10.0f;
    height10Row.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:height10Row];
    
    DAModularTableRow *height20Row = [DAModularTableRow row];
    height20Row.text = @"20 points";
    height20Row.rowHeight = 20.0f;
    height20Row.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:height20Row];
    
    DAModularTableRow *height40Row = [DAModularTableRow row];
    height40Row.text = @"40 points";
    height40Row.rowHeight = 40.0f;
    height40Row.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:height40Row];
    
    DAModularTableRow *height80Row = [DAModularTableRow row];
    height80Row.text = @"80 points";
    height80Row.rowHeight = 80.0f;
    height80Row.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:height80Row];
    
    DAModularTableRow *height160Row = [DAModularTableRow row];
    height160Row.text = @"160 points";
    height160Row.rowHeight = 160.0f;
    height160Row.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    [self.tableView insertRow:height160Row];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
