//
//  Set1Wrapper.m
//  IM
//
//  Created by Damian Rizzotto on 09/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Set1Wrapper.h"
#import "Level1_1.h"

@implementation Set1Wrapper{
    CCNode* _gameplay;
    CCNode* _menu;
    Boolean menuOpen;
    int displacement;
    CCSprite* _BlackBg;
}

- (void)didLoadFromCCB {
    displacement=0;
    menuOpen = FALSE;
}

-(void)play{
    [(Level1_1*)_gameplay play];
}

-(void)menu{
    menuOpen = !menuOpen;
}

- (void)update:(CCTime)delta {
    if(menuOpen && displacement != 100){
        _menu.position = ccp(_menu.position.x + 5,_menu.position.y);
        displacement+=5;
        _BlackBg.opacity+=0.02;
    }
    if(!menuOpen && displacement != 0){
        _menu.position = ccp(_menu.position.x - 5,_menu.position.y);
        displacement-=5;
        _BlackBg.opacity-=0.02;

    }
}

@end
