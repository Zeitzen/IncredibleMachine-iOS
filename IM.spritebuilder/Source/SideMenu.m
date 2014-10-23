//
//  SideMenu.m
//  IM
//
//  Created by Damian Rizzotto on 14/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "SideMenu.h"

@implementation SideMenu{
    Boolean menuOpen;
    int displacement;
    CCButton* _sound;
    
    CCButton* _menu;
    CCButton* _retry;
    CCButton* _levels;
}

- (id)init {
    displacement=0;
    menuOpen = FALSE;
    return [super init];
}

-(void)menu{
    
    [((LevelWrapper*)_parent) animate:_menu];

    float duration = 0.3f;
    if(menuOpen){
        [self runAction:[CCActionMoveTo actionWithDuration:duration position:ccp(54,0)]];
        [((LevelWrapper*)_parent).BlackBg runAction:[CCActionFadeTo actionWithDuration:duration opacity:0.0f]];
        menuOpen = FALSE;

    }else{
        [self runAction:[CCActionMoveTo actionWithDuration:duration position:ccp(150,0)]];
        [((LevelWrapper*)_parent).BlackBg runAction:[CCActionFadeTo actionWithDuration:duration opacity:0.3f]];
        menuOpen = TRUE;
    }
}

-(void)retry{
    
    [((LevelWrapper*)_parent) animate:_retry];

    [((LevelWrapper*)_parent) retry];
}

-(void)levels{
    
    [((LevelWrapper*)_parent) animate:_retry];
    
    [[CCDirector sharedDirector]  popScene];
}

-(void)sound{
    
    [((LevelWrapper*)_parent) animate:_sound];

    
    CCSpriteFrame *startNormalImage;

    //startNormalImage = [CCSpriteFrame frameWithImageNamed:@"images/GUI/PZ_GUI_SoundOnButton.png"];

    startNormalImage = [CCSpriteFrame frameWithImageNamed:@"images/GUI/PZ_GUI_SoundOffButton.png"];

    [_sound setBackgroundSpriteFrame:startNormalImage forState:CCControlStateNormal];
    
}

@end
