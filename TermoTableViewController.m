//
//  TermoTableViewController.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 15/06/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import "TermoTableViewController.h"
#import "TermoViewController.h"
#import "NSDictionary+TermoRecord.h"
#import "Color.h"

@interface TermoTableViewController ()

@end

@implementation TermoTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *plistURL = [[NSBundle mainBundle] URLForResource:@"Termos" withExtension:@"plist"];
    self.content = [[NSMutableArray alloc] initWithContentsOfURL:plistURL];
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.searchController.active)
    {
        [self performSegueWithIdentifier: @"showDetails" sender: self];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetails"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        TermoViewController *detailViewController = (TermoViewController *)segue.destinationViewController;
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
