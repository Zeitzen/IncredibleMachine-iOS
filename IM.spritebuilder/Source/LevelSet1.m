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

@implementation LevelSet1{
    CCNode* _L1;
    CCNode* _L2;
    CCNode* _L3;
    CCNode* _L4;
    CCNode* _L5;
    CCNode* _L6;
    CCNode* _L7;
    CCNode* _L8;
    CCNode* _back;
}

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

-(void)animateAndCall:(CCNode*) n levelnum: (int) lnum levelset: (int) lset{
    float duration = 0.075f;
    id scaleUp = [CCActionScaleTo actionWithDuration:duration scaleX:1.0f scaleY:1.0f];
    id scaleDown = [CCActionScaleTo actionWithDuration:duration scaleX:0.7f scaleY:0.7f];
    id call = [CCActionCallBlock actionWithBlock:^{ [self loadLevel:lnum levelSet:lset]; }];
    id buttonAction = [CCActionSequence actions: scaleUp,scaleDown, call, nil];
    [n runAction:buttonAction];
}
- (void)level1_1 {
    [self animateAndCall:_L1 levelnum:1 levelset:1];
}

- (void)level1_2 {
    [self animateAndCall:_L2 levelnum:2 levelset:1];
}

- (void)level1_3 {
    [self animateAndCall:_L3 levelnum:3 levelset:1];
}

- (void)level1_4 {
    [self animateAndCall:_L4 levelnum:4 levelset:1];
}

- (void)level1_5 {
    [self animateAndCall:_L5 levelnum:5 levelset:1];
}

- (void)level1_6 {
    [self animateAndCall:_L6 levelnum:6 levelset:1];
}

- (void)level1_7 {
    [self animateAndCall:_L7 levelnum:7 levelset:1];
}

- (void)level1_8 {
    [self animateAndCall:_L8 levelnum:8 levelset:1];
}


-(void)back{
    float duration = 0.075f;
    id scaleUp = [CCActionScaleTo actionWithDuration:duration scaleX:1.25f scaleY:1.25f];
    id scaleDown = [CCActionScaleTo actionWithDuration:duration scaleX:1.0f scaleY:1.0f];
    id call = [CCActionCallFunc actionWithTarget:self selector:@selector(doBack)];
    id buttonAction = [CCActionSequence actions: scaleUp,scaleDown, call, nil];
    [_back runAction:buttonAction];
}
-(void) doBack{
    CCScene *gameplayScene = [CCBReader loadAsScene:@"LevelSets"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
