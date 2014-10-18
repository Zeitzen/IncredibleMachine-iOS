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
    CCButton* _play;
    Boolean started;
}

-(id)init{
    started = FALSE;
    return [super init];
}

-(void)play{
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
