//
//  Level2_3.m
//  IM
//
//  Created by Damian Rizzotto on 24/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level2_4.h"

@implementation Level2_4 {
    CCNode* _tball1;
    CCNode* _tball2;
    CCNode* _Pipe;
    
    CCSprite* _Mini;

}


- (void)didLoadFromCCB {
    [super.LockedDynamicArray addObject:_tball1];
    [super.LockedDynamicArray addObject:_tball2];
    
    [super.MiniArray addObject:_Mini];

    [super.StaticArray addObject:_Pipe];
    [super.AllMovableArray addObject:_Pipe];
    
    [[super physicsNode] setCollisionDelegate:self];
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair EndGame:(CCNode *)nodeA TBall:(CCNode *)nodeB {
    super.End.visible = TRUE;
    [((EndLevel*)super.End) showStars: (3 - super.stars)];
        
    return NO;
}

@end
