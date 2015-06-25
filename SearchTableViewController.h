//
//  SearchTableTableViewController.h
//  HealthApp
//
//  Created by Rony Peterson V Conde on 24/06/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTableViewController : UITableViewController <UISearchControllerDelegate, UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *searchResults;
@property (strong, nonatomic) NSMutableArray *content;
@property (strong, nonatomic) NSDictionary *listas;

@end