//
//  Rotator.m
//  IM
//
//  Created by Damian Rizzotto on 08/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Rotator.h"

@implementation Rotator

-(id)init{
    id aux = [super init];
    
    float duration = 1.5f;
    id rotUp = [CCActionRotateBy actionWithDuration:duration angle:30.0f ];
    id rotDown = [CCActionRotateBy actionWithDuration:duration angle:-30.0f ];
    id action = [CCActionSequence actions: rotUp,rotDown, nil];
    
    [self runAction:[CCActionRepeatForever actionWithAction:action]];
    return aux;
}

@end
