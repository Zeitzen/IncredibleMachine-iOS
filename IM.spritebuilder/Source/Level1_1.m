//
//  Level2.m
//  IM
//
//  Created by Damian Rizzotto on 02/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level1_1.h"


@implementation Level1_1 {
    CCNode *_shelf1;
    CCNode *_shelf2;
    CCNode* _ball1;
    CCNode* _ball2;
}

- (void)didLoadFromCCB {
    [super.SpriteArray addObject:_shelf1];
    [super.SpriteArray addObject:_shelf2];
    [super.SpriteArray addObject:_ball1];
    [super.SpriteArray addObject:_ball2];

}


@end
