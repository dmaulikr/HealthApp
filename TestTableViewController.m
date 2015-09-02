//
//  TestTableViewController.m
//  HealthApp
//
//  Created by Filipe da Silva Oliveira on 02/09/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "TestTableViewController.h"
#import "CustomCell.h"

@interface TestTableViewController ()

@end

@implementation TestTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = [self.Detail objectForKey:@"nome"];
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    CustomCell *customCell = (CustomCell *)cell;
    customCell.lb1.text = [self.Detail objectForKey:@"significado"];
    customCell.lb2.text = [self.Detail objectForKey:@"valores"];
    return cell;
}

@end