//
//  DAModularTableView.m
//  DAModularTableView
//
//  Created by Daniel Amitay on 8/5/12.
//  Copyright (c) 2012 Daniel Amitay. All rights reserved.
//

#import "DAModularTableView.h"

@interface DAModularTableView () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation DAModularTableView

@synthesize sections = _sections;

@dynamic delegate, dataSource;

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self)
    {
        super.delegate = self;
        super.dataSource = self;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        super.delegate = self;
        super.dataSource = self;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        super.delegate = self;
        super.dataSource = self;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self)
    {
        super.delegate = self;
        super.dataSource = self;
    }
    return self;
}

#pragma mark - Accessing Rows, Sections, Cells and Index Paths

- (DAModularTableSection *)sectionAtIndex:(NSInteger)index
{
    return [[self sections] objectAtIndex:index];
}

- (DAModularTableRow *)rowAtIndexPath:(NSIndexPath *)indexPath
{
    DAModularTableSection *section = [self sectionAtIndex:indexPath.section];
    return [section rowAtIndex:indexPath.row];
}

- (UITableViewCell *)cellForRow:(DAModularTableRow *)row
{
    NSIndexPath *indexPathForRow = [self indexPathForRow:row];
    return [self cellForRowAtIndexPath:indexPathForRow];
}

- (NSIndexPath *)indexPathForRow:(DAModularTableRow *)row
{
    DAModularTableSection *rowSection;
    for (DAModularTableSection *section in [self sections])
    {
        if ([section.rows containsObject:row])
        {
            rowSection = section;
        }
    }
    
    NSInteger rowIndex = [rowSection.rows indexOfObject:row];
    NSInteger sectionIndex = [self indexForSection:rowSection];
    return [NSIndexPath indexPathForRow:rowIndex inSection:sectionIndex];
}

- (NSInteger)indexForSection:(DAModularTableSection *)section
{
    return [self.sections indexOfObject:section];
}

- (DAModularTableRow *)rowForCell:(UITableViewCell *)cell
{
    NSIndexPath *indexPath = [self indexPathForCell:cell];
    return [self rowAtIndexPath:indexPath];
}

#pragma mark - Inserting, Removing, Reloading Sections

- (void)insertSection:(DAModularTableSection *)section
{
    [self insertSection:section
               animated:NO];
}

- (void)insertSection:(DAModularTableSection *)section
             animated:(BOOL)animated
{
    [self insertSection:section
                atIndex:[[self sections] count]
               animated:animated];
}

- (void)insertSection:(DAModularTableSection *)section
              atIndex:(NSInteger)index
             animated:(BOOL)animated
{
    [self insertSection:section
                atIndex:index
          withAnimation:(animated ? section.rowAnimation : UITableViewRowAnimationNone)];
}

- (void)insertSection:(DAModularTableSection *)section
              atIndex:(NSInteger)index
        withAnimation:(UITableViewRowAnimation)animation
{
    [[self sections] insertObject:section atIndex:index];
    [self insertSections:[NSIndexSet indexSetWithIndex:index]
        withRowAnimation:animation];
}

- (void)moveSection:(NSInteger)section
          toSection:(NSInteger)newSection
{
    [[self sections] exchangeObjectAtIndex:section
                         withObjectAtIndex:newSection];
    [super moveSection:section
             toSection:newSection];
}

- (void)removeSection:(DAModularTableSection *)section
             animated:(BOOL)animated
{
    [self removeSection:section
          withAnimation:(animated ? section.rowAnimation : UITableViewRowAnimationNone)];
}

- (void)removeSection:(DAModularTableSection *)section
        withAnimation:(UITableViewRowAnimation)animation
{
    NSInteger index = [self indexForSection:section];
    [[self sections] removeObject:section];
    [self beginUpdates];
    [self deleteSections:[NSIndexSet indexSetWithIndex:index]
        withRowAnimation:animation];
    [self endUpdates];
}

- (void)removeAllSectionsAnimated:(BOOL)animated
{
    [self removeAllSectionsWithRowAnimation:(animated ? UITableViewRowAnimationAutomatic : UITableViewRowAnimationNone)];
}

