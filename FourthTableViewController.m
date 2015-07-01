//
//  FourthTableViewController.m
//  HealthApp
//
//  Created by Filipe da Silva Oliveira on 23/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "FourthTableViewController.h"
#import "FifthViewController.h"

@interface FourthTableViewController ()


@end

@implementation FourthTableViewController

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
    cell.textLabel.text = [cid objectForKey:@"nome"];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    FifthViewController *detailViewController = (FifthViewController *)segue.destinationViewController;
    detailViewController.Detail = [self.test objectAtIndex:indexPath.row];
}
@end
