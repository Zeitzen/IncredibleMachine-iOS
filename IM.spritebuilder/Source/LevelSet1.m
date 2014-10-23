//
//  LevelSet1.m
//  IM
//
//  Created by Damian Rizzotto on 06/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "LevelSet1.h"
#import "LevelWrapper.h"
#import "SideMenu.h"

@implementation LevelSet1

- (void)loadLevel: (int) levelNum  levelSet: (int) levelSet {
    
    NSString* level = [NSString stringWithFormat:@"Levels/Level%i_%i",levelSet,levelNum];

    CCNode *gameplay = [CCBReader load:level];
    gameplay.name=@"gameplay";
    
    LevelWrapper* LevelFrame = (LevelWrapper*)[CCBReader loadAsScene:@"LevelFrame"];
    
    ((LevelWrapper*) LevelFrame.children[0]).levelNum=levelNum;
    ((LevelWrapper*) LevelFrame.children[0]).levelSet=levelSet;
    
    [[(SideMenu*)[LevelFrame.children[0] menu] Label] setString: [NSString stringWithFormat:@"%i - %i",levelSet,levelNum]];
    
    CCNode* aux = LevelFrame.children.firstObject;
    [aux addChild:gameplay z:-10];
    
    [[CCDirector sharedDirector] pushScene:self];
    
    [[CCDirector sharedDirector] replaceScene:LevelFrame];
}

- (void)level1_1 {
    [self loadLevel:1 levelSet:1];
}

- (void)level1_2 {
    [self loadLevel:2 levelSet:1];
}

- (void)level1_3 {
    [self loadLevel:3 levelSet:1];
}

- (void)level1_4 {
    [self loadLevel:4 levelSet:1];
}

- (void)level1_5 {
    [self loadLevel:5 levelSet:1];
}

- (void)level1_6 {
    [self loadLevel:6 levelSet:1];
}

- (void)level1_7 {
    [self loadLevel:7 levelSet:1];
}

- (void)level1_8 {
    [self loadLevel:8 levelSet:1];
}


-(void)back{
    CCScene *gameplayScene = [CCBReader loadAsScene:@"LevelSets"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
