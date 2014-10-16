//
//  LevelSet1.m
//  IM
//
//  Created by Damian Rizzotto on 06/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "LevelSet1.h"
#import "LevelWrapper.h"

@implementation LevelSet1

- (void)level1_1 {
    CCNode *gameplay = [CCBReader load:@"Level1_1"];
    gameplay.name=@"gameplay";
    
    CCScene *LevelFrame = [CCBReader loadAsScene:@"LevelFrame"];
    CCNode* aux = LevelFrame.children.firstObject;
    [aux addChild:gameplay z:-10];
    
    [[CCDirector sharedDirector] pushScene:self];
    
    [[CCDirector sharedDirector] replaceScene:LevelFrame];
}

-(void)back{
    CCScene *gameplayScene = [CCBReader loadAsScene:@"LevelSets"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end