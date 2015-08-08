//
//  ResultDripViewController.h
//  HealthApp
//
//  Created by Andrew Gama Branches on 23/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DripViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface ResultDripViewController : UIViewController <NSFetchedResultsControllerDelegate, UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *lbResult;
@property (strong, nonatomic) IBOutlet UITextField *lbPaciente;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property NSString *resultado;
@property NSString *nome;
@end
