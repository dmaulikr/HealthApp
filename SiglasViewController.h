//
//  SiglasViewController.h
//  HealthApp
//
//  Created by Andrew Gama Branches on 23/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SiglasViewController : UIViewController

@property (strong, nonatomic) NSDictionary *Detail;
@property (strong, nonatomic) IBOutlet UILabel *lbSiglas;
@property (strong, nonatomic) IBOutlet UITextView *tvSiglas;

@end
