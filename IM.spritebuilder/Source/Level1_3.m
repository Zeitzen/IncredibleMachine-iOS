//
//  Level1_3.m
//  IM
//
//  Created by Damian Rizzotto on 23/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level1_3.h"

@implementation Level1_3 {
    CCNode* _fball;
    CCNode* _shelf1;
    CCNode* _shelf2;
    CCSprite* _Mini1;
    CCSprite* _Mini2;
    
}

- (void)didLoadFromCCB {
    
    [super.MiniArray addObject:_Mini1];
    [super.MiniArray addObject:_Mini2];
    
    [super.StaticArray addObject:_shelf1];
    [super.StaticArray addObject:_shelf2];
    [super.AllMovableArray addObject:_shelf1];
    [super.AllMovableArray addObject:_shelf2];
    
    [super.LockedDynamicArray addObject:_fball];
    
    [[super physicsNode] setCollisionDelegate:self];
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair EndGame:(CCNode *)nodeA Ball:(CCNode *)nodeB {
    
    super.End.visible = TRUE;
    [((EndLevel*)super.End) showStars: (3 - super.stars)];
    
    return NO;
}

@end