- (void)removeAllSectionsWithRowAnimation:(UITableViewRowAnimation)animation
{
    NSMutableIndexSet *mutableIndexSet = [[NSMutableIndexSet alloc] init];
    for(DAModularTableSection *section in self.sections)
    {
        [mutableIndexSet addIndex:[self indexForSection:section]];
    }
    [self beginUpdates];
    [self.sections removeAllObjects];
    [self deleteSections:mutableIndexSet withRowAnimation:animation];
    [self endUpdates];
}

- (void)reloadSection:(DAModularTableSection *)section
             animated:(BOOL)animated;
{
    NSInteger index = [self indexForSection:section];
    [self reloadSections:[NSIndexSet indexSetWithIndex:index]
        withRowAnimation:(animated ? section.rowAnimation : UITableViewRowAnimationNone)];
}

#pragma mark - Inserting, Removing, Reloading Rows

- (void)insertRow:(DAModularTableRow *)row
{
    [self insertRow:row
           animated:NO];
}

- (void)insertRow:(DAModularTableRow *)row
         animated:(BOOL)animated
{
    DAModularTableSection *lastSection = [[self sections] lastObject];
    if (!lastSection)
    {
        lastSection = [DAModularTableSection section];
        [self insertSection:lastSection];
    }
    [self insertRow:row
        atIndexPath:[NSIndexPath indexPathForRow:([lastSection.rows count])
                                       inSection:([[self sections] count] - 1)]
           animated:animated];
}

- (void)insertRow:(DAModularTableRow *)row
      atIndexPath:(NSIndexPath *)indexPath
         animated:(BOOL)animated
{
    [self insertRow:row
        atIndexPath:indexPath
      withAnimation:(animated ? row.rowAnimation : UITableViewRowAnimationNone)];
}

- (void)insertRow:(DAModularTableRow *)row
      atIndexPath:(NSIndexPath *)indexPath
    withAnimation:(UITableViewRowAnimation)animation
{
    DAModularTableSection *section = [self sectionAtIndex:indexPath.section];
    if (!section)
    {
        section = [DAModularTableSection section];
        [self insertSection:section];
    }
    [[section rows] insertObject:row atIndex:indexPath.row];
    [self insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                withRowAnimation:animation];
}

- (void)moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath
{
    DAModularTableRow *row = [self rowAtIndexPath:indexPath];
    [self insertRow:row
        atIndexPath:indexPath
           animated:NO];
    [super moveRowAtIndexPath:indexPath
                  toIndexPath:newIndexPath];
}

- (void)removeRow:(DAModularTableRow *)row
         animated:(BOOL)animated
{
    [self removeRow:row
      withAnimation:(animated ? row.rowAnimation : UITableViewRowAnimationNone)];
}

- (void)removeRow:(DAModularTableRow *)row
    withAnimation:(UITableViewRowAnimation)animation
{
    NSIndexPath *indexPath = [self indexPathForRow:row];
    DAModularTableSection *section = [self sectionAtIndex:indexPath.section];
    [[section rows] removeObject:row];
    [self beginUpdates];
    [self deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                withRowAnimation:animation];
    [self endUpdates];
}

- (void)reloadRow:(DAModularTableRow *)row
         animated:(BOOL)animated
{
    NSIndexPath *indexPath = [self indexPathForRow:row];
    [self reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                withRowAnimation:(animated ? row.rowAnimation : UITableViewRowAnimationNone)];
}

#pragma mark - Property Methods

- (NSMutableArray *)sections
{
    if (!_sections)
    {
        _sections = [NSMutableArray array];
    }
    return _sections;
}

- (void)setDataSource:(id<UITableViewDataSource>)dataSource
{
    // For now, discard
    // Possible todo: add proxy dataSource for selective handling
}

