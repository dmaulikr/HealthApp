//
//  SiglasTableViewController.h
//  HealthApp
//
//  Created by Andrew Gama Branches on 23/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SiglasTableViewController : UIViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *searchResults;
@property (strong, nonatomic) NSMutableArray *content;

@end
