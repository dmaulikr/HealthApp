//
//  SobreTableViewController.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 06/08/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "SobreTableViewController.h"

@interface SobreTableViewController ()

@end

@implementation SobreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
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
    else if(indexPath.row == 3)
    {
        name = @"Cell4";
    }
    else if(indexPath.row == 4)
    {
        name = @"Cell5";
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:name];
    
    
    return cell;
}




@end
