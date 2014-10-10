//
//  Level2.m
//  IM
//
//  Created by Damian Rizzotto on 02/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level1_1.h"


@implementation Level1_1 {
    CCNode *_BowBall;
    CCNode *_TBall;
}

- (void)didLoadFromCCB {
    [super.SpriteArray addObject:_BowBall];
    [super.SpriteArray addObject:_TBall];
}


@end
