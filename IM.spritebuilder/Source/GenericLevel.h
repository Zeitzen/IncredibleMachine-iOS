//
//  GenericLevel.h
//  IM
//
//  Created by Damian Rizzotto on 10/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface GenericLevel: CCNode <CCPhysicsCollisionDelegate>


-(void)play;

@property (nonatomic,strong)    NSMutableArray* SpriteArray;
@property (nonatomic,strong)    NSMutableArray* MovArray;


@end
