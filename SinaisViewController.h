//
//  SinaisViewController.h
//  HealthApp
//
//  Created by Rony Peterson V Conde on 30/07/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SinaisViewController : UIViewController

@property (strong, nonatomic) NSDictionary *Detail;
@property (strong, nonatomic) IBOutlet UILabel *lbSinais;
@property (strong, nonatomic) IBOutlet UITextView *tvSinais;
@property (strong, nonatomic) IBOutlet UITextView *tv2Sinais;

@end
