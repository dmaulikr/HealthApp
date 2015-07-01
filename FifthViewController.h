//
//  FifthViewController.h
//  HealthApp
//
//  Created by Andrew Gama Branches on 30/06/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface FifthViewController : UIViewController
@property (strong, nonatomic) NSDictionary *Detail;

@property (strong, nonatomic) IBOutlet UITextView *lbSig;
- (IBAction)btLer:(id)sender;

@end
