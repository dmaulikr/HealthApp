//
//  ResultDripViewController.h
//  HealthApp
//
//  Created by Andrew Gama Branches on 23/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DripViewController.h"

@interface ResultDripViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lbResult;
@property (strong, nonatomic) IBOutlet UITextField *lbPaciente;
@property (weak, nonatomic) IBOutlet NSString *temporal;
@property (weak, nonatomic) IBOutlet NSString *temporal1;
@end
