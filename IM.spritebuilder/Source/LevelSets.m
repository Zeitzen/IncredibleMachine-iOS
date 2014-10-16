//
//  LevelSets.m
//  IM
//
//  Created by Damian Rizzotto on 06/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "LevelSets.h"

@implementation LevelSets

- (void)set {
    CCScene *gameplayScene = [CCBReader loadAsScene:@"LevelSet1"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

-(void)back{
    CCScene *gameplayScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
