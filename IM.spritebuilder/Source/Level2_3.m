//
//  Level2_3.m
//  IM
//
//  Created by Damian Rizzotto on 24/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level2_3.h"

@implementation Level2_3 {
    int tballs;
    CCNode* _tball1;
    CCNode* _tball2;
    CCNode* _Pipe;
    
    CCSprite* _Mini;
}

-(id)init{
    id aux = [super init];
    tballs=2;
    return aux;
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
    tballs--;
    
    if(tballs==0){
        super.End.visible = TRUE;
        [((EndLevel*)super.End) showStars: (3 - super.stars)];
        
        tballs = 2;
    }
    return NO;
}

@end
