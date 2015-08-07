//
//  DripViewController.h
//  HealthApp
//
//  Created by Andrew Gama Branches on 09/06/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultDripViewController.h"
#import "Color.h"

@interface DripViewController : UIViewController

@property (retain, nonatomic)  UIDatePicker *pickerDate;

@property (weak, nonatomic) IBOutlet UIButton *btCalculate;
@property (weak, nonatomic) IBOutlet UISegmentedControl *typeSegmented;
@property (weak, nonatomic) IBOutlet UITextField *tfQuantity;
@property (strong, nonatomic) IBOutlet UITextField *tfPaciente;
@property (strong, nonatomic) IBOutlet UITextField *tfTempo;

@property NSString *calculo;

- (IBAction)btCalculate:(id)sender;

@end
