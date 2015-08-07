//
//  DesenvolvedoresTableViewController.m
//  HealthApp
//
//  Created by Filipe da Silva Oliveira on 07/08/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "DesenvolvedoresTableViewController.h"

@interface DesenvolvedoresTableViewController ()

@end

@implementation DesenvolvedoresTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorColor = [UIColor clearColor];
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
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSString *name;
     if(indexPath.row == 0)
     {
         name = @"Cell1";
     }
     else if(indexPath.row == 1)
     {
         name = @"Cell2";
     }
     else if(indexPath.row == 2)
     {
         name = @"Cell3";
     }
     else
     {
         name = @"Cell4";
     }
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:name];
     return cell;
}

@end