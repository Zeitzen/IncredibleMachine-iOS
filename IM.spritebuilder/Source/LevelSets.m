//
//  LevelSets.m
//  IM
//
//  Created by Damian Rizzotto on 06/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "LevelSets.h"

@implementation LevelSets{
    CCLabelTTF* _score1;
    CCLabelTTF* _score2;
    CCLabelTTF* _scoreTotal;
}

-(void)onEnter{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray* set1 = [[defaults arrayForKey:@"set1"] mutableCopy ];
    NSMutableArray* set2 = [[defaults arrayForKey:@"set2"] mutableCopy ];
    
    int count1=0;
    int count2=0;
    int total=0;
    
    for(int i=0; i<8; i++){
        int aux1=[[set1 objectAtIndex:i] integerValue];
        int aux2=[[set2 objectAtIndex:i] integerValue];
        count1 +=aux1;
        count2 +=aux2;
        total += aux1 + aux2;
    }
    
    [_score1 setString:[NSString stringWithFormat:@"%i/24",count1]];
    [_score2 setString:[NSString stringWithFormat:@"%i/24",count2]];
    [_scoreTotal setString:[NSString stringWithFormat:@"%i",total]];

    [super onEnter];

}

- (void)set_1 {
    
    float duration = 0.075f;
    id scaleUp = [CCActionScaleTo actionWithDuration:duration scaleX:0.85f scaleY:0.85f];
    id scaleDown = [CCActionScaleTo actionWithDuration:duration scaleX:0.7f scaleY:0.7f];
    id call = [CCActionCallFunc actionWithTarget:self selector:@selector(changeset1)];
    id buttonAction = [CCActionSequence actions: scaleUp,scaleDown, call, nil];
    [_set1 runAction:buttonAction];
}

-(void) changeset1{
    CCScene *gameplayScene = [CCBReader loadAsScene:@"LevelSet1"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

- (void)set_2 {
    
    float duration = 0.075f;
    id scaleUp = [CCActionScaleTo actionWithDuration:duration scaleX:0.85f scaleY:0.85f];
    id scaleDown = [CCActionScaleTo actionWithDuration:duration scaleX:0.7f scaleY:0.7f];
    id call = [CCActionCallFunc actionWithTarget:self selector:@selector(changeset2)];
    id buttonAction = [CCActionSequence actions: scaleUp,scaleDown, call, nil];
    [_set2 runAction:buttonAction];
}

-(void) changeset2{
    CCScene *gameplayScene = [CCBReader loadAsScene:@"LevelSet2"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}


-(void)goBack{
    
    float duration = 0.075f;
    id scaleUp = [CCActionScaleTo actionWithDuration:duration scaleX:1.25f scaleY:1.25f];
    id scaleDown = [CCActionScaleTo actionWithDuration:duration scaleX:1.0f scaleY:1.0f];
    id call = [CCActionCallFunc actionWithTarget:self selector:@selector(changeBack)];
    id buttonAction = [CCActionSequence actions: scaleUp,scaleDown, call, nil];
    [_back runAction:buttonAction];
}

-(void) changeBack{
    CCScene *gameplayScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
