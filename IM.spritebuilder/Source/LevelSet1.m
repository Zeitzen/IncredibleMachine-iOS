//
//  LevelSet1.m
//  IM
//
//  Created by Damian Rizzotto on 06/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "LevelSet1.h"

@implementation LevelSet1

- (void)level1_1 {
    CCScene *gameplayScene = [CCBReader loadAsScene:@"Level1_1"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