- (void)setDelegate:(id<UITableViewDelegate>)delegate
{
    // For now, discard
    // Possible todo: add proxy delegate for selective handling
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DAModularTableSection *tableSection = [self sectionAtIndex:section];
    return [[tableSection rows] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DAModularTableRow *tableRow = [self rowAtIndexPath:indexPath];
    
    NSString *cellIdentifier = (tableRow.cellIdentifier ? tableRow.cellIdentifier : [NSString stringWithFormat:@"cellStyle%d", tableRow.cellStyle]);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:tableRow.cellStyle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = tableRow.text;
    cell.detailTextLabel.text = tableRow.detailText;
    cell.imageView.image = tableRow.image;
    cell.accessoryView = tableRow.accessoryView;
    cell.editingAccessoryView = tableRow.editingAccessoryView;
    
    cell.selectionStyle = tableRow.selectionStyle;
    cell.accessoryType = tableRow.accessoryType;
    cell.editingAccessoryType = tableRow.editingAccessoryType;
    
    if (tableRow.cellForRowBlock)
    {
        tableRow.cellForRowBlock(cell, indexPath);
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	DAModularTableSection *tableSection = [self sectionAtIndex:section];
	return [tableSection headerTitle];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    DAModularTableSection *tableSection = [self sectionAtIndex:section];
	return [tableSection footerTitle];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	DAModularTableSection *tableSection = [self sectionAtIndex:section];
	return [tableSection headerView];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    DAModularTableSection *tableSection = [self sectionAtIndex:section];
	return [tableSection footerView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    DAModularTableSection *tableSection = [self sectionAtIndex:section];
    return [tableSection headerHeight];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    DAModularTableSection *tableSection = [self sectionAtIndex:section];
    return [tableSection footerHeight];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DAModularTableRow *tableRow = [self rowAtIndexPath:indexPath];
    if (tableRow.didSelectBlock)
    {
        tableRow.didSelectBlock(indexPath);
    }
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if (tableRow.didSelectAction)
    {
        [self performSelector:tableRow.didSelectAction];
    }
#pragma clang diagnostic pop
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    DAModularTableRow *tableRow = [self rowAtIndexPath:indexPath];
    
    if (tableRow.accessoryButtonDidSelectBlock)
    {
        tableRow.accessoryButtonDidSelectBlock(indexPath);
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DAModularTableRow *tableRow = [self rowAtIndexPath:indexPath];
    return tableRow.editingStyle;
}

- (BOOL) tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    DAModularTableRow *tableRow = [self rowAtIndexPath:indexPath];
    return tableRow.shouldIndentWhileEditing;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    DAModularTableRow *rowToMove = [self rowAtIndexPath:sourceIndexPath];
    
    DAModularTableSection *sourceSection = [self sectionAtIndex:sourceIndexPath.section];
    [[sourceSection rows] removeObjectAtIndex:sourceIndexPath.row];
    
    DAModularTableSection *destinationSection = [self sectionAtIndex:destinationIndexPath.section];
    [[destinationSection rows] insertObject:rowToMove atIndex:destinationIndexPath.row];
    
    if(self.rowMovedBlock)
        self.rowMovedBlock(sourceIndexPath, destinationIndexPath);
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        DAModularTableRow *rowToDelete = [self rowAtIndexPath:indexPath];
        
        if(self.rowDeletedBlock)
        {
            self.rowDeletedBlock(indexPath);
        }
        
        [self removeRow:rowToDelete animated:YES];
    }
    else if(editingStyle == UITableViewCellEditingStyleInsert)
    {
        if(self.rowInsertedBlock)
        {
            DAModularTableRow *rowToBeAdded = self.rowInsertedBlock(indexPath);
            
            if(rowToBeAdded)
                [self insertRow:rowToBeAdded atIndexPath:indexPath animated:YES];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DAModularTableRow *tableRow = [self rowAtIndexPath:indexPath];
    return (tableRow.rowHeight ? tableRow.rowHeight : tableView.rowHeight);
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    DAModularTableRow *tableRow = [self rowAtIndexPath:indexPath];
    return tableRow && tableRow.canBeMoved;
}

- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    DAModularTableRow *tableRow = [self rowAtIndexPath:sourceIndexPath];
    if(tableRow.targetIndexPathForMoveFromRowAtIndexPath)
    {
        return tableRow.targetIndexPathForMoveFromRowAtIndexPath(proposedDestinationIndexPath);
    }
    
    return proposedDestinationIndexPath;
}

@end
