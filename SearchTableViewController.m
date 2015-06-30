//
//  SearchTableTableViewController.m
//  HealthApp
//
//  Created by Rony Peterson V Conde on 24/06/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import "SearchTableViewController.h"
#import "SearchDetailViewController.h"
#import "NSDictionary+TermoRecord.h"


@interface SearchTableViewController ()

@end

@implementation SearchTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *plistURL = [[NSBundle mainBundle] URLForResource:@"Listas" withExtension:@"plist"];
    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    self.content = [plist objectForKey:@"Listas"];
    
    // No search results controller to display the search results in the current view
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    
    // Configure the search bar with scope buttons and add it to the table view header
    
    self.searchController.searchBar.delegate = self;
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    self.definesPresentationContext = YES;
    
    [self.searchController.searchBar sizeToFit];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.searchResults count];
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
    } else {
        termoRecord = [self.content objectAtIndex:indexPath.row];
    }
    
    if (self.searchController.active)
    {
        cell.textLabel.text       = termoRecord.nomeTermo;
        cell.detailTextLabel.text = termoRecord.sigTermo;
    }
    return cell;
}


- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    return YES;
}
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString *searchString = self.searchController.searchBar.text;
    NSPredicate *preicate = [NSPredicate predicateWithFormat:@"SELF['nome'] CONTAINS[c] %@", searchString];
    
    self.searchResults= [NSMutableArray arrayWithArray:[self.content filteredArrayUsingPredicate:preicate]];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.searchController.active)
    {
        [self performSegueWithIdentifier: @"showDetails" sender: self];
    }
}


#pragma mark - Prepare For Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetails"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SearchDetailViewController *detailViewController = (SearchDetailViewController *)segue.destinationViewController;
        
        if (self.searchController.active)
        {
            detailViewController.Detail = [self.searchResults objectAtIndex: indexPath.row];

        }
    }
}

@end
