//
//  Level1_4.m
//  IM
//
//  Created by Damian Rizzotto on 24/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level1_4.h"

@implementation Level1_4 {
    CCNode* _fball1;
    CCNode* _fball2;
    CCNode* _tball;
    CCNode* _book1;
    //CCNode* _book2;
    CCNode* _shelf1;
    CCSprite* _Mini1;
    //CCSprite* _Mini2;
    
}

- (void)didLoadFromCCB {
    [super.MiniArray addObject:_Mini1];
    //[super.MiniArray addObject:_Mini2];
    
    [super.StaticArray addObject:_shelf1];
   // [super.StaticArray addObject:_book2];
    [super.AllMovableArray addObject:_shelf1];
   // [super.AllMovableArray addObject:_book2];
    
    [super.LockedDynamicArray addObject:_fball1];
    [super.LockedDynamicArray addObject:_fball2];
    [super.LockedDynamicArray addObject:_tball];
    
    [super.LockedDynamicArray addObject:_book1];
    
    [[super physicsNode] setCollisionDelegate:self];
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair EndGame:(CCNode *)nodeA TBall:(CCNode *)nodeB {
    
    super.End.visible = TRUE;
    [((EndLevel*)super.End) showStars: (3 - super.stars)];
    
    return NO;
}

@end
