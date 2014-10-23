//
//  EndLevel.m
//  IM
//
//  Created by Damian Rizzotto on 22/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "EndLevel.h"

@implementation EndLevel{
    CCNode* _StarOn1;
    CCNode* _StarOn2;
    CCNode* _StarOn3;
}

-(void)levels{
    [[CCDirector sharedDirector] popScene];
}

-(void) showStars: (int) stars{
    CCLOG(@"%i",stars);

    if(stars >=1)
        [self showStar:_StarOn1];
    if(stars >=2)
        [self showStar:_StarOn2];
    if(stars >=3)
        [self showStar:_StarOn3];
}

-(void)showStar:(CCNode*) button{
    
    float duration = 0.1f;
    id show = [CCActionFadeTo actionWithDuration:0 opacity:1 ];
    id scaleUp = [CCActionScaleTo actionWithDuration:duration scaleX:0.8f scaleY:0.8f];
    id scaleDown = [CCActionScaleTo actionWithDuration:duration scaleX:0.7f scaleY:0.7f];
    id buttonAction = [CCActionSequence actions: show,scaleUp,scaleDown, nil];
    [button runAction:buttonAction];
}

- (void) next{
    LevelWrapper* lr = ((LevelWrapper*)_parent.parent);
    int levelNum = lr.levelNum;
    int levelSet = lr.levelSet;
    
    levelNum++;
    
    if(levelNum == 8){
        levelNum = 1;
        levelSet++;
    }
    
    if(levelSet > 1){
        [[CCDirector sharedDirector]  popScene];
    }else{
        [lr changeLevel:levelNum levelSet:levelSet];
    }
}

- (void) retry{
    [((LevelWrapper*)_parent.parent) retry];
}

@end
