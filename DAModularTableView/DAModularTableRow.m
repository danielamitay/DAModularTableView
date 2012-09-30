//
//  DAModularTableRow.m
//  DAModularTableView
//
//  Created by Daniel Amitay on 8/5/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import "DAModularTableRow.h"

@implementation DAModularTableRow

@synthesize text, detailText, image, accessoryView;
@synthesize rowHeight;
@synthesize selectionStyle, accessoryType, cellStyle, rowAnimation;
@synthesize didSelectBlock, cellForRowBlock, didSelectAction;

#pragma mark - Public Methods

+ (DAModularTableRow *)row
{
    return [[DAModularTableRow alloc] init];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
        self.accessoryType = UITableViewCellAccessoryNone;
        self.cellStyle = UITableViewCellStyleDefault;
        self.rowAnimation = UITableViewRowAnimationAutomatic;
    }
    return self;
}

@end
