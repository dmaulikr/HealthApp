//
//  Speak.h
//  HealthApp
//
//  Created by Andrew Gama Branches on 26/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Sound : NSObject

- (void)parameter01:(NSString *)text01 parameter02:(NSString *)text02 parameter03:(AVSpeechSynthesizer *)synthesizer;

@end
