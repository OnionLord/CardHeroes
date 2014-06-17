//
//  MasterViewController.m
//  SpinCity
//
//  Created by Dan Pilone on 11/11/12.
//  Copyright (c) 2012 Element 84, LLC. All rights reserved.
//

#import "DataViewController.h"

#import "DataDetailViewController.h"
#import "DataDataController.h"
#import "Data.h"
#import "DataTableViewCell.h"

@interface DataViewController ()
@property (nonatomic, strong) DataDataController *DataDataController;
@end

@implementation DataViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.DataDataController = [[DataDataController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.detailViewController = (DataDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.DataDataController DataCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DataCell" forIndexPath:indexPath];
 
    Data *camp = [self.DataDataController DataAtIndex:indexPath.row];
    cell.DataTitleLabel.text = camp.title;
    cell.DataSummaryLabel.text = camp.summary;
    cell.DataType.text = camp.type;
  
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 //   NSLog(@"EE");
    NSIndexPath *indexPath1 = [self.tableView indexPathForSelectedRow];
    Data *camp = [self.DataDataController DataAtIndex:indexPath1.row];
    self.detailViewController.detailItem = camp;
    //UISplitViewController *splitViewController = (UISplitViewController *)self.splitViewController.viewControllers;
    //UINavigationController *navigationController = [splitViewController.viewControllers lastObject];
    //splitViewController.delegate = (id)navigationController.delegate;
    
    //self.detailViewController = (DataDetailViewController*)splitViewController;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"goData"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Data *camp = [self.DataDataController DataAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem:camp];
    }
}

-(IBAction)unwindFromDetailViewController:(UIStoryboardSegue *)segue
{
    
}

@end
