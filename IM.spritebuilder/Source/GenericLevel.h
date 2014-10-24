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

//objetos que se mueven
@property (nonatomic,strong)    NSMutableArray* AllMovableArray;
//objetos que tienen fisica estatica
@property (nonatomic,strong)    NSMutableArray* StaticArray;
//objetos que tienen fisica dinamica
@property (nonatomic,strong)    NSMutableArray* DynamicArray;
// objetos con fisica dinamica que el usuario no puede mover
@property (nonatomic,strong)    NSMutableArray* LockedDynamicArray;
// nodo de fisica
@property (nonatomic,strong)    CCPhysicsNode* physicsNode;
// end
@property (nonatomic,strong) CCNode* End;

@property (assign) int stars;



@end
