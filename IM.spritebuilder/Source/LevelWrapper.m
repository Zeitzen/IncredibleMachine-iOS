//
//  Set1Wrapper.m
//  IM
//
//  Created by Damian Rizzotto on 09/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "LevelWrapper.h"

@implementation LevelWrapper{
    CCNode* _gameplay;
    Boolean started;
}

-(id)init{
    started = FALSE;
    return [super init];
}

-(void)animate:(CCButton*) button{
    float duration = 0.075f;
    id scaleUp = [CCActionScaleTo actionWithDuration:duration scaleX:1.25f scaleY:1.25f];
    id scaleDown = [CCActionScaleTo actionWithDuration:duration scaleX:1.0f scaleY:1.0f];
    id buttonAction = [CCActionSequence actions: scaleUp,scaleDown, nil];
    [button runAction:buttonAction];
}

-(void) showPlay{
    id move = [CCActionMoveBy actionWithDuration:0.4f position:ccp(55,0)];
    [_playBg runAction:move];
    id move2 = [CCActionMoveBy actionWithDuration:0.4f position:ccp(55,0)];
    [_playButton runAction:move2];
}

-(void) hidePlay{
    id move = [CCActionMoveBy actionWithDuration:0.4f position:ccp(-55,0)];
    [_playBg runAction:move];
    id move2 = [CCActionMoveBy actionWithDuration:0.4f position:ccp(-55,0)];
    [_playButton runAction:move2];
}

-(void) retry{
    [self changeLevel:_levelNum levelSet:_levelSet];
}

-(void) changeLevel:(int)levelNum levelSet: (int) levelSet{
    _levelSet = levelSet;
    _levelNum = levelNum;
    
    [[(SideMenu*)_menu Label] setString: [NSString stringWithFormat:@"%i - %i",levelSet,levelNum]];
    
    CCSpriteFrame *startNormalImage;
    startNormalImage = [CCSpriteFrame frameWithImageNamed:@"images/GUI/PZ_GUI_PlayButtonSmall.png"];
    [_playButton setBackgroundSpriteFrame:startNormalImage forState:CCControlStateNormal];
    started = FALSE;

    CCNode *nextGameplay = [CCBReader load:[NSString stringWithFormat:@"Levels/Level%i_%i",levelSet,levelNum]];
    nextGameplay.name=@"gameplay";
    
    if(_gameplay ==NULL){
        [[self getChildByName:@"gameplay" recursively:TRUE] removeFromParent];
    }else{
        [_gameplay removeFromParent];
        _gameplay = NULL;
    }
    [self addChild:nextGameplay z:-10];
}


-(void)play{
    
    [self animate:_playButton];
    
    if(_gameplay==NULL)
        _gameplay = [self getChildByName:@"gameplay" recursively:TRUE];
    
    CCSpriteFrame *startNormalImage;
    
    if(started){
        [_menu runAction:[CCActionMoveBy actionWithDuration:0.5f position:ccp(50,0)]];
        startNormalImage = [CCSpriteFrame frameWithImageNamed:@"images/GUI/PZ_GUI_PlayButtonSmall.png"];
        started = FALSE;
    }else{
        [_menu runAction:[CCActionMoveBy actionWithDuration:0.5f position:ccp(-50,0)]];
        startNormalImage = [CCSpriteFrame frameWithImageNamed:@"images/GUI/PZ_GUI_StopButton.png"];
        started = TRUE;
    }
    
    [_playButton setBackgroundSpriteFrame:startNormalImage forState:CCControlStateNormal];
                                       
    [(GenericLevel*)_gameplay play];
}


@end
