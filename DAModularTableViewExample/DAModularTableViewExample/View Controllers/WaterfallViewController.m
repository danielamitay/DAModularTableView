//
//  WaterfallViewController.m
//  DAModularTableViewExample
//
//  Created by Daniel Amitay on 9/19/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import "WaterfallViewController.h"

@interface WaterfallViewController ()

@property (nonatomic, strong) NSTimer *createTimer;

@end

@implementation WaterfallViewController
@synthesize createTimer = _createTimer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Waterfall";
    
    DAModularTableSection *tableSection = [DAModularTableSection section];
    [self.tableView insertSection:tableSection];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.createTimer = [NSTimer scheduledTimerWithTimeInterval:0.25f
                                                        target:self
                                                      selector:@selector(createNewRow)
                                                      userInfo:nil
                                                       repeats:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.createTimer invalidate];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)createNewRow
{
    DAModularTableRow *newRow = [DAModularTableRow row];
    newRow.text = [[NSDate date] description];
    newRow.didSelectBlock = ^(NSIndexPath *indexPath){
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    };
    newRow.rowAnimation = UITableViewRowAnimationFade;
    [self.tableView insertRow:newRow atIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.0f * NSEC_PER_SEC),
                   dispatch_get_current_queue(), ^
                   {
                       [self.tableView removeRow:newRow animated:YES];
                   });
    
}

@end
