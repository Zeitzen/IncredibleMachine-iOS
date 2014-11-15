//
//  Level2_1.m
//  IM
//
//  Created by Damian Rizzotto on 24/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level2_1.h"

@implementation Level2_1{
    CCNode* _PBall;
    CCNode* _P1;
    CCNode* _P2;
    CCNode* _P3;
    
    CCSprite* _Mini1;
    CCSprite* _Mini2;
    CCSprite* _Mini3;

}


- (void)didLoadFromCCB {
    [super.LockedDynamicArray addObject:_PBall];
    
    [super.MiniArray addObject:_Mini1];
    [super.MiniArray addObject:_Mini2];
    [super.MiniArray addObject:_Mini3];
    
    [super.StaticArray addObject:_P1];
    [super.AllMovableArray addObject:_P1];
    [super.StaticArray addObject:_P2];
    [super.AllMovableArray addObject:_P2];
    [super.StaticArray addObject:_P3];
    [super.AllMovableArray addObject:_P3];
    
    [[super physicsNode] setCollisionDelegate:self];
    
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair EndGame:(CCNode *)nodeA wildcard:(CCNode *)nodeB {
    
    super.End.visible = TRUE;
    [((EndLevel*)super.End) showStars: (3 - super.stars)];
    
    return NO;
}

@end
