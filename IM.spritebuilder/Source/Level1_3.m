//
//  Level1_3.m
//  IM
//
//  Created by Damian Rizzotto on 23/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level1_3.h"

@implementation Level1_3 {
}

- (void)didLoadFromCCB {
    [[super physicsNode] setCollisionDelegate:self];
}

@end
