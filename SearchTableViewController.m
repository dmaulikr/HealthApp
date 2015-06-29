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
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        termoRecord = [self.searchResults objectAtIndex:indexPath.row];
    } else {
        termoRecord = [self.content objectAtIndex:indexPath.row];
    }
    
    if ([self.searchDisplayController isActive])
    {
        cell.textLabel.text       = termoRecord.nomeTermo;
        cell.detailTextLabel.text = termoRecord.sigTermo;
    }
    return cell;
}


- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat: @"SELF['nome'] contains[c] %@ ", self.searchBar.text];
    
    //    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat: @"(SELF['nome'] contains[c] %@) OR (SELF['significado'] contains[c] %@)", self.searchBar.text, self.searchBar.text];
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        [self performSegueWithIdentifier: @"showDetails" sender: self];
    }
}


#pragma mark - Prepare For Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetails"])
    {
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SearchDetailViewController *detailViewController = (SearchTableViewController *)segue.destinationViewController;
        
        if ([self.searchDisplayController isActive])
        {
            detailViewController.Detail = [self.searchResults objectAtIndex: self.searchDisplayController.searchResultsTableView.indexPathForSelectedRow.row];

        }
    }
}

@end
