//
//  Level1_6.m
//  IM
//
//  Created by Damian Rizzotto on 24/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level1_6.h"

@implementation Level1_6

- (void)didLoadFromCCB {
    [[super physicsNode] setCollisionDelegate:self];
}


@end
