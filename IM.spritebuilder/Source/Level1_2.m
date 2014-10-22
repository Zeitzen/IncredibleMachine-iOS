//
//  Level2.m
//  IM
//
//  Created by pito on 02/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level1_2.h"

@implementation Level1_2 {
    CCNode* _skate;
    CCNode* _shelf;
    CCNode* _tball;
}

- (void)didLoadFromCCB {
    [super.DynamicArray addObject:_skate];
    [super.DynamicArray addObject:_tball];
    [super.StaticArray addObject:_shelf];
    [super.AllMovableArray addObject:_shelf];
    [super.AllMovableArray addObject:_skate];

    
    [[super physicsNode] setCollisionDelegate:self];
}


@end
