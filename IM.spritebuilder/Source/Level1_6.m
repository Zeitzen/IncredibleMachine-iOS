//
//  Level2.m
//  IM
//
//  Created by Damian Rizzotto on 02/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level1_6.h"


@implementation Level1_6 {
    int books;
    CCNode* _shelf1;
    CCNode* _shelf2;
    CCNode* _ball1;
    CCNode* _ball2;
    CCNode* _Book1;
    CCNode* _Book2;
    CCNode* _Book3;
    CCNode* _Book4;
    
    CCSprite* _Mini1;
    CCSprite* _Mini2;
}

-(id)init{
    id aux = [super init];
    books=4;
    return aux;
}

- (void)didLoadFromCCB {
    
    [super.MiniArray addObject:_Mini1];
    [super.MiniArray addObject:_Mini2];
    
    [super.StaticArray addObject:_shelf1];
    [super.StaticArray addObject:_shelf2];
    [super.AllMovableArray addObject:_shelf1];
    [super.AllMovableArray addObject:_shelf2];
    
    [super.LockedDynamicArray addObject:_Book1];
    [super.LockedDynamicArray addObject:_Book2];
    [super.LockedDynamicArray addObject:_Book3];
    [super.LockedDynamicArray addObject:_Book4];
    
    [super.LockedDynamicArray addObject:_ball1];
    [super.LockedDynamicArray addObject:_ball2];
    
    [[super physicsNode] setCollisionDelegate:self];
    
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair Book:(CCNode *)nodeA EndGame:(CCNode *)nodeB {
    books--;
    
    if(books==0){
        super.End.visible = TRUE;
        [((EndLevel*)super.End) showStars: (3 - super.stars)];
        
        books = 4;
    }
    return NO;
}


@end
