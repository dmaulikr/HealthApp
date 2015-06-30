//
//  MedViewController.h
//  HealthApp
//
//  Created by Andrew Gama Branches on 29/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedViewController : UIViewController

@property (strong, nonatomic) NSDictionary *Detail;
@property (strong, nonatomic) IBOutlet UILabel *lbNome;
@property (strong, nonatomic) IBOutlet UITextView *tvForma;
@property (strong, nonatomic) IBOutlet UITextView *tvadmin;
@property (strong, nonatomic) IBOutlet UITextView *tvDose;
@property (strong, nonatomic) IBOutlet UITextView *tvAcao;
@property (strong, nonatomic) IBOutlet UITextView *tvReacao;


@end
