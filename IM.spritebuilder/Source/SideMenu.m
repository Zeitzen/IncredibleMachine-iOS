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
}

- (id)init {
    displacement=0;
    menuOpen = FALSE;
    return [super init];
}

- (void)update:(CCTime)delta {
    if(menuOpen && displacement != 100){
        self.position = ccp(self.position.x + 10,self.position.y);
        displacement+=10;
        ((LevelWrapper*)_parent).BlackBg.opacity+=0.05;
    }
    if(!menuOpen && displacement != 0){
        self.position = ccp(self.position.x - 10,self.position.y);
        displacement-=10;
        ((LevelWrapper*)_parent).BlackBg.opacity-=0.05;
        
    }
}

-(void)menu{
    menuOpen = !menuOpen;
}

-(void)retry{
    CCNode *gameplay = [CCBReader load:@"Level1_1"];
    gameplay.name=@"gameplay";
    
    CCScene *LevelFrame = [CCBReader loadAsScene:@"LevelFrame"];
    CCNode* aux = LevelFrame.children.firstObject;
    [aux addChild:gameplay z:-10];
    
    [[CCDirector sharedDirector] replaceScene:LevelFrame];

}

-(void)levels{
    [[CCDirector sharedDirector] popScene];
}

-(void)sound{
    CCSpriteFrame *startNormalImage;

    //startNormalImage = [CCSpriteFrame frameWithImageNamed:@"images/GUI/PZ_GUI_SoundOnButton.png"];

    startNormalImage = [CCSpriteFrame frameWithImageNamed:@"images/GUI/PZ_GUI_SoundOffButton.png"];

    [_sound setBackgroundSpriteFrame:startNormalImage forState:CCControlStateNormal];
    
}

@end
