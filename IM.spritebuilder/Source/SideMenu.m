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
        [((LevelWrapper*)_parent) showPlay];
        [self runAction:[CCActionMoveTo actionWithDuration:duration position:ccp(54,0)]];
        [((LevelWrapper*)_parent).BlackBg runAction:[CCActionFadeTo actionWithDuration:duration opacity:0.0f]];
        menuOpen = FALSE;

    }else{
        [((LevelWrapper*)_parent) hidePlay];
        [self runAction:[CCActionMoveTo actionWithDuration:duration position:ccp(150,0)]];
        [((LevelWrapper*)_parent).BlackBg runAction:[CCActionFadeTo actionWithDuration:duration opacity:0.3f]];
        menuOpen = TRUE;
    }
}

-(void)retry{
    
    float duration = 0.075f;
    id scaleUp = [CCActionScaleTo actionWithDuration:duration scaleX:1.25f scaleY:1.25f];
    id scaleDown = [CCActionScaleTo actionWithDuration:duration scaleX:1.0f scaleY:1.0f];
    id call = [CCActionCallFunc actionWithTarget:self selector:@selector(menu)];
    id call2 = [CCActionCallFunc actionWithTarget:((LevelWrapper*)_parent) selector:@selector(retry)];
    id buttonAction = [CCActionSequence actions: scaleUp,scaleDown, call, call2, nil];
    [_retry runAction:buttonAction];
}

-(void)levels{
    
    float duration = 0.075f;
    id scaleUp = [CCActionScaleTo actionWithDuration:duration scaleX:1.25f scaleY:1.25f];
    id scaleDown = [CCActionScaleTo actionWithDuration:duration scaleX:1.0f scaleY:1.0f];
    id call = [CCActionCallFunc actionWithTarget:self selector:@selector(pop)];
    id delay = [CCActionDelay actionWithDuration:0.2f];
    id buttonAction = [CCActionSequence actions: scaleUp,scaleDown,delay, call, nil];
    [_levels runAction:buttonAction];
}

-(void) pop{
    [[CCDirector sharedDirector]  popScene];
}

@end
