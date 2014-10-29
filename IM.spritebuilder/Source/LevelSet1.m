//
//  LevelSet1.m
//  IM
//
//  Created by Damian Rizzotto on 06/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "LevelSet1.h"


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
    
    LevelStars* _S1;
    LevelStars* _S2;
    LevelStars* _S3;
    LevelStars* _S4;
    LevelStars* _S5;
    LevelStars* _S6;
    LevelStars* _S7;
    LevelStars* _S8;
}

-(void)onEnter{
    [super onEnter];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    NSMutableArray* save = [[defaults arrayForKey:@"set1"] mutableCopy];
    
    [_S1 showStars:[[save objectAtIndex:0] integerValue]];
    [_S2 showStars:[[save objectAtIndex:1] integerValue]];
    [_S3 showStars:[[save objectAtIndex:2] integerValue]];
    [_S4 showStars:[[save objectAtIndex:3] integerValue]];
    [_S5 showStars:[[save objectAtIndex:4] integerValue]];
    [_S6 showStars:[[save objectAtIndex:5] integerValue]];
    [_S7 showStars:[[save objectAtIndex:6] integerValue]];
    [_S8 showStars:[[save objectAtIndex:7] integerValue]];
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

-(void)animateAndCall:(CCNode*) n star: (CCNode*) star levelnum: (int) lnum levelset: (int) lset{
    float duration = 0.075f;
    id scaleUp = [CCActionScaleTo actionWithDuration:duration scaleX:1.2f scaleY:1.2f];
    id scaleDown = [CCActionScaleTo actionWithDuration:duration scaleX:1.0f scaleY:1.0f];
    id call = [CCActionCallBlock actionWithBlock:^{ [self loadLevel:lnum levelSet:lset]; }];
    
    id buttonAction = [CCActionSequence actions: scaleUp,scaleDown, call, nil];
    id starAction = [CCActionSequence actions: scaleUp,scaleDown, nil];

    [n runAction:buttonAction];
    
    [star runAction:starAction];
}

- (void)level1_1 {
    [self animateAndCall:_L1 star:_S1 levelnum:1 levelset:1];
}

- (void)level1_2 {
    [self animateAndCall:_L2 star:_S2 levelnum:2 levelset:1];
}

- (void)level1_3 {
    [self animateAndCall:_L3 star:_S3 levelnum:3 levelset:1];
}

- (void)level1_4 {
    [self animateAndCall:_L4 star:_S4 levelnum:4 levelset:1];
}

- (void)level1_5 {
    [self animateAndCall:_L5 star:_S5 levelnum:5 levelset:1];
}

- (void)level1_6 {
    [self animateAndCall:_L6 star:_S6 levelnum:6 levelset:1];
}

- (void)level1_7 {
    [self animateAndCall:_L7 star:_S7 levelnum:7 levelset:1];
}

- (void)level1_8 {
    [self animateAndCall:_L8 star:_S8 levelnum:8 levelset:1];
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
