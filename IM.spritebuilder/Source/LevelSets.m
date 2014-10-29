//
//  LevelSets.m
//  IM
//
//  Created by Damian Rizzotto on 06/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "LevelSets.h"

@implementation LevelSets

- (void)set_1 {
    
    float duration = 0.075f;
    id scaleUp = [CCActionScaleTo actionWithDuration:duration scaleX:0.85f scaleY:0.85f];
    id scaleDown = [CCActionScaleTo actionWithDuration:duration scaleX:0.7f scaleY:0.7f];
    id call = [CCActionCallFunc actionWithTarget:self selector:@selector(changeset1)];
    id buttonAction = [CCActionSequence actions: scaleUp,scaleDown, call, nil];
    [_set1 runAction:buttonAction];
}

-(void) changeset1{
    CCScene *gameplayScene = [CCBReader loadAsScene:@"LevelSet1"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

- (void)set_2 {
    
    float duration = 0.075f;
    id scaleUp = [CCActionScaleTo actionWithDuration:duration scaleX:0.85f scaleY:0.85f];
    id scaleDown = [CCActionScaleTo actionWithDuration:duration scaleX:0.7f scaleY:0.7f];
    id call = [CCActionCallFunc actionWithTarget:self selector:@selector(changeset2)];
    id buttonAction = [CCActionSequence actions: scaleUp,scaleDown, call, nil];
    [_set2 runAction:buttonAction];
}

-(void) changeset2{
    CCScene *gameplayScene = [CCBReader loadAsScene:@"LevelSet2"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}


-(void)goBack{
    
    float duration = 0.075f;
    id scaleUp = [CCActionScaleTo actionWithDuration:duration scaleX:1.25f scaleY:1.25f];
    id scaleDown = [CCActionScaleTo actionWithDuration:duration scaleX:1.0f scaleY:1.0f];
    id call = [CCActionCallFunc actionWithTarget:self selector:@selector(changeBack)];
    id buttonAction = [CCActionSequence actions: scaleUp,scaleDown, call, nil];
    [_back runAction:buttonAction];
}

-(void) changeBack{
    CCScene *gameplayScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
