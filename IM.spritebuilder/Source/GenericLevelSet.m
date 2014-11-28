//
//  GenericLevelSet.m
//  IM
//
//  Created by Damian Rizzotto on 30/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GenericLevelSet.h"

@implementation GenericLevelSet{
    CCNode* _L1;
    CCNode* _L2;
    CCNode* _L3;
    CCNode* _L4;
    CCNode* _L5;
    CCNode* _L6;
    
    CCNode* _back;
    
    LevelStars* _S1;
    LevelStars* _S2;
    LevelStars* _S3;
    LevelStars* _S4;
    LevelStars* _S5;
    LevelStars* _S6;
}

-(void)onEnter{
    [super onEnter];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray* save = [[defaults arrayForKey:_setName] mutableCopy];
    
    [_S1 showStars:[[save objectAtIndex:0] integerValue]];
    [_S2 showStars:[[save objectAtIndex:1] integerValue]];
    [_S3 showStars:[[save objectAtIndex:2] integerValue]];
    [_S4 showStars:[[save objectAtIndex:3] integerValue]];
    [_S5 showStars:[[save objectAtIndex:4] integerValue]];
    [_S6 showStars:[[save objectAtIndex:5] integerValue]];
}

- (void)loadLevel: (int) levelNum {
    
    NSString* level = [NSString stringWithFormat:@"Levels/Level%i_%i",_setNum,levelNum];
    
    CCNode *gameplay = [CCBReader load:level];
    gameplay.name=@"gameplay";
    
    LevelWrapper* LevelFrame = (LevelWrapper*)[CCBReader loadAsScene:@"LevelFrame"];
    
    ((LevelWrapper*) LevelFrame.children[0]).levelNum=levelNum;
    ((LevelWrapper*) LevelFrame.children[0]).levelSet=_setNum;
    
    [[(SideMenu*)[LevelFrame.children[0] menu] Label] setString: [NSString stringWithFormat:@"%i - %i",_setNum,levelNum]];
    
    CCNode* aux = LevelFrame.children.firstObject;
    [aux addChild:gameplay z:-10];
    
    [[CCDirector sharedDirector] pushScene:self];
    
    [[CCDirector sharedDirector] replaceScene:LevelFrame];
}

-(void)animateAndCall:(CCNode*) n star: (CCNode*) star levelnum: (int) lnum{
    float duration = 0.075f;
    id scaleUp = [CCActionScaleTo actionWithDuration:duration scaleX:1.2f scaleY:1.2f];
    id scaleDown = [CCActionScaleTo actionWithDuration:duration scaleX:1.0f scaleY:1.0f];
    id call = [CCActionCallBlock actionWithBlock:^{ [self loadLevel:lnum]; }];
    
    id buttonAction = [CCActionSequence actions: scaleUp,scaleDown, call, nil];
    id starAction = [CCActionSequence actions: scaleUp,scaleDown, nil];
    
    [n runAction:buttonAction];
    
    [star runAction:starAction];
}

- (void)level1 {
    [self animateAndCall:_L1 star:_S1 levelnum:1 ];
}

- (void)level2 {
    [self animateAndCall:_L2 star:_S2 levelnum:2 ];
}

- (void)level3 {
    [self animateAndCall:_L3 star:_S3 levelnum:3 ];
}

- (void)level4 {
    [self animateAndCall:_L4 star:_S4 levelnum:4 ];
}

- (void)level5 {
    [self animateAndCall:_L5 star:_S5 levelnum:5 ];
}

- (void)level6 {
    [self animateAndCall:_L6 star:_S6 levelnum:6 ];
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
