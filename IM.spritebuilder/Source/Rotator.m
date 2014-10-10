//
//  Rotator.m
//  IM
//
//  Created by Damian Rizzotto on 08/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Rotator.h"

@implementation Rotator{
    CGFloat gameTime;
    Boolean rotate;
    float displacement;
}

- (void)didLoadFromCCB {
    rotate = TRUE;
    displacement = 0;
}

- (void)update:(CCTime)delta {
    if(rotate){
        gameTime += delta;
        self.rotation = sin(gameTime) * 30 + displacement;
    }
}

-(void) stop {
    rotate = FALSE;
}

-(void) play {
    displacement = self.rotation;
    rotate = TRUE;
}

-(void)rotate:(float)rotation{
    self.rotation=rotation;
}

@end
