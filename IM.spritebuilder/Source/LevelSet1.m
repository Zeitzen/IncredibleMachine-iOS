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

- (void)loadLevel: (NSString *) level {
    CCNode *gameplay = [CCBReader load:level];
    gameplay.name=@"gameplay";
    
    LevelWrapper* LevelFrame = (LevelWrapper*)[CCBReader loadAsScene:@"LevelFrame"];
    
    //SideMenu* menu =(SideMenu*)[LevelFrame getMenu];
    //[[menu Label] setString: @"fd"];
    CCNode* aux = LevelFrame.children.firstObject;
    [aux addChild:gameplay z:-10];
    
    [[CCDirector sharedDirector] pushScene:self];
    
    [[CCDirector sharedDirector] replaceScene:LevelFrame];
}

- (void)level1_1 {
    [self loadLevel: @"Level1_1"];
}

- (void)level1_2 {
    [self loadLevel: @"Level1_2"];
}

-(void)back{
    CCScene *gameplayScene = [CCBReader loadAsScene:@"LevelSets"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
