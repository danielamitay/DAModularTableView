//
//  DAModularTableRow.h
//  DAModularTableView
//
//  Created by Daniel Amitay on 8/5/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAModularTableRow : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *detailText;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIView *accessoryView;
@property (nonatomic, strong) UIView *editingAccessoryView;

@property (nonatomic) CGFloat rowHeight;

@property (nonatomic) UITableViewCellSelectionStyle selectionStyle;
@property (nonatomic) UITableViewCellEditingStyle editingStyle;
@property (nonatomic) UITableViewCellAccessoryType accessoryType;
@property (nonatomic) UITableViewCellAccessoryType editingAccessoryType;
@property (nonatomic) UITableViewCellStyle cellStyle;
@property (nonatomic) NSString *cellIdentifier;
@property (nonatomic) UITableViewRowAnimation rowAnimation;
@property (nonatomic) BOOL canBeMoved;
@property (nonatomic) BOOL shouldIndentWhileEditing;

@property (nonatomic, copy) void(^didSelectBlock)(NSIndexPath *indexPath);
@property (nonatomic, copy) void(^accessoryButtonDidSelectBlock)(NSIndexPath *indexPath);
@property (nonatomic, copy) void(^cellForRowBlock)(UITableViewCell *cell, NSIndexPath *indexPath);
@property (nonatomic, copy) NSIndexPath *(^targetIndexPathForMoveFromRowAtIndexPath)(NSIndexPath *indexPath);
@property (nonatomic) SEL didSelectAction;

+ (DAModularTableRow *)row;

@end
