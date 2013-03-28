//
//  DAModularTableSection.h
//  DAModularTableView
//
//  Created by Daniel Amitay on 8/5/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAModularTableRow.h"

@interface DAModularTableSection : NSObject

@property (nonatomic, strong) NSMutableArray *rows;

@property (nonatomic, copy) NSString *headerTitle;
@property (nonatomic, copy) NSString *footerTitle;

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *footerView;

@property (nonatomic) CGFloat headerHeight;
@property (nonatomic) CGFloat footerHeight;

@property (nonatomic) UITableViewRowAnimation rowAnimation;

+ (DAModularTableSection *)section;

#pragma mark - Accessing Rows

- (DAModularTableRow *)rowAtIndex:(NSInteger)index;

@end
