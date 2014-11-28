//
//  Set1Wrapper.h
//  IM
//
//  Created by Damian Rizzotto on 09/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCScene.h"
#import "GenericLevel.h"
#import "SideMenu.h"
@interface LevelWrapper : CCScene


-(void) retry;

-(void) changeLevel:(int)levelNum levelSet: (int) levelSet;
    
-(void) animate:(CCButton*) button;

-(void) play;

-(void) hidePlay;

-(void) showPlay;

@property (nonatomic,strong) CCButton* playButton;
@property (nonatomic,strong) CCNode* playBg;
@property (assign) int levelNum;
@property (assign) int levelSet;
@property (nonatomic,strong) CCNode* menu;
@property (nonatomic,strong) CCNode* BlackBg;

@end
