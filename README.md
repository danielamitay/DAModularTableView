# DAModularTableView

Most apps have some sort of statically-populated UITableView (menu & settings pages). Tired of handling NSArrays of NSDictionaries, or filling your UITableViewDataSource methods with switch-case statements? So was I.

DAModularTableView abstracts this messiness away, and makes modular table view generation more sensical. Add rows and sections to your tableView the way common sense would dictate!

DAModularTableView allows you to individually customize every UITableViewCell as well as providing block callbacks for cell selection.

![Screenshot](https://github.com/danielamitay/DAModularTableView/raw/master/screenshot.png)

[Video demonstration on YouTube](http://www.youtube.com/watch?v=nbVnKns5mjE)

## Installation

- Copy over the `DAModularTableView` folder to your project folder.
- `#import "DAModularTableView.h"`

## Usage

Example project included (DAModularTableViewExample)

### Creating a DAModularTableView

There are two relevant classes that should seem familiar: `DAModularTableView` and `DAModularTableViewController`. They are direct subclasses of `UITableView` and `UITableViewController`, minus the delegate and dataSource properties (they are usurped for internal use).

```objective-c
// Creating a DATableView

DAModularTableView *tableView = [[DAModularTableView alloc] initWithFrame:self.view.bounds
                                                                            style:UITableViewStylePlain];
[self.view addSubview:tableView];
```

```objective-c
// Creating a DATableViewController
// Simply subclass DATableViewController
// Example UITableViewController header file converted:

#import "DAModularTableViewController.h"

@interface RootTableViewController : DAModularTableViewController

@end
```

### Adding Table Sections and Rows

```objective-c
// Bare-bones sections and rows:

DAModularTableSection *firstSection = [DAModularTableSection section];
[self.tableView insertSection:firstSection];

DAModularTableRow *firstRow = [DAModularTableRow row];
firstRow.text = @"Row";
firstRow.didSelectBlock = ^(NSIndexPath *indexPath){
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
};
[self.tableView insertRow:firstRow];

```

```objective-c
// Extra customization

DAModularTableSection *firstSection = [DAModularTableSection section];
firstSection.headerTitle = @"Section header";
firstSection.footerTitle = @"Section footer";
[self.tableView insertSection:firstSection];

DAModularTableRow *firstRow = [DAModularTableRow row];
firstRow.text = @"Row";
firstRow.text = @"Extra Info";
firstRow.rowHeight = 60.0f;
firstRow.cellForRowBlock = ^(UITableViewCell *cell, NSIndexPath *indexPath){
	cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
	cell.textLabel.textColor = [UIColor blueColor];
};
firstRow.didSelectBlock = ^(NSIndexPath *indexPath){
	NSLog(@"Bam! Cell selected.");
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
};
[self.tableView insertRow:firstRow];

```

### The gist

You create `DAModularTableSections` and `DAModularTableRows`, and then add them to the `DAModularTableView` using the following `DAModularTableView` methods:

```objective-c
// From DAModularTableView.h

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

```

## Notes

### Tested in App Store!
All code is iOS 5.0+ safe and well documented, and is already in production apps on the App Store.

### Automatic Reference Counting (ARC) support
DAModularTableView was made with ARC enabled by default.

## Contact

- [Personal website](http://danielamitay.com)
- [GitHub](http://github.com/danielamitay)
- [Twitter](http://twitter.com/danielamitay)
- [LinkedIn](http://www.linkedin.com/in/danielamitay)
- [Email](hello@danielamitay.com)

If you use/enjoy DAModularTableView, let me know!

## License

### MIT License

Copyright (c) 2012 Daniel Amitay (http://danielamitay.com)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
