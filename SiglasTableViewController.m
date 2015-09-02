//
//  SiglasTableViewController.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 23/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "SiglasTableViewController.h"
#import "SiglasViewController.h"
#import "NSDictionary+TermoRecord.h"
#import "Color.h"

@interface SiglasTableViewController ()

@end

@implementation SiglasTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *plistURL = [[NSBundle mainBundle] URLForResource:@"Siglas" withExtension:@"plist"];
    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    self.content = [plist objectForKey:@"SIGLAS"];
    
    // No search results controller to display the search results in the current view
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.tintColor = [Color verde];
    self.searchController.searchBar.keyboardType = UIKeyboardTypeAlphabet;
    self.searchController.searchBar.keyboardAppearance = UIKeyboardAppearanceDark;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    
    // Configure the search bar with scope buttons and add it to the table view header
    
    self.searchController.searchBar.delegate = self;
    
    self.definesPresentationContext = YES;
    
    [self.searchController.searchBar sizeToFit];
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetails"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SiglasViewController *detailViewController = (SiglasViewController *)segue.destinationViewController;
        detailViewController.Detail = [self.content objectAtIndex:indexPath.row];
        if (self.searchController.active)
        {
            detailViewController.Detail = [self.searchResults objectAtIndex: indexPath.row];

        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.searchController.active)
    {
        return [self.searchResults count];
    }
    else
    {
        return [self.content count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: CellIdentifier];
    }
    NSDictionary *termoRecord;
    
    if (self.searchController.active)
    {
        termoRecord = [self.searchResults objectAtIndex:indexPath.row];
    }
    else
    {
        termoRecord = [self.content objectAtIndex:indexPath.row];
    }
    cell.textLabel.text       = termoRecord.nomeTermo;
    cell.detailTextLabel.text = termoRecord.sigTermo;
    return cell;
}


- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    return YES;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{

    NSString *searchString = self.searchController.searchBar.text;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF['nome'] CONTAINS[c] %@", searchString];
    
    self.searchResults= [NSMutableArray arrayWithArray:[self.content filteredArrayUsingPredicate:predicate]];
    [self.tableView reloadData];
}


@end
