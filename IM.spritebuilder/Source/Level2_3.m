//
//  Level2_3.m
//  IM
//
//  Created by Damian Rizzotto on 24/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level2_3.h"

@implementation Level2_3

- (void)didLoadFromCCB {
    [[super physicsNode] setCollisionDelegate:self];
}


@end
