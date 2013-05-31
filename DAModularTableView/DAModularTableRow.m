//
//  DAModularTableRow.m
//  DAModularTableView
//
//  Created by Daniel Amitay on 8/5/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import "DAModularTableRow.h"

@implementation DAModularTableRow

@synthesize text, detailText, image, accessoryView, editingAccessoryView;
@synthesize rowHeight;
@synthesize selectionStyle, accessoryType, cellStyle, editingStyle, rowAnimation;
@synthesize canBeMoved;
@synthesize didSelectBlock, cellForRowBlock, didSelectAction, accessoryButtonDidSelectBlock;
@synthesize targetIndexPathForMoveFromRowAtIndexPath;

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
        self.cellStyle = UITableViewCellStyleDefault;
        self.editingStyle = UITableViewCellEditingStyleNone;
        self.accessoryType = UITableViewCellAccessoryNone;
        self.editingAccessoryType = UITableViewCellAccessoryNone;
        self.rowAnimation = UITableViewRowAnimationAutomatic;
        self.canBeMoved = NO;
        self.shouldIndentWhileEditing = YES;
    }
    return self;
}

@end
