//
//  ThirdTableViewController.m
//  HealthApp
//
//  Created by Filipe da Silva Oliveira on 12/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "ThirdTableViewController.h"

@interface ThirdTableViewController ()

@end

@implementation ThirdTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.group;
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
    return [self.test count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *cid = self.test[indexPath.row];
    cell.textLabel.text = [cid objectForKey:@"classificacao"];
    cell.detailTextLabel.text = [cid objectForKey:@"nome"];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    FourthTableViewController *destination = (FourthTableViewController *)segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSDictionary *cid = self.test[indexPath.row];
    NSArray *x = [cid objectForKey:@"codigo"];
    destination.group = [cid objectForKey:@"classificacao"];
    destination.test = x;
}


@end