//
//  SinaisTableViewController.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 29/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "SinaisTableViewController.h"
#import "TestTableViewController.h"

@interface SinaisTableViewController ()

@end

@implementation SinaisTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"SinaisVitais" withExtension:@"plist"]];
    self.content = [plist objectForKey:@"SINAISVITAIS"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.content count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *campo = self.content[indexPath.row];
    cell.textLabel.text = [campo objectForKey:@"nome"];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    TestTableViewController *detailViewController = (TestTableViewController *)segue.destinationViewController;
    detailViewController.Detail = [self.content objectAtIndex:indexPath.row];
}

@end