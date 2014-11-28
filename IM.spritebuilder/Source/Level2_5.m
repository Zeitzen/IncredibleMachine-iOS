//
//  Level2_5.m
//  IM
//
//  Created by Damian Rizzotto on 24/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level2_5.h"

@implementation Level2_5 {
    CCNode* _TBall;
    CCNode* _Pipe1;
    CCNode* _Pipe2;

    CCSprite* _Mini1;
    CCSprite* _Mini2;
}

- (void)didLoadFromCCB {
    [super.LockedDynamicArray addObject:_TBall];
    
    [super.MiniArray addObject:_Mini1];
    [super.MiniArray addObject:_Mini2];
    
    [super.StaticArray addObject:_Pipe1];
    [super.AllMovableArray addObject:_Pipe1];
    [super.StaticArray addObject:_Pipe2];
    [super.AllMovableArray addObject:_Pipe2];

    
    [[super physicsNode] setCollisionDelegate:self];
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair EndGame:(CCNode *)nodeA TBall:(CCNode *)nodeB {
    super.End.visible = TRUE;
    [((EndLevel*)super.End) showStars: (3 - super.stars)];
    
    return NO;
}


@end
