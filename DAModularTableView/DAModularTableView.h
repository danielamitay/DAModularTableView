//
//  DAModularTableView.h
//  DAModularTableView
//
//  Created by Daniel Amitay on 8/5/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAModularTableSection.h"

@interface DAModularTableView : UITableView

@property (nonatomic, strong) NSMutableArray *sections;

@property (nonatomic, copy) void(^rowMovedBlock)(NSIndexPath *sourceIndexPath, NSIndexPath *destinationIndexPath);
@property (nonatomic, copy) void(^rowDeletedBlock)(NSIndexPath *indexPath);
@property (nonatomic, copy) DAModularTableRow *(^rowInsertedBlock)(NSIndexPath *indexPath);

#pragma mark - Accessing Rows, Sections, Cells and Index Paths

- (DAModularTableSection *)sectionAtIndex:(NSInteger)index;
- (DAModularTableRow *)rowAtIndexPath:(NSIndexPath *)indexPath;

- (UITableViewCell *)cellForRow:(DAModularTableRow *)row;
- (NSIndexPath *)indexPathForRow:(DAModularTableRow *)row;
- (NSInteger)indexForSection:(DAModularTableSection *)section;

- (DAModularTableRow *)rowForCell:(UITableViewCell *)cell;

#pragma mark - Inserting, Removing, Reloading Sections

- (void)insertSection:(DAModularTableSection *)section;
- (void)insertSection:(DAModularTableSection *)section
             animated:(BOOL)animated;
- (void)insertSection:(DAModularTableSection *)section
              atIndex:(NSInteger)index
             animated:(BOOL)animated;

- (void)removeSection:(DAModularTableSection *)section
             animated:(BOOL)animated;

- (void)reloadSection:(DAModularTableSection *)section
             animated:(BOOL)animated;

- (void)removeAllSectionsAnimated:(BOOL)animated;

#pragma mark - Inserting, Removing, Reloading Rows

- (void)insertRow:(DAModularTableRow *)row;
- (void)insertRow:(DAModularTableRow *)row
         animated:(BOOL)animated;
- (void)insertRow:(DAModularTableRow *)row
      atIndexPath:(NSIndexPath *)indexPath
         animated:(BOOL)animated;

- (void)removeRow:(DAModularTableRow *)row
         animated:(BOOL)animated;

- (void)reloadRow:(DAModularTableRow *)row
         animated:(BOOL)animated;

@end