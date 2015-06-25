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

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SiglasTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *plistURL = [[NSBundle mainBundle] URLForResource:@"Siglas" withExtension:@"plist"];
    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    self.content = [plist objectForKey:@"SIGLAS"];
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
        SiglasViewController *detailViewController = (SiglasViewController *)segue.destinationViewController;
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
