//
//  Level2_2.m
//  IM
//
//  Created by Damian Rizzotto on 24/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level2_2.h"

@implementation Level2_2

- (void)didLoadFromCCB {
    [[super physicsNode] setCollisionDelegate:self];
}


@end
