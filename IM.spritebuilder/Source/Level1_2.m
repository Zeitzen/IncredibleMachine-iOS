//
//  Level2.m
//  IM
//
//  Created by pito on 02/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level1_2.h"

@implementation Level1_2 {
    CCNode* _Fball;
    CCNode* _shelf1;
    CCSprite* _Mini1;

}

- (void)didLoadFromCCB {
    
    [super.MiniArray addObject:_Mini1];

    [super.StaticArray addObject:_shelf1];
    [super.AllMovableArray addObject:_shelf1];
    
    [super.LockedDynamicArray addObject:_Fball];
    
    [[super physicsNode] setCollisionDelegate:self];
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair EndGame:(CCNode *)nodeA Ball:(CCNode *)nodeB {

    super.End.visible = TRUE;
    [((EndLevel*)super.End) showStars: (3 - super.stars)];

    return NO;
}

@end
