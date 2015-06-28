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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
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
        
        if ([self.searchDisplayController isActive])
        {
            detailViewController.Detail = [self.searchResults objectAtIndex: self.searchDisplayController.searchResultsTableView.indexPathForSelectedRow.row];

        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
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
    if (tableView == self.searchDisplayController.searchResultsTableView)
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


- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat: @"SELF['nome'] contains[c] %@ ", self.searchBar.text];
    self.searchResults = [self.content filteredArrayUsingPredicate:resultPredicate] ;
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    return YES;
}

@end
