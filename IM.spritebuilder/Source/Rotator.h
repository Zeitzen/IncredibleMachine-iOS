//
//  Rotator.h
//  IM
//
//  Created by Damian Rizzotto on 08/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface Rotator : CCNode

-(void)stop;
-(void)play;
-(void)rotate:(float)rotation;
@end
