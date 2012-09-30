//
//  DAModularTableSection.m
//  DAModularTableView
//
//  Created by Daniel Amitay on 8/5/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import "DAModularTableSection.h"

@implementation DAModularTableSection

@synthesize rows = _rows;

@synthesize headerHeight, footerHeight;
@synthesize headerTitle, footerTitle;
@synthesize headerView, footerView;

@synthesize rowAnimation;

#pragma mark - Public Methods

+ (DAModularTableSection *)section
{
    return [[DAModularTableSection alloc] init];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.headerHeight = UITableViewAutomaticDimension;
        self.footerHeight = UITableViewAutomaticDimension;
        self.rowAnimation = UITableViewRowAnimationAutomatic;
    }
    return self;
}

- (DAModularTableRow *)rowAtIndex:(NSInteger)index;
{
    return [[self rows] objectAtIndex:index];
}

#pragma mark - Property Methods

- (NSMutableArray *)rows
{
    if (!_rows)
    {
        _rows = [NSMutableArray array];
    }
    return _rows;
}

@end
