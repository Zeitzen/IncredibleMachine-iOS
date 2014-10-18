//
//  Level2.m
//  IM
//
//  Created by Damian Rizzotto on 02/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level1_1.h"


@implementation Level1_1 {
    CCNode *_shelf1;
    CCNode *_shelf2;
    CCNode* _ball1;
    CCNode* _ball2;
    CCNode* _star1;
}

- (void)didLoadFromCCB {
    [super.StaticArray addObject:_shelf1];
    [super.StaticArray addObject:_shelf2];
    [super.AllMovableArray addObject:_shelf1];
    [super.AllMovableArray addObject:_shelf2];
    
    [super.LockedDynamicArray addObject:_ball1];
    [super.LockedDynamicArray addObject:_ball2];
    
    //_star1.physicsBody.sensor = TRUE;
    
    [[super physicsNode] setCollisionDelegate:self];
    

}


@end
