//
//  Set1Wrapper.m
//  IM
//
//  Created by Damian Rizzotto on 09/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "LevelWrapper.h"
#import <CCActionInterval.h>

@implementation LevelWrapper{
    CCNode* _gameplay;
    CCButton* _play;
    Boolean started;
    NSString* level;
}

-(id)init{
    started = FALSE;
    return [super init];
}

-(void)play{
    
    
//    id scaleHorDown = [CCScaleTo actionWithDuration:duration 5/30.f scaleX:0.75f scaleY:1.0f];
//    
//    id scaleHorBouncing = [CCEaseBounceIn actionWithAction:scaleHorDown];
//    id scaleVerDown = [CCScaleTo actionWithDuration:duration 5/30.f scaleX:1.0f scaleY:0.65f];
//    id scaleVerBouncing = [CCEaseBounceInOut actionWithAction:scaleVerDown];
//    
//    id shrink = [CCSequence actions:scaleHorBouncing,scaleVerBouncing, nil];
//    
//    id swell = [CCScaleTo actionWithDuration: duration * 15/30.f scale:1.10f];
//    id swellEase = [CCEaseElasticOut actionWithAction:swell];
//    
//    id resetScale = [CCScaleTo actionWithDuration:duration * 5/30.f scale:1.0f];
//    id resetScaleBouncing = [CCEaseInOut actionWithAction:resetScale];
//    
//    id buttonAction = [CCSequence actions: shrink, swellEase, resetScaleBouncing, nil];
//    
//    [self runAction:buttonAction];
    
    if(_gameplay==NULL)
        _gameplay = [self getChildByName:@"gameplay" recursively:TRUE];
    
    CCSpriteFrame *startNormalImage;
    
    if(started){
        startNormalImage = [CCSpriteFrame frameWithImageNamed:@"images/GUI/PZ_GUI_PlayButtonSmall.png"];
        started = FALSE;
    }else{
        startNormalImage = [CCSpriteFrame frameWithImageNamed:@"images/GUI/PZ_GUI_StopButton.png"];
        started = TRUE;
    }
    
    [_play setBackgroundSpriteFrame:startNormalImage forState:CCControlStateNormal];
                                       
    [(Level1_1*)_gameplay play];
}


@end
