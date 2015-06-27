//
//  Speak.h
//  HealthApp
//
//  Created by Andrew Gama Branches on 26/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface Speak : NSObject

- (void)speak01:(NSString *)top test:(AVSpeechSynthesizer *)synthesizer;

@end
