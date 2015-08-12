//
//  RecentesDripTableViewController.h
//  HealthApp
//
//  Created by Andrew Gama Branches on 11/08/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface RecentesDripTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
