//
//  SiglasTableViewController.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 23/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "SiglasTableViewController.h"
#import "SiglasViewController.h"

@interface SiglasTableViewController ()
@property (nonatomic, copy) NSArray *siglas;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SiglasTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *plistURL = [[NSBundle mainBundle] URLForResource:@"Siglas" withExtension:@"plist"];
    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    self.siglas = [plist objectForKey:@"SIGLAS"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    SiglasViewController *detailViewController = (SiglasViewController *)segue.destinationViewController;
    detailViewController.Detail = [self.siglas objectAtIndex:indexPath.row];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.siglas count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *sigla = self.siglas[indexPath.row];
    cell.textLabel.text = [sigla objectForKey:@"nome"];
    cell.detailTextLabel.text = [sigla objectForKey:@"significado"];
    return cell;
}

@end
