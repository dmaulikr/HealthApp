//
//  TermoTableViewController.h
//  HealthApp
//
//  Created by Andrew Gama Branches on 15/06/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TermoTableViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *searchResults;
@property (strong, nonatomic) NSMutableArray *content;

@end
