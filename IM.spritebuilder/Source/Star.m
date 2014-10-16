//
//  Star.m
//  IM
//
//  Created by Damian Rizzotto on 16/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Star.h"

@implementation Star

- (void)didLoadFromCCB {
    self.physicsBody.collisionType = @"star";
    CCLOG(@"lodeo tag");
}

@end
