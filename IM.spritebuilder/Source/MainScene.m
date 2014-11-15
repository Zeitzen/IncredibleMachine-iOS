//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene

-(id)init{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   //if ([defaults objectForKey:@"set1"] == nil ){
    
        NSMutableArray* aux =[[NSMutableArray alloc] initWithCapacity:8];
        [aux addObject:@0];
        [aux addObject:@0];
        [aux addObject:@0];
        [aux addObject:@0];
        [aux addObject:@0];
        [aux addObject:@0];
        [aux addObject:@0];
        [aux addObject:@0];
        [defaults setObject:aux forKey:@"set1"];
        [defaults setObject:aux forKey:@"set2"];
    
        [defaults synchronize];

        [defaults setBool:TRUE forKey:@"sound"];
   //}
    
    return [super init];
}

- (void)play {
    
    float duration = 0.075f;
    id scaleUp = [CCActionScaleTo actionWithDuration:duration scaleX:1.25f scaleY:1.25f];
    id scaleDown = [CCActionScaleTo actionWithDuration:duration scaleX:1.0f scaleY:1.0f];
    id call = [CCActionCallFunc actionWithTarget:self selector:@selector(changeScene)];
    id buttonAction = [CCActionSequence actions: scaleUp,scaleDown, call, nil];
    [_Button runAction:buttonAction];
}

-(void) changeScene{
    CCScene *gameplayScene = [CCBReader loadAsScene:@"LevelSets"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
