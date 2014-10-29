//
//  LevelStars.m
//  IM
//
//  Created by Damian Rizzotto on 29/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "LevelStars.h"

@implementation LevelStars{
    CCNode* _StarOn1;
    CCNode* _StarOn2;
    CCNode* _StarOn3;
}

-(void)showStars:(int)stars{
    
    CCLOG(@"%i",stars);
    switch (stars) {
        case 0:
            return;
        case 3:
            _StarOn3.opacity=1;
        case 2:
            _StarOn2.opacity=1;
        case 1:
            _StarOn1.opacity=1;
        default:
            break;
    }
    
}

@end
