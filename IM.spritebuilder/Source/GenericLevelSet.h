//
//  GenericLevelSet.h
//  IM
//
//  Created by Damian Rizzotto on 30/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCScene.h"
#import "LevelStars.h"
#import "LevelWrapper.h"
#import "SideMenu.h"

@interface GenericLevelSet : CCScene

- (void)loadLevel: (int) levelNum;

@property (assign) int setNum;
@property (nonatomic,strong) NSString* setName;

@end
