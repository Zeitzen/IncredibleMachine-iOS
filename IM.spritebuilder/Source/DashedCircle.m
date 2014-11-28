//
//  DashedCircle.m
//  IM
//
//  Created by Damian Rizzotto on 08/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "DashedCircle.h"

@implementation DashedCircle

-(id)init{
    id aux = [super init];
    
    float duration = 1.5f;
    id rotUp = [CCActionRotateBy actionWithDuration:duration angle:30.0f ];
    [self runAction:[CCActionRepeatForever actionWithAction:rotUp]];
    return aux;
}

@end
